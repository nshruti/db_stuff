# To read an xml file into postgresql/netezza
SELECT 
     (xpath('//id/text()', myTempTable.myXmlColumn))[1]::text AS id
    ,(xpath('//name/text()', myTempTable.myXmlColumn))[1]::text AS Name 
    ,(xpath('//salary/text()', myTempTable.myXmlColumn))[1]::text AS RFC
    ,(xpath('//dept/text()', myTempTable.myXmlColumn))[1]::text AS Text
    /*,myTempTable.myXmlColumn as myXmlElement*/
FROM unnest(xpath('//Table1', 
 CAST('<?xml version="1.0"?>
<DocumentElement>
   <Table1>
      <id>200</id>
      <name>name1</name>
      <salary>1</salary>
      <dept>dept1</dept>
   </Table1>
   <Table1>
      <id>201</id>
      <name>name2</name>
      <salary>2</salary>
      <dept>dept2</dept>
   </Table1>
   <Table1>
      <id>202</id>
      <name>name3</name>
      <salary>3</salary>
      <dept>dept3</dept>
   </Table1>
   <Table1>
      <id>203</id>
      <name>name4</name>
      <salary>4</salary>
      <dept>dept4</dept>
   </Table1>
   <Table1>
      <id>204</id>
      <name>name5</name>
      <salary>5</salary>
      <dept>dept5</dept>
   </Table1>
   <Table1>
      <id>205</id>
      <name>name6</name>
      <salary>6</salary>
      <dept>dept6</dept>
   </Table1>
</DocumentElement>
' AS xml)   
)) AS myTempTable(myXmlColumn)
;

# Same as bove using a file
SELECT 
     (xpath('//id/text()', myTempTable.myXmlColumn))[1]::text AS id
    ,(xpath('//name/text()', myTempTable.myXmlColumn))[1]::text AS Name 
    ,(xpath('//salary/text()', myTempTable.myXmlColumn))[1]::text AS RFC
    ,(xpath('//dept/text()', myTempTable.myXmlColumn))[1]::text AS Text
FROM unnest(
    xpath
    (    '//Table1'
        ,XMLPARSE(DOCUMENT convert_from(pg_read_binary_file('C:\Users\pinup\Desktop\code\shruti_python\file.xml'), 'UTF8'))
    )
) AS myTempTable(myXmlColumn)
;

# Output
"id","name","rfc","text"
"200","name1","1","dept1"
"201","name2","2","dept2"
"202","name3","3","dept3"
"203","name4","4","dept4"
"204","name5","5","dept5"
"205","name6","6","dept6"
