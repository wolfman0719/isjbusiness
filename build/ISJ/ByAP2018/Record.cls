/// RECORDMAP: Generated from RecordMap 'ISJ.ByAP2018'
/// on 2019-11-14 at 18:10:43.988 [2019-11-14 09:10:43.988 UTC]
/// by user _SYSTEM
Class ISJ.ByAP2018.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Branch As %String;

Property SalesRep As %String;

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
<Value>Branch</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Organization</Value>
</Value>
<Value name="5">
<Value>Noop</Value>
</Value>
<Value name="6">
<Value>LicenseCore</Value>
</Value>
<Value name="7">
<Value>ServiceCore</Value>
</Value>
<Value name="8">
<Value>SubscCore</Value>
</Value>
<Value name="9">
<Value>Training</Value>
</Value>
<Value name="10">
<Value>Total</Value>
</Value>
<Value name="11">
<Value>SalesRep</Value>
</Value>
</Data>
<DataLocation>^ISJ.ByAP2018.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^ISJ.ByAP2018.RecordD</IdLocation>
<IndexLocation>^ISJ.ByAP2018.RecordI</IndexLocation>
<StreamLocation>^ISJ.ByAP2018.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
