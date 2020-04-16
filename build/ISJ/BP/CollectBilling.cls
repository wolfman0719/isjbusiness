/// 
Class ISJ.BP.CollectBilling Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='7500' >
<context>
<property name='ConfigName' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='DBMessage' type='ISJ.Message.DBRequest' instantiate='0' />
</context>
<sequence xend='200' yend='800' >
<assign name="Intialize" property="context.ConfigName" value="process.%PrimaryRequestHeader.SourceConfigName" action="set" xpos='200' ypos='250' >
<annotation><![CDATA[ビジネスサービス種類の判別のため、構成名を取得する]]></annotation>
</assign>
<switch name='WhichYear' xpos='200' ypos='350' xend='200' yend='600' >
<case condition='context.ConfigName[2003' name='Year2003' >
<transform name='Year2003' class='ISJ.Transform.Year2003' source='request' target='context.DBMessage' xpos='335' ypos='500' />
</case>
<case condition='context.ConfigName[2004' name='Year2004' >
<transform name='Year2004' class='ISJ.Transform.Year2004' source='request' target='context.DBMessage' xpos='605' ypos='500' />
</case>
<case condition='context.ConfigName[2005' name='Year2005' >
<transform name='Year2005' class='ISJ.Transform.Year2005' source='request' target='context.DBMessage' xpos='875' ypos='500' />
</case>
<case condition='context.ConfigName[2006' name='Year2006' >
<transform name='Year2006' class='ISJ.Transform.Year2006' source='request' target='context.DBMessage' xpos='1145' ypos='500' />
</case>
<case condition='context.ConfigName[2007' name='Year2007' >
<transform name='Year2007' class='ISJ.Transform.Year2008' source='request' target='context.DBMessage' xpos='1415' ypos='500' />
</case>
<case condition='context.ConfigName[2008' name='Year2008' >
<transform name='Year2008' class='ISJ.Transform.Year2008' source='request' target='context.DBMessage' xpos='1685' ypos='500' />
</case>
<case condition='context.ConfigName[2009' name='Year2009' >
<transform name='Year2009' class='ISJ.Transform.Year2009' source='request' target='context.DBMessage' xpos='1955' ypos='500' />
</case>
<case condition='context.ConfigName[2010' name='Year2010' >
<transform name='Year2010' class='ISJ.Transform.Year2008' source='request' target='context.DBMessage' xpos='2225' ypos='500' />
</case>
<case condition='context.ConfigName[2011' name='Year2011' >
<transform name='Year2011' class='ISJ.Transform.Year2008' source='request' target='context.DBMessage' xpos='2495' ypos='500' />
</case>
<case condition='context.ConfigName[2012' name='Year2012' >
<transform name='Year2012' class='ISJ.Transform.Year2012' source='request' target='context.DBMessage' xpos='2765' ypos='500' />
</case>
<case condition='context.ConfigName[2013' name='Year2013' >
<transform name='Year2013' class='ISJ.Transform.Year2013' source='request' target='context.DBMessage' xpos='3035' ypos='500' />
</case>
<case condition='context.ConfigName[2014' name='Year2014' >
<transform name='Year2014' class='ISJ.Transform.Year2012' source='request' target='context.DBMessage' xpos='3305' ypos='500' />
</case>
<case condition='context.ConfigName[2015' name='Year2015' >
<transform name='Year2015' class='ISJ.Transform.Year2015' source='request' target='context.DBMessage' xpos='3575' ypos='500' />
</case>
<case condition='context.ConfigName[2016' name='Year2016' >
<transform name='Year2016' class='ISJ.Transform.Year2016' source='request' target='context.DBMessage' xpos='3845' ypos='500' />
</case>
<case condition='context.ConfigName[2017' name='Year2017' >
<transform name='Year2017' class='ISJ.Transform.Year2017' source='request' target='context.DBMessage' xpos='4115' ypos='500' />
</case>
<case condition='context.ConfigName[2018' name='Year2018' >
<transform name='Year2018' class='ISJ.Transform.Year2018' source='request' target='context.DBMessage' xpos='4385' ypos='500' />
</case>
<case condition='context.ConfigName[2019' name='Year2019' >
<transform name='Year2019' class='ISJ.Transform.Year2015' source='request' target='context.DBMessage' xpos='4655' ypos='500' />
</case>
<default name='default' />
</switch>
<call name='InsertRecord' target='InsertRecord' async='1' xpos='200' ypos='700' >
<request type='ISJ.Message.DBRequest' >
<assign property="callrequest.AccountName" value="context.DBMessage.AccountName" action="set" />
<assign property="callrequest.ShortName" value="context.DBMessage.ShortName" action="set" />
<assign property="callrequest.AM" value="context.DBMessage.AM" action="set" />
<assign property="callrequest.Year" value="context.DBMessage.Year" action="set" />
<assign property="callrequest.Amount" value="context.DBMessage.Amount" action="set" />
<assign property="callrequest.AccountType" value="context.DBMessage.AccountType" action="set" />
</request>
<response type='Ens.StringResponse' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
