/// RECORDMAP: Generated from RecordMap 'ISJ.ByAP2003'
/// on 2019-11-14 at 18:06:02.774 [2019-11-14 09:06:02.774 UTC]
/// by user _SYSTEM
Class ISJ.ByAP2003.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Organization As %String(MAXLEN = 100);

Property Purachase As %String;

Property Support As %String;

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
<Value>Amount</Value>
</Value>
<Value name="6">
<Value>Purachase</Value>
</Value>
</Data>
<DataLocation>^ISJ.ByAP2003.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^ISJ.ByAP2003.RecordD</IdLocation>
<IndexLocation>^ISJ.ByAP2003.RecordI</IndexLocation>
<StreamLocation>^ISJ.ByAP2003.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
