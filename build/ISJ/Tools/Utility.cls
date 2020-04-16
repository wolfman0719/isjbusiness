Class ISJ.Tools.Utility Extends %Base
{

ClassMethod FindSimilarAccountName() As %Status [ Language = objectscript ]
{
  set status = $$$OK
  set threshold = 0.8  //同一アカウント名の可能性のある類似度の閾値
  
  try {
    //ISJ.Resultsレコードのアカウント名とISJ.Master.AMのアカウント名の類似度を計算し、最も類似度が高いものを選択
    //
  
    /* ISJ.Resultsを全件取得 */
    kill ^similarity
    set allrecords = "select id,accountname,year from ISJ.Results"
    set statement = ##class(%SQL.Statement).%New()
    set qstatus = statement.%Prepare(allrecords)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus)
        $$$ThrowStatus(qstatus)	    
    }
    set rset = statement.%Execute()
    while rset.%Next() {
      set id = rset.id
      set accountname1 = rset.accountname
      set year = rset.year
      if year < 2005 set year = 2005  //2005年より前は、2005年のマスターで代用
      set byyear = "select accountname,am from isj_master.am where year = ?"
      set statement2 = ##class(%SQL.Statement).%New()
      set qstatus = statement2.%Prepare(byyear)
      if qstatus'=$$$OK {
	      write "%Prepare失敗:" 
	      do $System.Status.DisplayError(qstatus)
	      $$$ThrowStatus(qstatus)
	  }
      set rset2 = statement2.%Execute(year)
      kill result
      while rset2.%Next() {
	    set accountname2 = rset2.accountname
	    set an1 = $zcvt(accountname1,"U")
	    set an2 = $zcvt(accountname2,"U")
	    //先頭3文字が異なれば、違うアカウントとみなし類似度の計算は行わない(処理高速化のため)
	    if $extract(an1,1,3) '= $extract(an2,1,3) continue
	    set commandline = "python3 similarity.py """_an1_""" "_""""_an2_""""
	    open "|CPIPE|1":commandline:"QR"
	    use "|CPIPE|1" read result
	    close "|CPIPE|1"
	    set result(result) = $listbuild(accountname1,accountname2,rset2.am)
	    
      }
    
      set last = $order(result(""),-1)
      if last '= "" {
	      if +last > threshold {
		    if (+last '= 1) {
			  set ^similarity(id) = $listbuild(last)_result(last)
		    } 
	      }
      }
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }  
  
  quit status
}

ClassMethod SimilarAccountName(AccountName As %String, Year As %Integer) As %String [ Language = objectscript ]
{
  // 戻り値　$list(近似値,対象アカウント名,近似アカウント名,判定フラグ)
	
  if Year < 2005 set Year = 2005
  set SimilarName = ""
  set threshold1 = 0.93  //同一アカウント名とみなす類似度の閾値
  set threshold2 = 0.80  //同一アカウント名の可能性のある類似度の閾値
  set accountname1 = AccountName
  
  try {
    set byyear = "select accountname from isj_master.am where year = ?"
    set statement = ##class(%SQL.Statement).%New()
    set qstatus = statement.%Prepare(byyear)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus)
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement.%Execute(Year)
    kill result
    while rset.%Next() {
	  set accountname2 = rset.accountname
	  set an1 = $zcvt(accountname1,"U")
	  set an2 = $zcvt(accountname2,"U")	 
	  //先頭3文字が異なれば、違うアカウントとみなし類似度の計算は行わない(処理高速化のため)
	  if $extract(an1,1,3) '= $extract(an2,1,3) continue
	  set commandline = "python3 similarity.py """_an1_""" "_""""_an2_""""
	  open "|CPIPE|1":commandline:"QR"
	  use "|CPIPE|1" read result
	  close "|CPIPE|1"
	  set result(result) = $listbuild(accountname1,accountname2)
	  if +result > threshold1 quit
	    
    }
  
    // lastは最も類似度が高い値
    // SimilarName = $lb(類似度,ISJ.Resultsのアカウント名,ISJ_Master.AMのアカウント名,同一フラグ)
    set last = $order(result(""),-1)
    if last '= "" {
	  if +last > threshold1 {
		  if (+last '= 1) {
			 set SimilarName = $listbuild(last)_result(last)_$listbuild(1)
		  } 
	  }
	  elseif +last > threshold2 {
			 set SimilarName = $listbuild(last)_result(last)_$listbuild(0)
	  }
    }
  }
  catch (e) {
    set status = e.AsStatus()
  } 
  
  quit SimilarName
}

ClassMethod GetAM(AccountName As %String, Year As %Integer) As %String [ Language = objectscript ]
{
  //戻り値　$list(近似値,対象アカウント名,近似アカウント名,判定フラグ,AM名）
  // 引数のAccountNameで一致した場合は、近似値=1 判定フラグ=1 AM名=マスターから取得したAM名
  // 一致していない場合、ApListの該当年（引数Year）のアカウント名総当たりでアカウント名の近似値を計算
  //（処理速度向上のため、比較を行わないケースあり）
  // 近似値の閾値　0.93以上は同一とみなす
  // 0.8以上は保留（人の判断必要）
  set AccountManager = ""
  
  // ISJ_Master.AMには2005年より前のデータはないため、それ以前は、2005のマスターを使用
  
  if Year < 2005 set Year = 2005

  set year = Year
  
  try {
  
    /* アカウントマネージャーの名前を取得する */
    set yearaccountname = "SELECT AM FROM ISJ_Master.AM where Year = ? and AccountName = ?"
    set statement1 = ##class(%SQL.Statement).%New()
    set qstatus = statement1.%Prepare(yearaccountname)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus)
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement1.%Execute(year,AccountName)
    while rset.%Next() {
	  // $list(近似値,対象アカウント名,近似アカウント名,判定フラグ,AM名)
      set AccountManager = $listbuild(1,AccountName,AccountName,1,rset.AM)
    }
  
    //アカウントマネージャが見つからない場合には、アカウント名が表記ゆれで一致していない可能性がある
    if AccountManager = "" {
	  
	  set SimilarAccountNameList = ..SimilarAccountName(AccountName,Year)

	  if SimilarAccountNameList'="" {
		  
	    set SimilarAccountName = $list(SimilarAccountNameList,3)
	    set okflag = $list(SimilarAccountNameList,4)

        /* アカウントマネージャーの名前を取得する */
        set yearaccountname = "SELECT AM FROM ISJ_Master.AM where Year = ? and AccountName = ?"
        set statement2 = ##class(%SQL.Statement).%New()
        set qstatus = statement2.%Prepare(yearaccountname)
        if qstatus'=$$$OK {
	      write "%Prepare失敗:" 
	      do $System.Status.DisplayError(qstatus) 
	      $$$ThrowStatus(qstatus)
	    }
        set rset2 = statement2.%Execute(year,SimilarAccountName)
        while rset2.%Next() {
          set AccountManager = SimilarAccountNameList_$listbuild(rset2.AM)
        }
      }
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
  
  quit AccountManager
}

ClassMethod BuildAMMaster(filedir As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  set tab = $char(9)
  
  try {
    do ##class(ISJ.Master.AM).%KillExtent()
  	
    /* Locationの所にあるcsvファイルを順次読み込み年毎のアカウントに対するアカウントマネージャーを取得する */
  
    set query = ##class(%SQL.Statement).%New()
    set status = query.%PrepareClassQuery("%File","FileSet")
    if $$$ISERR(status) { 
      do $system.OBJ.DisplayError(status) 
      $$$ThrowStatus(status)
    } 
    set rs = query.%Execute(filedir,"APlist*.txt")
    while rs.%Next() {
	  set filename = rs.%Get("Name")
	  set year = $extract(filename,*-7,*-4)
	  //年毎にAMとAccount名のカラム番号が違うので、その番号を取得
	  set amcolumnno = $case(year,2005:4,2006:7,2007:12,:15)
	  set accolumnno = $case(year,2005:3,2006:5,2007:7,:8)
	  set inputstream = ##class(%Stream.FileCharacter).%New()
	  //set inputstream.TranslateTable = "UTF8"
	  set status = inputstream.LinkToFile(filename)
	  while 'inputstream.AtEnd {
	    set line = inputstream.ReadLine()
	    set accountname = $piece(line,tab,accolumnno)
        //顧客名は、""で囲まれるケースがあるので、読み込み後に"を取り除く
	    set accountname = $translate(accountname,"""","")
	    set am = $piece(line,tab,amcolumnno)

        if (accountname '= "") && (am '= "") && (year '= "") {
          set amrecord = ##class(ISJ.Master.AM).%New()
          set amrecord.Year = year
          set amrecord.AccountName = accountname
          set amrecord.AM = am
          set status = amrecord.%Save()
          if $$$ISERR(status) {
            do $system.OBJ.DisplayError(status)
            $$$ThrowStatus(status)
	      }
        }	  
      }
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
	  
  quit status
}

