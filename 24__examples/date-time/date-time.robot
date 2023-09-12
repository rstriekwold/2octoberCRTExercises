*** Settings ***
Library    DateTime

*** Test Cases ***

Todays Date
    ${date} =          Get Current Date
    ${date_formatted}    Get Current Date    result_format=%m/%d/%Y
Start and End Date
    ${date} =          Get Current Date
    ${start_date} =    Add Time To Date            ${date}                     2 days      result_format=%m/%d/%Y
    ${end_date} =      Add Time To Date            ${date}                     150 days    result_format=%m/%d/%Y

Date plus days
    ${date_formatted}    Get Current Date    result_format=%m/%d/%Y
    ${future_date} =      Add Time To Date            ${date_formatted}                     2 days      result_format=%m/%d/%Y    date_format=%m/%d/%Y

Date minus days
     ${date_formatted}    Get Current Date    result_format=%m/%d/%Y
    ${past_date} =      Subtract Time From Date            ${date_formatted}                     2 days      result_format=%m/%d/%Y    date_format=%m/%d/%Y