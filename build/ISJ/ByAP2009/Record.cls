/// RECORDMAP: Generated from RecordMap 'ISJ.ByAP2009'
/// on 2019-11-14 at 18:08:02.324 [2019-11-14 09:08:02.324 UTC]
/// by user _SYSTEM
Class ISJ.ByAP2009.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property NO As %String;

Property Organization As %String(MAXLEN = 100);

Property LicenseCore As %String;

Property ServiceCore As %String;

Property Rental As %String;

Property SubscCore As %String;

Property Training As %String;

Property Other As %String;

Property Total As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NO</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>LicenseCore</Value>
</Value>
<Value name="5">
<Value>ServiceCore</Value>
</Value>
<Value name="6">
<Value>Rental</Value>
</Value>
<Value name="7">
<Value>SubscCore</Value>
</Value>
<Value name="8">
<Value>Training</Value>
</Value>
<Value name="9">
<Value>Other</Value>
</Value>
<Value name="10">
<Value>Total</Value>
</Value>
<Value name="11">
<Value>Organization</Value>
</Value>
</Data>
<DataLocation>^ISJ.ByAP2009.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^ISJ.ByAP2009.RecordD</IdLocation>
<IndexLocation>^ISJ.ByAP2009.RecordI</IndexLocation>
<StreamLocation>^ISJ.ByAP2009.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
