Class ISJ.Service.DataCleansing Extends Ens.BusinessService
{

Method OnProcessInput(pInput As Ens.StringRequest, Output pOutput As Ens.StringResponse) As %Status
{

	Set request = ##class(ISJ.Message.APListRequest).%New()
	Set request.FileDir = pInput.StringValue

	// send request to BO
	Set tSC = ..SendRequestSync("Update some columns for ISJ.Results",request,.pOutput)
	Quit tSC
}

}
