Class ISJ.Transform.Year2007 Extends Ens.DataTransformDTL [ DependsOn = (ISJ.ByAP2008.Record, ISJ.Message.DBRequest) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ISJ.ByAP2008.Record' targetClass='ISJ.Message.DBRequest' create='new' language='objectscript' >
<assign value='source.Organization' property='target.AccountName' action='set' />
<assign value='..Lookup("SHORTNAME",..ToUpper(source.Organization))' property='target.ShortName' action='set' />
<assign value='$inumber(source.Total,",")' property='target.Amount' action='set' />
<assign value='..SubString(context.ConfigName,5,8)' property='target.Year' action='set' />
<assign value='"ISJ"' property='target.AM' action='set' />
</transform>
}

}
