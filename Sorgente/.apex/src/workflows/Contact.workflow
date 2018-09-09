<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Desidera_sito</fullName>
        <description>Desidera Sito</description>
        <protected>false</protected>
        <recipients>
            <recipient>addettocrm@sorgente.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>alessio.trevisani@sorgente.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_a_Referenti_no_DEM/Desidera_sito</template>
    </alerts>
    <alerts>
        <fullName>Invia_richiesta_valutazione_chiusura_referente</fullName>
        <ccEmails>alessio.trevisani@sorgente.com</ccEmails>
        <description>Invia richiesta valutazione chiusura referente</description>
        <protected>false</protected>
        <recipients>
            <field>Utente__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Comunicazioni_automatiche_a_rete/Valutazione_chiusura_referente</template>
    </alerts>
    <alerts>
        <fullName>Notifica_visita_2_SFDC</fullName>
        <ccEmails>alessio.trevisani@sorgente.com</ccEmails>
        <description>Notifica visita 2 SFDC</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Notifica_visita_Email_2</template>
    </alerts>
    <alerts>
        <fullName>Punti_consiglio</fullName>
        <description>Punti consiglio</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Punti_consiglio</template>
    </alerts>
    <fieldUpdates>
        <fullName>Metti_anagrafica_completa</fullName>
        <field>Anagrafica_completa__c</field>
        <literalValue>1</literalValue>
        <name>Metti anagrafica completa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Togli_Anagrafica_completa</fullName>
        <field>Anagrafica_completa__c</field>
        <literalValue>0</literalValue>
        <name>Togli Anagrafica completa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>aggiorna</fullName>
        <field>OtherCity</field>
        <name>aggiorna</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Referente</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Origine__c</field>
            <operation>equals</operation>
            <value>Corso Preparto</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Richiesta valutazione chiusura referente</fullName>
        <actions>
            <name>Invia_richiesta_valutazione_chiusura_referente</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Referente_perso__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
