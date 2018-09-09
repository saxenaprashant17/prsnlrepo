<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Invio_email_se_campo_richiesta_guida_telematica_viene_fleggato</fullName>
        <description>avviso d&apos;email  se campo &quot;richiesta guida telematica&quot; viene fleggato</description>
        <protected>false</protected>
        <recipients>
            <field>Email_principale__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email_secondaria__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Modelli_per_prevendita/Richiesta_guida_staminali_lead</template>
    </alerts>
    <alerts>
        <fullName>Un_nuovo_account_Prospect_Client_e_stato_creato_da_un_nostro_agente</fullName>
        <description>Un nuovo account &quot;Prospect/Client&quot; e&apos; stato creato da un nostro agente</description>
        <protected>false</protected>
        <recipients>
            <recipient>monica.lotta@sorgente.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sorgente/Un_nuovo_account_Prospect_Client_e_stato_creato_da_un_nostro_agente</template>
    </alerts>
    <fieldUpdates>
        <fullName>Origine_Non_Territoriale</fullName>
        <field>Tipo_di_Origine__c</field>
        <formula>&quot;Non Territoriale&quot;</formula>
        <name>Origine Non Territoriale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Origine_Territoriale</fullName>
        <field>Tipo_di_Origine__c</field>
        <formula>&quot;Territoriale&quot;</formula>
        <name>Origine Territoriale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Origine_non_Definita</fullName>
        <field>Tipo_di_Origine__c</field>
        <formula>&quot;Non Definita&quot;</formula>
        <name>Origine non Definita</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Invio email se campo %22richiesta guida telematica%22 viene fleggato</fullName>
        <actions>
            <name>Invio_email_se_campo_richiesta_guida_telematica_viene_fleggato</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Invio email se campo &quot;richiesta guida telematica&quot; viene fleggato</description>
        <formula>$Profile.Name   = &quot;Force.com - App Subscription User (KAM)&quot;

 &amp;&amp; 

   RecordType.DeveloperName  =  &quot;PersonAccount&quot;

 &amp;&amp; 

 Richiesta_guida_telematica__c  = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notifica inserimento account</fullName>
        <actions>
            <name>Un_nuovo_account_Prospect_Client_e_stato_creato_da_un_nostro_agente</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>quando viene inserito un account &quot;prospect /cliente&quot;  da un agente col profilo &quot; Force.com - App Subscription User (KAM)&quot;, venga notificato via mail l&apos;utente Monica Lotta per il momento</description>
        <formula>RecordType.DeveloperName  = &quot;PersonAccount&quot;    &amp;&amp;     $Profile.Name  = &quot;Force.com - App Subscription User (KAM)&quot; &amp;&amp;  ISPICKVAL( Business_Unit__c , &quot;SS&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
