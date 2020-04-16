Class ISJ.Operation.DataCleansing Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method UpdateSomeColumns(pRequest As ISJ.Message.APListRequest, Output pResponse As Ens.StringResponse) As %Status
{
	//　データの収集後、いくつかの情報を付加する
	//  1. アカウントマネージャーのマスター情報をAPListのエクセルファイルをタブ区切りに変換したファイルから取得する
	//  2. 会社名変更や合併、買収等で名前の変わったアカウントを共通とみなすためのSHORTNAMEルックアップテーブルをリストファイルから読み取り作成
	//  3. 2.のルックアップテーブルを参照してSHORTNAMEを割り当てる（ISJ.Results全件）
	//  4. アカウントのタイプを割り当てる（取引の開始年度でタイプの値を決める）
	//  5. アカウントマネージャーが割り当てられていないレコードに対して、アカウントマネージャーを割り当てる
	//     アカウントマネージャーのマスターテーブルを検索
	//     マスターテーブル上の値と表記のゆれの可能性があるのでpythonプログラムでその文字列の類似度を計算する
	//     類似度が閾値（0.90）を超えている候補がある場合は、同一とみなし、その該当アカウントマネージャーを取得する
	set status = $$$OK
	
	set pResponse = ##class(Ens.StringResponse).%New()
	
    set filedir = pRequest.FileDir
    set os = $system.Version.GetOS()
    if os = "Windows" {
	    set dirsep = "\"
    }
    else {
	    set dirsep = "/"
    }
    
    set status = ##class(ISJ.Tools.Utility).BuildAMMaster(filedir)
 
	if status = '$$$OK {
	   set pResponse.StringValue = pRequest.FileDir_" のデータが追加できませんでした。(BuildAMMaster) エラー: "_$system.Status.GetErrorText(status)
	   quit status
	}

    set filename = filedir_dirsep_"shortnamelist.csv"

    set status = ##class(ISJ.Tools.Utility).BuildShortNameLookupTable(filename)

	if status = '$$$OK {
	   set pResponse.StringValue = pRequest.FileDir_" のデータが追加できませんでした。(BuildShortNameLookupTable) エラー: "_$system.Status.GetErrorText(status)
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
	   set pResponse.StringValue = pRequest.FileDir_" のデータが追加できませんでした。 (AssignShortName) エラー: "_$system.Status.GetErrorText(status)
	   quit status
	}

    set status = ##class(ISJ.Tools.Utility).AssignAccountType()

	if status = '$$$OK {
	   set pResponse.StringValue = pRequest.FileDir_" のデータが追加できませんでした。 (AssignAccountType) エラー: "_$system.Status.GetErrorText(status)
	   quit status
	}

    set status = ##class(ISJ.Tools.Utility).AssignIndustryType()

    if status = '$$$OK {
	   write filedir_" のデータが追加できませんでした。 (AssignIndustryType) エラー: "_$system.Status.GetErrorText(status),!
	   quit status
    }

    set status = ##class(ISJ.Tools.Utility).AssignAccountManager()

    if status = $$$OK {
	   set pResponse.StringValue = pRequest.FileDir_" のデータが追加されました。"
	}
	else {
	   set pResponse.StringValue = pRequest.FileDir_" のデータが追加できませんでした。 (AssignAccountManager) エラー: "_$system.Status.GetErrorText(status)
	}

	Quit status
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ISJ.Message.APListRequest"> 
		<Method>UpdateSomeColumns</Method>
	</MapItem>
</MapItems>
}

}
