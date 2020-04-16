/// 
Class ISJ.Performance Extends %DeepSee.CubeDefinition [ DependsOn = ISJ.Results, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Billing" displayName="Billing" disabled="false" abstract="false" sourceClass="ISJ.Results" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="ShortName" disabled="false" hasAll="false" allCaption="All ShortName" allDisplayName="ShortName" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ShortName" disabled="false" sourceProperty="ShortName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="AM" disabled="false" hasAll="false" allCaption="All AM" allDisplayName="AM" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AM" disabled="false" sourceProperty="AM" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Year" disabled="false" hasAll="false" allCaption="All Year" allDisplayName="Year" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" disabled="false" sourceProperty="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="AccountType" disabled="false" hasAll="false" allCaption="All AccountType" allDisplayName="AccountType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AccountType" disabled="false" sourceProperty="AccountType" list="false" rangeExpression="1:Legacy;2:ISJ V1.0;3:ISJ V2.0;" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="IndustryType" disabled="false" hasAll="false" allCaption="All IndustryType" allDisplayName="IndustryType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="IndustryType" disabled="false" sourceProperty="IndustryType" list="false" rangeExpression="1:Healthcare;2:Logistics;3:Finance;4:Manufacturing;5:Education;6:Public;7:Others;" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Amount" disabled="false" sourceProperty="Amount" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <listing name="New_listing1" displayName="Detailed List" disabled="false" listingType="table" fieldList="AccountName,Year,Amount">
  </listing>
</cube>
}

Parameter DOMAIN;

}
