Class ISJ.Master.AM Extends %Persistent
{

Property AccountName As %String(MAXLEN = 100);

Property Year As %Integer;

Property AM As %String(MAXLEN = 20);

Index AMKey On (AccountName, Year) [ PrimaryKey, Unique ];

Index YearKey On Year;

Index AccountKey On AccountName;

Storage Default
{
<Data name="AMDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AccountName</Value>
</Value>
<Value name="3">
<Value>Year</Value>
</Value>
<Value name="4">
<Value>AM</Value>
</Value>
</Data>
<DataLocation>^ISJ.Master.AMD</DataLocation>
<DefaultData>AMDefaultData</DefaultData>
<ExtentSize>1297</ExtentSize>
<IdLocation>^ISJ.Master.AMD</IdLocation>
<IndexLocation>^ISJ.Master.AMI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>1</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3.18</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="AM">
<AverageFieldSize>6.56</AverageFieldSize>
<Selectivity>14.2857%</Selectivity>
</Property>
<Property name="AccountName">
<AverageFieldSize>24.37</AverageFieldSize>
<Selectivity>0.5656%</Selectivity>
</Property>
<Property name="Year">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>7.1405%</Selectivity>
</Property>
<SQLMap name="AMKey">
<BlockCount>-16</BlockCount>
</SQLMap>
<SQLMap name="AccountKey">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-36</BlockCount>
</SQLMap>
<SQLMap name="YearKey">
<BlockCount>-12</BlockCount>
</SQLMap>
<StreamLocation>^ISJ.Master.AMS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