ClassMethod BuildAccountNameList(pFileName As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  set tab = $char(9)
  
  try {
  
    set outputstream = ##class(%Stream.FileCharacter).%New()
    set outputstream.TranslateTable = "UTF8"
    set status = outputstream.LinkToFile(pFileName)

    set accountname = "select distinct accountname from isj.results order by accountname"
    set statement = ##class(%SQL.Statement).%New()
    set qstatus = statement.%Prepare(accountname)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus)
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement.%Execute()
    while rset.%Next() {
      set line = """"_rset.accountname_""""
	  set status = outputstream.WriteLine(line)
    }
	    	  
    do outputstream.%Save()
  }
  catch (e) {
	  set status = e.AsStatus()
  }	  
	
    quit status
}

ClassMethod BuildShortNameLookupTable(filename As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  
  try {	
    //AccountNameとShortNameの入ったcsvファイルを読み込みSHORTNAMEルックアップテーブルを生成する
  
    set tablename = "SHORTNAME"
    set result = ##class(%SQL.Statement).%ExecDirect(,"delete from Ens_Util.LookupTable where tablename = ?",.tablename)
    set resultSet = result.%NextResult()

    set rowtype = "AccountName VARCHAR(100),ShortName VARCHAR(20)"
    set result2 = ##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.filename)
    set resultSet2 = result2.%NextResult()
    if resultSet2 = "" write "filename is not good!",! quit
    while resultSet2.%Next() {
	  set accountname = resultSet2.AccountName
	  set shortname = resultSet2.ShortName
	  set lookup = ##class(Ens.Util.LookupTable).%New()
	  set lookup.TableName = tablename
	  set lookup.KeyName = accountname
	  set lookup.DataValue = shortname
	  set staus = lookup.%Save()
      if $$$ISERR(status) { 
        do $system.OBJ.DisplayError(status) 
        $$$ThrowStatus(status)
      } 
	  
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
  quit status
}

ClassMethod BuildIndustryLookupTable(filename As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  
  try {	
    //ShortNameと産業タイプの入ったcsvファイルを読み込みINDUSTRYルックアップテーブルを生成する
    // 1	Healthcare
    // 2	Logistics
    // 3	Finance
    // 4	Manufacturing
    // 5	Education
    // 6  Public
    // 7  Others

    set tablename = "INDUSTRY"
    set result = ##class(%SQL.Statement).%ExecDirect(,"delete from Ens_Util.LookupTable where tablename = ?",.tablename)
    set resultSet = result.%NextResult()

    set rowtype = "ShortName VARCHAR(20),IndustryType TINYINT"
    set result2 = ##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.filename)
    set resultSet2 = result2.%NextResult()
    if resultSet2 = "" write "filename is not good!",! quit
    while resultSet2.%Next() {
	  set shortname = resultSet2.ShortName
	  set industrytype = resultSet2.IndustryType
	  set lookup = ##class(Ens.Util.LookupTable).%New()
	  set lookup.TableName = tablename
	  set lookup.KeyName = shortname
	  set lookup.DataValue = industrytype
	  set staus = lookup.%Save()
      if $$$ISERR(status) { 
        do $system.OBJ.DisplayError(status) 
        $$$ThrowStatus(status)
      } 
	  
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
  quit status
}

ClassMethod AssignShortName() As %Status [ Language = objectscript ]
{
  set status = $$$OK
  

  try {  	
    //Shortnameを割り当てる
  
    set allresults = "select id from isj.results"
    set statement = ##class(%SQL.Statement).%New()
    set qstatus = statement.%Prepare(allresults)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus) 
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement.%Execute()
    while rset.%Next() {
	  set id = rset.id
	  set record = ##class(ISJ.Results).%OpenId(id)
	  if '$isobject(record) {write "no object:" quit}
	  set accountname = record.AccountName
	
	  set getshortname = "select DataValue from ens_util.lookuptable where tablename = 'SHORTNAME' and keyname = ?"
	  set statement2 = ##class(%SQL.Statement).%New()
      set qstatus = statement2.%Prepare(getshortname)
      if qstatus'=$$$OK {
	      write "%Prepare失敗:" 
	      do $System.Status.DisplayError(qstatus) 
	      $$$ThrowStatus(qstatus)
	  }
      set rset2 = statement2.%Execute(accountname)
      while rset2.%Next() {
	    set shortname = rset2.DataValue
      }
	  set record.ShortName = shortname
	  set status = record.%Save()
      if status'=$$$OK {
	      write "%Save失敗:" 
	      do $System.Status.DisplayError(status) 
	      $$$ThrowStatus(status)
	  }
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
	  
  quit status
}

ClassMethod AssignAccountType() As %Status [ Language = objectscript ]
{
  set status = $$$OK
  
  try {  	
    //AccountTypeを割り当てる
  
    //ShortNameとそのAccountType
    set allshortname = "select distinct DataValue from Ens_Util.LookupTable where TableName = 'SHORTNAME'"
    set statement1 = ##class(%SQL.Statement).%New()
    set qstatus = statement1.%Prepare(allshortname)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus) 
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement1.%Execute()
    while rset.%Next() {
      set shortname = rset.DataValue
      set minyear = "select min(year) as firstyear from isj.results where shortname = ?"
      set statement2 = ##class(%SQL.Statement).%New()
      set qstatus = statement2.%Prepare(minyear)
      if qstatus'=$$$OK {
	      write "%Prepare失敗:" 
	      do $System.Status.DisplayError(qstatus) 
	      $$$ThrowStatus(qstatus)
	  }
      set rset2 = statement2.%Execute(shortname)
      while rset2.%Next() {
	    set firstyear = rset2.firstyear
	    set accounttype = $case(firstyear,2003:1,2004:1,2005:2,2006:2,2007:2,2008:2,2009:2,:3)
	    set accounttype(shortname) = accounttype
      }
    }
  
    set allresults = "select id,shortname from isj.results"
    set statement3 = ##class(%SQL.Statement).%New()
    set qstatus = statement3.%Prepare(allresults)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus) 
	    $$$ThrowStatus(qstatus)
	}
    set rset3 = statement3.%Execute()
    while rset3.%Next() {
	  set id = rset3.id
	  set shortname = rset3.shortname
	  set record = ##class(ISJ.Results).%OpenId(id)
	  if '$isobject(record) {write "no object:" quit}
	  set record.AccountType = accounttype(shortname)
	  set status = record.%Save()
      if status'=$$$OK {
	      write "%Save失敗:" 
	      do $System.Status.DisplayError(status) 
	      $$$ThrowStatus(status)
	  }
    }
  }
  catch(e) {
	  set status = e.AsStatus()
  }
  quit status
}

