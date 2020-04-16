Class ISJ.Results Extends %Persistent
{

Property AccountName As %String(COLLATION = "EXACT", MAXLEN = 100);

Property ShortName As %String(MAXLEN = 20);

Property AM As %String(MAXLEN = 20);

Property Year As %Integer;

Property Amount As %Integer;

Property AccountType As %Integer;

Property IndustryType As %Integer;

Index ANIndex On AccountName;

Index AMIndex On AM;

Storage Default
{
<Data name="ResultsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AccontName</Value>
</Value>
<Value name="3">
<Value>Year</Value>
</Value>
<Value name="4">
<Value>Amount</Value>
</Value>
<Value name="5">
<Value>AcountType</Value>
</Value>
<Value name="6">
<Value>AcountName</Value>
</Value>
<Value name="7">
<Value>ShortName</Value>
</Value>
<Value name="8">
<Value>AM</Value>
</Value>
<Value name="9">
<Value>AccountName</Value>
</Value>
<Value name="10">
<Value>AccountNameInMaster</Value>
</Value>
<Value name="11">
<Value>CheckFlag</Value>
</Value>
<Value name="12">
<Value>AccountType</Value>
</Value>
<Value name="13">
<Value>IndustryType</Value>
</Value>
</Data>
<DataLocation>^ISJ.ResultsD</DataLocation>
<DefaultData>ResultsDefaultData</DefaultData>
<IdLocation>^ISJ.ResultsD</IdLocation>
<IndexLocation>^ISJ.ResultsI</IndexLocation>
<StreamLocation>^ISJ.ResultsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

ClassMethod LoadData2009(pFilename As %String) As %Status
{
 Set rowtype="AccountName VARCHAR(100),Value1 INTEGER,value2 INTEGER,value3 INTEGER,value4 INTEGER,value5 INTEGER,value6 INTEGER,value7 INTEGER,amount INTEGER,ryear INTEGER,accounttype INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AccountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = resultSet.ryear
	 set result.AcountType = resultSet.accounttype
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

ClassMethod LoadData2010(pFilename As %String) As %Status
{
 Set rowtype="NO INTEGER,AccountName VARCHAR(100),Value1 INTEGER,value2 INTEGER,value3 INTEGER,value4 INTEGER,value5 INTEGER,amount INTEGER,ryear INTEGER,accounttype INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AccountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = resultSet.ryear
	 set result.AcountType = resultSet.accounttype
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

ClassMethod LoadData2012(pFilename As %String) As %Status
{
 Set rowtype="NO INTEGER,AccountName VARCHAR(100),Value1 INTEGER,value2 INTEGER,value3 INTEGER,value4 INTEGER,amount INTEGER,ryear INTEGER,accounttype INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AccountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = resultSet.ryear
	 set result.AcountType = resultSet.accounttype
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

ClassMethod LoadData2015(pFilename As %String) As %Status
{
 Set rowtype="NO INTEGER,AccountName VARCHAR(100),Dummy CHAR(1),Value1 INTEGER,value2 INTEGER,value3 INTEGER,value4 INTEGER,amount INTEGER,ryear INTEGER,accounttype INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AccountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = resultSet.ryear
	 set result.AcountType = resultSet.accounttype
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

ClassMethod LoadData2017(pFilename As %String) As %Status
{
 Set rowtype="AccountName VARCHAR(100),Value1 INTEGER,value2 INTEGER,value3 INTEGER,value4 INTEGER,amount INTEGER,ryear INTEGER,am VARCHAR(20),accounttype INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AccountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = resultSet.ryear
	 set result.AM = resultSet.am
	 set result.AcountType = resultSet.accounttype
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

ClassMethod LoadData2018(pFilename As %String) As %Status
{
 Set rowtype="dummy1 VARCHAR(10),am VARCHAR(20),AccountName VARCHAR(100),dummy2 VARCHAR(1),Value1 INTEGER,value2 INTEGER,value3 INTEGER,value4 INTEGER,amount INTEGER,ryear INTEGER,accounttype INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()
 set year = 2018

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AccountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = year
	 set result.AM = $zcvt($piece(resultSet.am,","),"U")
	 if result.AM [ "YAKU" set result.AM = "YAKU"
	 if result.AM [ "KUMO" set result.AM = "KUMO"	  
	 set result.AcountType = resultSet.accounttype
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

ClassMethod ReloadData(pFilename As %String) As %Status
{
 Set sts = ##class(ISJ.Results).%KillExtent()	
 Set rowtype="NO INTEGER,AM VARCHAR(10),AcountName VARCHAR(100),accounttype INTEGER,amount INTEGER,ShortName VARCHAR(20),ryear INTEGER"

 Set result=##class(%SQL.Statement).%ExecDirect(,"call %SQL_Util.CSV(,?,?)",.rowtype,.pFilename)

 Set resultSet =result.%NextResult()

 While resultSet.%Next() {
	 set result = ##class(ISJ.Results).%New()
	 set result.AcountName = resultSet.AcountName
	 set result.Amount = $number(resultSet.amount)
	 set result.Year = resultSet.ryear
	 set result.AcountType = resultSet.accounttype
	 set result.ShortName = resultSet.ShortName
	 set result.AM = resultSet.AM
	 set sts = result.%Save()
	 if $$$ISERR(sts) {
	    write $system.Status.DisplayError(sts),!
	 }
 }

 Set resultSet="",result=""
}

}
