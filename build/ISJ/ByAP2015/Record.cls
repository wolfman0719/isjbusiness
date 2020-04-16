/// RECORDMAP: Generated from RecordMap 'ISJ.ByAP2015'
/// on 2019-11-14 at 18:23:56.928 [2019-11-14 09:23:56.928 UTC]
/// by user _SYSTEM
Class ISJ.ByAP2015.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property No As %String;

Property Organization As %String(MAXLEN = 100);

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
<DataLocation>^ISJ.ByAP2015.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^ISJ.ByAP2015.RecordD</IdLocation>
<IndexLocation>^ISJ.ByAP2015.RecordI</IndexLocation>
<StreamLocation>^ISJ.ByAP2015.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