ClassMethod AssignAccountManager() As %Status [ Language = objectscript ]
{
  set status = $$$OK
  
  set start = $piece($h,",",2)	

  try {
    //Account Managerを割り当てる
    kill ^maybesame
    
    set allresults = "select id,year,accountname,am from isj.results where am is null"
    set statement = ##class(%SQL.Statement).%New()
    set qstatus = statement.%Prepare(allresults)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus) 
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement.%Execute()
    while rset.%Next() {
	  set id = rset.id
	  set accountname = rset.accountname
	  set year = rset.year
	  set amlist = ..GetAM(accountname,year)
	  set ^amlist(accountname,year) = amlist
	  if $listvalid(amlist) && $listlength(amlist) > 0 {
		set issame = $list(amlist,4)
		set am = $list(amlist,5)

	    if issame {
	      set record = ##class(ISJ.Results).%OpenId(id)
	      if '$isobject(record) {write "no object:" quit}
	      set record.AM = am
	      set status = record.%Save()
          if status'=$$$OK {
	        write "%Save失敗:" 
	        do $System.Status.DisplayError(status) 
	        $$$ThrowStatus(status)
	      }
	    }
	    else {
	        set ^maybesame(id) = amlist
	    }
	        	  
	  }
	}
  }
  catch (e) {
	  set status = e.AsStatus()
  }

  set end = $piece($h,",",2)
  //write "elapsed time = ",end - start	
  quit status
}

