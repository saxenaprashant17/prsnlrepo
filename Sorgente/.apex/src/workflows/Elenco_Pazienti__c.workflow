<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Data</fullName>
        <field>Data__c</field>
        <formula>TODAY()</formula>
        <name>Data</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Aggiorna Data</fullName>
        <actions>
            <name>Data</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Elenco_Pazienti__c.Stato_Paziente__c</field>
            <operation>equals</operation>
            <value>Gestito</value>
        </criteriaItems>
        <criteriaItems>
            <field>Elenco_Pazienti__c.Punti_Consiglio__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
