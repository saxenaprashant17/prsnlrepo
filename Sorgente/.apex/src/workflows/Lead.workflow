<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_informativa_con_guida_SS_percentili</fullName>
        <description>Email informativa con guida-SS+percentili</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_prevendita/Email_informativa_con_guida_calendario</template>
    </alerts>
    <alerts>
        <fullName>Invio_guida_pdf</fullName>
        <description>Email informativa con guida-SS</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_prevendita/Richiesta_guida_staminali_lead</template>
    </alerts>
    <alerts>
        <fullName>invio_mail_guida</fullName>
        <description>invio mail guida</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/ContactFollowUpSAMPLE</template>
    </alerts>
    <rules>
        <fullName>Conversione</fullName>
        <active>false</active>
        <criteriaItems>
            <field>User.PostalCode</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Invio guida</fullName>
        <actions>
            <name>invio_mail_guida</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Richiesta_guida__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
