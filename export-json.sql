-- outputs the table data in json format.

SHOW VARIABLES LIKE "secure_file_priv";
SET SESSION group_concat_max_len=150000;
/***********************************
To change output location, find my.ini in a hidden folder @ C:\ProgramData\MySQL\MySQL Server 8.0

There you find under the section [mysqld] change to: secure-file-priv = ""
***********************************/

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idcategory\":"""),
               CONCAT(idcategory),
               CONCAT("\", "),
               CONCAT("\"categoryname\":"""),
               CONCAT(categoryname),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `category`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/category.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idclient\":"""),
               CONCAT(idclient),
               CONCAT("\", "),
               CONCAT("\"clientname\":"""),
               CONCAT(clientname),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `client`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/client.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idcohort\":"""),
               CONCAT(idcohort),
               CONCAT("\", "),
               CONCAT("\"cohortnumber\":"""),
               CONCAT(cohortnumber),
               CONCAT("\","),
               CONCAT("\"idfksalesteam\":"""),
               CONCAT(idfksalesteam),
               CONCAT("\","),
               CONCAT("\"size\":"""),
               CONCAT(size),
               CONCAT("\","),
               CONCAT("\"presold\":"""),
               CONCAT(presold),
               CONCAT("\","),
               CONCAT("\"nonpresold\":"""),
               CONCAT(nonpresold),
               CONCAT("\","),
               CONCAT("\"idfkregion\":"""),
               CONCAT(idfkregion),
               CONCAT("\","),
               CONCAT("\"idfkinstructor\":"""),
               CONCAT(idfkinstructor),
               CONCAT("\","),
               CONCAT("\"idfkstatus\":"""),
               CONCAT(idfkstatus),
               CONCAT("\","),
               CONCAT("\"idfkcategory\":"""),
               CONCAT(idfkcategory),
               CONCAT("\","),
               CONCAT("\"startdate\":"""),
               CONCAT(startdate),
               CONCAT("\","),
               CONCAT("\"enddate\":"""),
               CONCAT(enddate),
               CONCAT("\","),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `cohort`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cohort.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idinstructor\":"""),
               CONCAT(idinstructor),
               CONCAT("\", "),
               CONCAT("\"instructorname\":"""),
               CONCAT(instructorname),
               CONCAT("\","),
               CONCAT("\"idfkregion\":"""),
               CONCAT(idfkregion),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `instructor`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/instructor.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idpathway\":"""),
               CONCAT(idclient),
               CONCAT("\", "),
               CONCAT("\"pathway\":"""),
               CONCAT(pathway),
                CONCAT("\", "),
               CONCAT("\"idfkcategory\":"""),
               CONCAT(idfkcategory),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `pathway`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pathway.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idregion\":"""),
               CONCAT(idregion),
               CONCAT("\", "),
               CONCAT("\"region\":"""),
               CONCAT(region),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `region`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/region.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idsalesteam\":"""),
               CONCAT(idsalesteam),
               CONCAT("\", "),
               CONCAT("\"team\":"""),
               CONCAT(team),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `salesteam`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/salesteam.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idstatus\":"""),
               CONCAT(idstatus),
               CONCAT("\", "),
               CONCAT("\"statusname\":"""),
               CONCAT(statusname),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `status`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/status.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idtimezone\":"""),
               CONCAT(idtimezone),
               CONCAT("\", "),
               CONCAT("\"timezone\":"""),
               CONCAT(timezone),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `timezone`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/timezone.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idxcohortcleint\":"""),
               CONCAT(idxcohortcleint),
               CONCAT("\", "),
               CONCAT("\"idfkcohort\":"""),
               CONCAT(idfkcohort),
                CONCAT("\", "),
               CONCAT("\"idfkclient\":"""),
               CONCAT(idfkclient),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `xcohortclient`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/xcohortclient.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idfkcohortpathway\":"""),
               CONCAT(idfkcohortpathway),
               CONCAT("\", "),
               CONCAT("\"idfkcohort\":"""),
               CONCAT(idfkcohort),
               CONCAT("\", "),
               CONCAT("\"idfkpathway\":"""),
               CONCAT(idfkpathway),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `xcohortpathway`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/xcohortpathway.json';

SELECT 
    CONCAT("[",
         GROUP_CONCAT(
               CONCAT("{\"idfkcohortsalesteam\":"""),
               CONCAT(idfkcohortsalesteam),
               CONCAT("\", "),
               CONCAT("\"idfkcohort\":"""),
               CONCAT(idfkcohort),
               CONCAT("\", "),
               CONCAT("\"idfksalesteam\":"""),
               CONCAT(idfksalesteam),
               CONCAT("\" "),
               CONCAT("}")
         )
    ,"]") 
AS json FROM `xcohortsalesteam`
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/xcohortsalesteam.json';
