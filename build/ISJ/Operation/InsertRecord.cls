Class ISJ.Operation.InsertRecord Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method InsertRecord(pRequest As ISJ.Message.DBRequest, Output pResponse As Ens.StringResponse) As %Status
{
	set status = $$$OK
	
	$$$TRACE("アカウント名 = "_pRequest.AccountName)
	$$$TRACE("年 = "_pRequest.Year)
	$$$TRACE("略称 = "_pRequest.ShortName)
	$$$TRACE("営業担当 = "_pRequest.AM)
	$$$TRACE("アカウントタイプ = "_pRequest.AccountType)
	
	set record = ##class(ISJ.Results).%New()
	set record.AccountName = pRequest.AccountName
	set record.AccountType = pRequest.AccountType
	set record.AM = pRequest.AM
	set record.Amount = pRequest.Amount
	set record.ShortName = pRequest.ShortName
	set record.Year = pRequest.Year
	
	set status = record.%Save()
	
	set pResponse = ##class(Ens.StringResponse).%New()
	  
	if status = $$$OK {
	   set pResponse.StringValue = pRequest.Year_" のデータが追加されました。"
	}
	else {
	   set pResponse.StringValue = pRequest.Year_" のデータが追加できませんでした。エラー: "_$system.Status.GetErrorText(status)
	}
	 
	Quit status
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="ISJ.Message.DBRequest"> 
		<Method>InsertRecord</Method>
	</MapItem>
</MapItems>
}

}
