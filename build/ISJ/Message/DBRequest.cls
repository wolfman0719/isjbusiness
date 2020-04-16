Class ISJ.Message.DBRequest Extends Ens.Request
{

Property AccountName As %String(MAXLEN = 100);

Property ShortName As %String(MAXLEN = 20);

Property AM As %String(MAXLEN = 20);

Property Year As %Integer;

Property Amount As %Integer;

Property AccountType As %Integer;

Storage Default
{
<Data name="DBRequestDefaultData">
<Subscript>"DBRequest"</Subscript>
<Value name="1">
<Value>AccountName</Value>
</Value>
<Value name="2">
<Value>ShortName</Value>
</Value>
<Value name="3">
<Value>AM</Value>
</Value>
<Value name="4">
<Value>Year</Value>
</Value>
<Value name="5">
<Value>Amount</Value>
</Value>
<Value name="6">
<Value>AccountType</Value>
</Value>
</Data>
<DefaultData>DBRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
