Class ISJ.Message.APListRequest Extends Ens.Request
{

Property FileDir As %String;

Storage Default
{
<Data name="APListRequestDefaultData">
<Subscript>"APListRequest"</Subscript>
<Value name="1">
<Value>FileDir</Value>
</Value>
</Data>
<DefaultData>APListRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
