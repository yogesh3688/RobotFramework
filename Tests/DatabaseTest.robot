*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${dbname}    bussiness
${dbuser}    root
${dbpassword}    root
${dbhost}    localhost
${dbport}    3306
@{QueryResult}

*** Test Cases ***
TC_01_CONNECT_DATABASE
    Connect to database    pymysql    ${dbname}    ${dbuser}    ${dbpassword}    ${dbhost}    ${dbport}
    table must exist    customerinfo
    check if exists in database    Select * from customerinfo
    @{QueryResult}    QUERY    Select * from customerinfo
    LOG    @{QueryResult}[0]

