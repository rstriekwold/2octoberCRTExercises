
Create Lead 
    [Arguments]                 ${lead_status}              ${last_name}                ${company}             ${salutation}=${EMPTY}      ${first_name}=${EMPTY}    ${phone}=${EMPTY}           ${title}=${EMPTY}           ${email}=${EMPTY}           ${website}=${EMPTY}         ${lead_source}=${EMPTY}
    Launch App                  Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=Import
    VerifyText                  Lead Information
    UseModal                    On                          # Only find fields from open modal dialog
    Run Keyword If              '${salutation}'!='${EMPTY}'                             Picklist               Salutation                  Ms.                       #optional
    Run Keyword If              '${first_name}'!='${EMPTY}'                             TypeText               First Name                  Tina                      #optional
    TypeText                    Last Name                   ${last_name}                #mandatory
    Picklist                    Lead Status                 ${lead_status}              #mandatory
    Run Keyword If              '${phone}'!='${EMPTY}'      TypeText                    Phone                  +12234567858449             First Name                #optional
    TypeText                    Company                     ${company}                  Last Name              #mandatory
    Run Keyword If              '${title}'!='${EMPTY}'      TypeText                    Title                  Manager                     Address Information       #optional
    Run Keyword If              '${email}'!='${EMPTY}'      TypeText                    Email                  tina.smith@gmail.com        Rating                    #optional
    Run Keyword If              '${website}'!='${EMPTY}'    TypeText                    Website                https://www.growmore.com/                             #optional
    Run Keyword If              '${lead_source}'!='${EMPTY}'                            Picklist               Lead Source                 Advertisement             #optional
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       2

Verify Lead
    [Arguments]                 ${lead_status}=${EMPTY}     ${last_name}=${EMPTY}       ${company}=${EMPTY}    ${salutation}=${EMPTY}      ${first_name}=${EMPTY}    ${phone}=${EMPTY}           ${title}=${EMPTY}           ${email}=${EMPTY}           ${website}=${EMPTY}         ${lead_source}=${EMPTY}
    Launch App                  Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    Wait Until Keyword Succeeds                             1 min                       5 sec                  ClickText                   ${first_name} ${last_name}
    ClickText                   Details                     anchor=Activity
    Log Many                    ${salutation}               ${first_name}               ${last_name}
    ${full_name}=               Catenate                    ${salutation}               ${first_name}          ${last_name}
    Log                         ${full_name}
    VerifyText                  ${full_name}                anchor=Details
    VerifyText                  ${title}                    anchor=Details
    VerifyText                  ${phone}                    anchor=Lead Status
    VerifyField                 Company                     ${company}
    VerifyField                 Website                     ${website}
    Log Screenshot

Delete Lead
    [Arguments]                 ${first_name}               ${last_name}
    Launch App                  Sales
    ClickText                   Leads
    VerifyText                  Recently Viewed             timeout=120s
    Wait Until Keyword Succeeds                             1 min                       5 sec                  ClickText                   ${first_name} ${last_name}
    ClickText                   Delete
    ClickText                   Delete
    ClickText                   Close
    Log Screenshot