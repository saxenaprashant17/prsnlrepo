<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Assegnato_attivit</fullName>
        <description>Assegnato attività</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sorgente/Notifica_attivit_eseguita</template>
    </alerts>
    <alerts>
        <fullName>Notifica_via_email_variazione_registra_chiamata</fullName>
        <description>Notifica via email variazione &quot;registra chiamata&quot;</description>
        <protected>false</protected>
        <recipients>
            <field>Opportunity_Owner_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Modelli_per_preparto/Notifica_registrazione_chiamata</template>
    </alerts>
    <alerts>
        <fullName>SFDC_Notifica_completamento_operazione</fullName>
        <description>SFDC Notifica completamento operazione</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sorgente/TEST_SFDC_Operazione_Email</template>
    </alerts>
    <alerts>
        <fullName>mail_al_creatore_quando_commento_modificato_in_una_operazione</fullName>
        <description>mail al creatore  quando commento modificato in una operazione</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sorgente/Aggiornamento_tua_operazione</template>
    </alerts>
    <rules>
        <fullName>mail mandata al creatore dell%27operazione quando commento modificato in una operazione</fullName>
        <actions>
            <name>mail_al_creatore_quando_commento_modificato_in_una_operazione</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>mail mandata al creatore dell&apos;operazione quando commento modificato in una operazione  17665402</description>
        <formula>NOT  ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
