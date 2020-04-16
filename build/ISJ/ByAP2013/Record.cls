/// RECORDMAP: Generated from RecordMap 'ISJ.ByAP2013'
/// on 2019-11-07 at 17:41:54.011 [2019-11-07 08:41:54.011 UTC]
/// by user _SYSTEM
Class ISJ.ByAP2013.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property No As %String;

Property Organization As %String;

Property Noop As %String;

Property LicenseCore As %String;

Property ServiceCore As %String;

Property SubscCore As %String;

Property Training As %String;

Property Total As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>No</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Noop</Value>
</Value>
<Value name="5">
<Value>LicenseCore</Value>
</Value>
<Value name="6">
<Value>ServiceCore</Value>
</Value>
<Value name="7">
<Value>SubscCore</Value>
</Value>
<Value name="8">
<Value>Training</Value>
</Value>
<Value name="9">
<Value>Total</Value>
</Value>
<Value name="10">
<Value>Organization</Value>
</Value>
</Data>
<DataLocation>^ISJ.ByAP2013.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^ISJ.ByAP2013.RecordD</IdLocation>
<IndexLocation>^ISJ.ByAP2013.RecordI</IndexLocation>
<StreamLocation>^ISJ.ByAP2013.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
