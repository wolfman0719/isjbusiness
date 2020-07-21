FROM store/intersystems/iris-community:2020.2.0.211.0 

ARG COMMIT_ID="isjbusiness"

USER irisowner

ENV ISC_TEMP_DIR=/intersystems/iris/isjbusiness
COPY data/ $ISC_TEMP_DIR/
COPY source.xml $ISC_TEMP_DIR/
COPY data/samples/misc/similarity.py $ISC_PACKAGE_INSTALLDIR/mgr/user/

RUN  iris start $ISC_PACKAGE_INSTANCENAME \ 
&& printf 'Do ##class(Config.NLS.Locales).Install("jpuw") \
 Do ##class(%%EnsembleMgr).EnableNamespace("USER") \
 set sec = ##class("Security.Applications").%%OpenId("/csp/user") \
 set sec.DeepSeeEnabled = 1 \
 set status = sec.%%Save() \
 set user = ##class(Security.Users).%%OpenId("_system") \
 set user.PasswordExternal = "demosystem" \
 set status = user.%%Save() \
 h\n' | iris session $ISC_PACKAGE_INSTANCENAME -U %SYS \ 
&& printf 'Do $system.OBJ.Load("'$ISC_TEMP_DIR'/source.xml","ck") \
 h\n' | iris session $ISC_PACKAGE_INSTANCENAME -U USER\
 && iris stop $ISC_PACKAGE_INSTANCENAME quietly

USER root

RUN  chmod 777 $ISC_TEMP_DIR/samples/* \
&& chmod 777 $ISC_TEMP_DIR/samples/csv/* \
&& chmod 777 $ISC_TEMP_DIR/samples/misc/* \
&& chmod 777 $ISC_TEMP_DIR/* \
&& apt-get -y update && apt-get -y install python3

USER irisowner

RUN  iris start $ISC_PACKAGE_INSTANCENAME \
&& printf 'Do ##class(Ens.Director).StartProduction("ISJ.BillingResult") \
 h\n' | iris session $ISC_PACKAGE_INSTANCENAME -U USER \
&& printf 'sleep 90 secnds to finish data loading...' \
&& cp $ISC_TEMP_DIR/samples/csv/2003* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2004* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2005* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2006* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2007* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2008* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2009* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2010* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2011* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2012* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2013* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2014* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2015* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2016* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2017* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2018* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& cp $ISC_TEMP_DIR/samples/csv/2019* $ISC_TEMP_DIR/in \
&& sleep 5 \
&& printf 'set dir = "'$ISC_TEMP_DIR'/samples/misc" \
 write "Start DataCleansing it takes a while,",! \
 do ##class(ISJ.Tools.Utility).DataCleansing(dir) \
 set file = "'$ISC_TEMP_DIR'/samples/misc/maybesamelist-checked.txt" \
 do ##class(ISJ.Tools.Utility).AssignAM(file) \
 set file = "'$ISC_TEMP_DIR'/samples/misc/noamlist-checked.txt" \
 do ##class(ISJ.Tools.Utility).AssignAM(file) \
 do ##class(%%DeepSee.Utils).%%BuildCube("Billing") \
 h\n' | iris session $ISC_PACKAGE_INSTANCENAME -U USER \
 && iris stop $ISC_PACKAGE_INSTANCENAME quietly

RUN rm -f $ISC_PACKAGE_INSTALLDIR/mgr/journal.log \
 && rm -f $ISC_PACKAGE_INSTALLDIR/mgr/IRIS.WIJ \
 && rm -f $ISC_PACKAGE_INSTALLDIR/mgr/iris.ids \
 && rm -f $ISC_PACKAGE_INSTALLDIR/mgr/alerts.log \
 && rm -f $ISC_PACKAGE_INSTALLDIR/mgr/journal/* \
 && rm -f $ISC_PACKAGE_INSTALLDIR/mgr/messages.log

RUN echo $COMMIT_ID > $HOME/commit.txt