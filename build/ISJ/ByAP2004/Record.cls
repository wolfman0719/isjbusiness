/// RECORDMAP: Generated from RecordMap 'ISJ.ByAP2004'
/// on 2019-11-14 at 18:05:26.778 [2019-11-14 09:05:26.778 UTC]
/// by user _SYSTEM
Class ISJ.ByAP2004.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Organization As %String(MAXLEN = 100);

Property Purchase As %String;

Property Support As %String;

Property Rental As %String;

Property Training As %String;

Property Consulting As %String;

Property Other As %String;

Property Amount As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Organization</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Support</Value>
</Value>
<Value name="5">
<Value>Rental</Value>
</Value>
<Value name="6">
<Value>Training</Value>
</Value>
<Value name="7">
<Value>Consulting</Value>
</Value>
<Value name="8">
<Value>Other</Value>
</Value>
<Value name="9">
<Value>Amount</Value>
</Value>
<Value name="10">
<Value>Purchase</Value>
</Value>
</Data>
<DataLocation>^ISJ.ByAP2004.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^ISJ.ByAP2004.RecordD</IdLocation>
<IndexLocation>^ISJ.ByAP2004.RecordI</IndexLocation>
<StreamLocation>^ISJ.ByAP2004.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
