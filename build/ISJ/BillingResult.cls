Class ISJ.BillingResult Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="ISJ.BillingResult" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="CollectBillingByYears" Category="" ClassName="ISJ.BP.CollectBilling" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Load2003" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2003</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FileSpec">2003*</Setting>
  </Item>
  <Item Name="Load2004" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2004</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FileSpec">2004*</Setting>
  </Item>
  <Item Name="Load2005" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2005</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2005*</Setting>
  </Item>
  <Item Name="Load2006" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2006</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2006*</Setting>
  </Item>
  <Item Name="Load2007" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2008</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2007*</Setting>
  </Item>
  <Item Name="Load2009" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2009</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2009*</Setting>
  </Item>
  <Item Name="Load2012" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2012</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2012*</Setting>
  </Item>
  <Item Name="Load2013" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2013</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2013*</Setting>
  </Item>
  <Item Name="Load2015" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2015</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2015*</Setting>
  </Item>
  <Item Name="Load2016" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2016</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2016*</Setting>
  </Item>
  <Item Name="Load2017" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2017</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2017*</Setting>
  </Item>
  <Item Name="Load2018" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2018</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2018*</Setting>
  </Item>
  <Item Name="Load2008" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2008</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2008*</Setting>
  </Item>
  <Item Name="Load2010" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2008</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2010*</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
  </Item>
  <Item Name="Load2011" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2008</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2011*</Setting>
  </Item>
  <Item Name="Load2014" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2012</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Adapter" Name="FileSpec">2014*</Setting>
  </Item>
  <Item Name="InsertRecord" Category="" ClassName="ISJ.Operation.InsertRecord" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Update some columns for ISJ.Results" Category="" ClassName="ISJ.Operation.DataCleansing" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Data Cleansing" Category="" ClassName="ISJ.Service.DataCleansing" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Load2019" Category="" ClassName="EnsLib.RecordMap.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/intersystems/iris/isjbusiness/in</Setting>
    <Setting Target="Adapter" Name="FileSpec">2019*</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/intersystems/iris/isjbusiness/arc</Setting>
    <Setting Target="Adapter" Name="WorkPath">/intersystems/iris/isjbusiness/work</Setting>
    <Setting Target="Host" Name="RecordMap">ISJ.ByAP2015</Setting>
    <Setting Target="Host" Name="TargetConfigNames">CollectBillingByYears</Setting>
  </Item>
</Production>
}

}
