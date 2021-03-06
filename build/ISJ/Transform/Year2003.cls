Class ISJ.Transform.Year2003 Extends Ens.DataTransformDTL [ DependsOn = (ISJ.ByAP2003.Record, ISJ.Message.DBRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ISJ.ByAP2003.Record' targetClass='ISJ.Message.DBRequest' create='new' language='objectscript' >
<assign value='$inumber(source.Amount,",")' property='target.Amount' action='set' />
<assign value='source.Organization' property='target.AccountName' action='set' />
<assign value='..SubString(context.ConfigName,5,8)' property='target.Year' action='set' />
</transform>
}

}