ClassMethod AssignIndustryType() As %Status [ Language = objectscript ]
{
  set status = $$$OK
  
  try {	
  
    set tablename = "INDUSTRY"
    set result = ##class(%SQL.Statement).%ExecDirect(,"update isj.results set industrytype = lt.datavalue from Ens_Util.LookupTable as lt where lt.tablename = ? and shortname = lt.keyname",.tablename)
    set resultSet = result.%NextResult()

  }
  catch (e) {
	  set status = e.AsStatus()
  }
  quit status
}

ClassMethod InvokeDataCleansingService() As %Status [ Language = objectscript ]
{
  //　Business Service経由で起動（InvokeDataCleansingService()）すると、パイプでpythonプログラムからデータ取得する部分が動作しない
  //  リソース権限の関連か？
  	
  set status = $$$OK
  
  try {	
    set tSC = ##class(Ens.Director).CreateBusinessService("Data Cleansing",.tService)
    If ($$$ISERR(tSC)) Quit
  
    read "file directory ? ",fdir
    
    write !,"処理が終わるまでしばらくお待ちください...",!

    set request = ##class(Ens.StringRequest).%New()
    set request.StringValue = fdir

    set tSC = tService.ProcessInput(request,.confirmation)
    If ($$$ISERR(tSC)) Quit
    If $IsObject($G(confirmation)) {
	  write "データのクレンジングが終了しました ",confirmation.StringValue
    // 
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
  quit status
}

ClassMethod DataCleansing(pDir As %String) As %Status [ Language = objectscript ]
{
  //　Windowsでは、Business Service経由で起動（InvokeDataCleansingService()）すると、パイプでpythonプログラムからデータ取得する部分が動作しないので、コマンド経由で起動させる処理	
  set status = $$$OK
		
  set filedir = pDir
  set os = $system.Version.GetOS()
  if os = "Windows" {
	 set dirsep = "\"
  }
  else {
	 set dirsep = "/"
  }
    
  set status = ##class(ISJ.Tools.Utility).BuildAMMaster(filedir)
 
  if status = '$$$OK {
	 write filedir_" のデータが追加できませんでした。(BuildAMMaster) エラー: "_$system.Status.GetErrorText(status),!
	 quit status
  }

  set filename = filedir_dirsep_"shortnamelist.csv"

  set status = ##class(ISJ.Tools.Utility).BuildShortNameLookupTable(filename)

  if status = '$$$OK {
	 write filedir_" のデータが追加できませんでした。(BuildShortNameLookupTable) エラー: "_$system.Status.GetErrorText(status),!
	 quit status
  }

  set filename = filedir_dirsep_"isj-industry.csv"

  set status = ##class(ISJ.Tools.Utility).BuildIndustryLookupTable(filename)

  if status = '$$$OK {
	 write filedir_" のデータが追加できませんでした。(BuildIndustryLookupTable) エラー: "_$system.Status.GetErrorText(status),!
	 quit status
  }

  set status = ##class(ISJ.Tools.Utility).AssignShortName()

  if status = '$$$OK {
	 write filedir_" のデータが追加できませんでした。 (AssignShortName) エラー: "_$system.Status.GetErrorText(status),!
	 quit status
  }

  set status = ##class(ISJ.Tools.Utility).AssignAccountType()

  if status = '$$$OK {
	 write filedir_" のデータが追加できませんでした。 (AssignAccountType) エラー: "_$system.Status.GetErrorText(status),!
	 quit status
  }

  set status = ##class(ISJ.Tools.Utility).AssignIndustryType()

  if status = '$$$OK {
	 write filedir_" のデータが追加できませんでした。 (AssignIndustryType) エラー: "_$system.Status.GetErrorText(status),!
	 quit status
  }

  set status = ##class(ISJ.Tools.Utility).AssignAccountManager()

  if status = $$$OK {
	 write filedir_" のデータが追加されました。"
  }
  else {
	 write filedir_" のデータが追加できませんでした。 (AssignAccountManager) エラー: "_$system.Status.GetErrorText(status)
  }

  Quit status
}

