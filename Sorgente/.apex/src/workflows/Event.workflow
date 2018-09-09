<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notifica_email_vicinanza_data_inizio_evento</fullName>
        <ccEmails>alessio.trevisani@sorgente.com</ccEmails>
        <description>Notifica email vicinanza data inizio evento</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sorgente/Notifica_appuntamento</template>
    </alerts>
    <alerts>
        <fullName>Notifica_email_vicinanza_data_inizio_evento2</fullName>
        <description>Notifica email vicinanza data inizio evento2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sorgente/Notifica_appuntamento</template>
    </alerts>
    <rules>
        <fullName>Notifica email vicinanza data inizio evento</fullName>
        <active>true</active>
        <description>Notifica email vicinanza data inizio evento</description>
        <formula>true
 &amp;&amp; 
 DATEVALUE( ActivityDateTime )  &gt; TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Notifica_email_vicinanza_data_inizio_evento2</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Event.StartDateTime</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