ClassMethod OutputMayBeSameList(pFileName As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  set tab = $char(9)
  
  try {
    set outputstream = ##class(%Stream.FileCharacter).%New()
    set outputstream.TranslateTable = "UTF8"
    set status = outputstream.LinkToFile(pFileName)
    set id = ""
    set id = $order(^maybesame(id))
    while id {
      set line = id_tab_$listtostring(^maybesame(id),tab)
	  set status = outputstream.WriteLine(line)
	  if $$$ISERR(status) { 
	    do $system.OBJ.DisplayError(status) 
	    $$$ThrowStatus(status)
	} 
      set id = $order(^maybesame(id))
    }
	    	  
    do outputstream.%Save()
  }
  catch (e) {
	  set status = e.AsStatus()
  }
	
  quit status
}

ClassMethod AssignAM(pFileName As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  set tab = $char(9)
  
  try {
    set inputstream = ##class(%Stream.FileCharacter).%New()
    set inputstream.TranslateTable = "UTF8"
    set status = inputstream.LinkToFile(pFileName)
    while 'inputstream.AtEnd {
	  set line = inputstream.ReadLine()
	  set isOK = $piece(line,tab,5)
	  set am = $piece(line,tab,6)
	  set id = $piece(line,tab,1)
	
	  if isOK {
	    set record = ##class(ISJ.Results).%OpenId(id)
	    if '$isobject(record) w !,"no object ",id," line = ",line,! continue
	    set record.AM = $translate(am,$char(13),"")
	    set status = record.%Save() 
	    if $$$ISERR(status) { 
	      do $system.OBJ.DisplayError(status) 
	      continue
	    } 
	    write "id = ",id," のレコードのAMを更新しました",!
		
	  }
    }
  }
  catch (e) {
	  set status = e.AsStatus()
  }
	
  quit status
}

ClassMethod BuildNoAMList(pFileName As %String) As %Status [ Language = objectscript ]
{
  set status = $$$OK
  set tab = $char(9)
  
  try {
    set outputstream = ##class(%Stream.FileCharacter).%New()
    set outputstream.TranslateTable = "UTF8"
    set status = outputstream.LinkToFile(pFileName)

    set amisnull = "select id, accountname, year from isj.results where am is null"
    set statement = ##class(%SQL.Statement).%New()
    set qstatus = statement.%Prepare(amisnull)
    if qstatus'=$$$OK {
	    write "%Prepare失敗:" 
	    do $System.Status.DisplayError(qstatus)
	    $$$ThrowStatus(qstatus)
	}
    set rset = statement.%Execute()
    while rset.%Next() {
	  set accountname = rset.accountname
	  set id = rset.id
	  set year = rset.year
      set line = id_tab_0_tab_accountname_tab_accountname_tab_1_tab_""_tab_year
	  set status = outputstream.WriteLine(line)
    }
	    	  
    do outputstream.%Save()
  }
  catch (e) {
	  set status = e.AsStatus()
  }
  quit status
}

}
