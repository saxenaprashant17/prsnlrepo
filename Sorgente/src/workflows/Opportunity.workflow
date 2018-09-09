<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Accettazione_referto_prende_pi_del_previsto</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Accettazione referto prende più del previsto (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Accettazione_referto_prende_pi_del_previsto</template>
    </alerts>
    <alerts>
        <fullName>Analisi_prendono_pi_del_previsto</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Analisi prendono più del previsto (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Analisi_prendono_pi_del_previsto</template>
    </alerts>
    <alerts>
        <fullName>Avviso_per_programma_amico</fullName>
        <ccEmails>amministrazione@sorgente.com</ccEmails>
        <description>Avviso per programma amico</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_parto/Notifica_nota_di_credito_programma_amico</template>
    </alerts>
    <alerts>
        <fullName>Comunicazione_del_referto_prende_pi_del_previsto</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Comunicazione del referto prende più del previsto (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Comunicazione_del_referto_prende_pi_del_previsto</template>
    </alerts>
    <alerts>
        <fullName>Data_prelievo_non_come_preventiva</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Data prelievo non come preventiva (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Data_prelievo_non_come_preventiva</template>
    </alerts>
    <alerts>
        <fullName>Email_SAM_CTR_no_agente</fullName>
        <ccEmails>sara.larocca@sorgente.com</ccEmails>
        <description>Email SAM CTR no agente</description>
        <protected>false</protected>
        <recipients>
            <recipient>alessio.trevisani@sorgente.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/IMPORTANTE_contratto_da_ginecologo_non_assegnato_ad_agente</template>
    </alerts>
    <alerts>
        <fullName>Email_SAM_KIT_no_agente</fullName>
        <ccEmails>sara.larocca@sorgente.com</ccEmails>
        <description>Email SAM KIT no agente</description>
        <protected>false</protected>
        <recipients>
            <recipient>alessio.trevisani@sorgente.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Email_per_SAM</template>
    </alerts>
    <alerts>
        <fullName>Email_per_agente</fullName>
        <description>Email per agente</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_che_fa_appuntamento__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_prevendita/Email_per_agente</template>
    </alerts>
    <alerts>
        <fullName>Email_per_parto_organizzato</fullName>
        <ccEmails>clienti@sorgente.com</ccEmails>
        <description>Email per ritiro organizzato</description>
        <protected>false</protected>
        <recipients>
            <field>Email_person_account__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_parto/Attivazione_corriere</template>
    </alerts>
    <alerts>
        <fullName>Email_per_presa_in_carico_parto</fullName>
        <ccEmails>clienti@weblight.it</ccEmails>
        <description>Email per presa in carico parto</description>
        <protected>false</protected>
        <recipients>
            <field>Email_person_account__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_parto/Attivazione_corriere</template>
    </alerts>
    <alerts>
        <fullName>Email_per_vita_34</fullName>
        <ccEmails>test@weblight.it</ccEmails>
        <description>Email per vita 34</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_parto/Mail_Vita34</template>
    </alerts>
    <alerts>
        <fullName>Invia_dettagli_appuntamento_al_prospect</fullName>
        <description>Invia dettagli appuntamento al prospect</description>
        <protected>false</protected>
        <recipients>
            <field>Email_person_account__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Email_automatiche_prospect/Dettagli_appuntamento</template>
    </alerts>
    <alerts>
        <fullName>Invio_email_appuntamento_prospect_da_opportunit</fullName>
        <description>Invio email appuntamento prospect da opportunità</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_che_fa_appuntamento__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_prevendita/Email_per_agente</template>
    </alerts>
    <alerts>
        <fullName>Modello_A</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello_A</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_A</template>
    </alerts>
    <alerts>
        <fullName>Modello_B</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello_B</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_B</template>
    </alerts>
    <alerts>
        <fullName>Modello_C</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello_C</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_C</template>
    </alerts>
    <alerts>
        <fullName>Modello_D</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello_D</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_D</template>
    </alerts>
    <alerts>
        <fullName>Modello_E</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello_E</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_E</template>
    </alerts>
    <alerts>
        <fullName>Modello_F</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello_F</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_F</template>
    </alerts>
    <alerts>
        <fullName>Modello_G</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello G</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_G</template>
    </alerts>
    <alerts>
        <fullName>Modello_H</fullName>
        <ccEmails>gestmail@sorgente.com</ccEmails>
        <description>Modello H</description>
        <protected>false</protected>
        <recipients>
            <field>Agente_titolare_ginecologo__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Comunicazioni_automatiche_a_rete/Modello_H</template>
    </alerts>
    <alerts>
        <fullName>Modello_email_per_Vita_34</fullName>
        <ccEmails>andrea.staloch@vita34.de</ccEmails>
        <ccEmails>Blood-App@vita34.de</ccEmails>
        <ccEmails>claudia.tonn@vita34.de</ccEmails>
        <ccEmails>Finger@vita34.de</ccEmails>
        <description>Avviso email per Vita 34</description>
        <protected>false</protected>
        <recipients>
            <recipient>ramona.tassinari@sorgente.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_parto/Mail_Vita34</template>
    </alerts>
    <alerts>
        <fullName>Nota_di_credito_per_programma_amico</fullName>
        <ccEmails>test@weblight.it</ccEmails>
        <description>Nota di credito per programma_amico</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Modelli_per_parto/Nota_di_credito_per_programma_amico</template>
    </alerts>
    <alerts>
        <fullName>Ordine_completato</fullName>
        <description>Ordine completato</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Kit_Fatto</template>
    </alerts>
    <alerts>
        <fullName>Organizzazione_spedizione_campione_a_lab_in_ritardo</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Organizzazione spedizione campione a lab in ritardo (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Organizzazione_spedizione_campione_a_lab_in_ritardo</template>
    </alerts>
    <alerts>
        <fullName>Qualcuno_ha_gestito_il_tuo_prospect</fullName>
        <description>Qualcuno ha gestito il tuo prospect</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Notifica_attivit_eseguita</template>
    </alerts>
    <alerts>
        <fullName>Refertazione_prende_pi_del_previsto</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Refertazione prende più del previsto (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Refertazione_prende_pi_del_previsto</template>
    </alerts>
    <alerts>
        <fullName>Ricezione_contratto</fullName>
        <description>Ricezione contratto</description>
        <protected>false</protected>
        <recipients>
            <field>Email_person_account__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/RicezioneContratto</template>
    </alerts>
    <alerts>
        <fullName>Ritiro_campione_in_ritardo</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Ritiro campione in ritardo (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Ritiro_campione_in_ritardo</template>
    </alerts>
    <alerts>
        <fullName>Spedizione_campione_a_SG_in_ritardo</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Spedizione campione a SG in ritardo (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Spedizione_campione_a_SG_in_ritardo</template>
    </alerts>
    <alerts>
        <fullName>Tempo_spedizione_KIT</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Tempo spedizione KIT fuori range (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Tempo_spedizione_KIT_fuori_range</template>
    </alerts>
    <alerts>
        <fullName>Trasporto_campione_a_SG_in_ritardo</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Trasporto campione a SG in ritardo (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Trasporto_campione_a_SG_in_ritardo</template>
    </alerts>
    <alerts>
        <fullName>Trasporto_campione_a_lab_in_ritardo</fullName>
        <ccEmails>daniela.varisco@consoft.it</ccEmails>
        <description>Trasporto campione a lab in ritardo (CBU)</description>
        <protected>false</protected>
        <senderAddress>info@sorgente.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sorgente/Trasporto_campione_a_lab_in_ritardo</template>
    </alerts>
    <fieldUpdates>
        <fullName>Aggionare_Ginex</fullName>
        <field>Ginecologo__c</field>
        <formula>Ginecologo__r.FirstName &amp; &quot; &quot; &amp; Ginecologo__r.LastName</formula>
        <name>Aggionare Ginex</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_Data_firma_contratto</fullName>
        <field>Data_firma_contratto__c</field>
        <formula>Data_firma_contratto__c</formula>
        <name>Aggiorna Data firma contratto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_Data_ordine</fullName>
        <field>Data_ordine__c</field>
        <formula>Data_ordine__c</formula>
        <name>Aggiorna Data ordine</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_Ginex</fullName>
        <field>Ginecologo__c</field>
        <formula>Ginecologo__c</formula>
        <name>Aggiorna Ginex</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_Status_Prospect_cliente</fullName>
        <field>Status_Prospect_cliente01__c</field>
        <formula>TEXT(StageName)</formula>
        <name>Aggiorna Status Prospect/cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_agente_apuntamento_su_account</fullName>
        <field>Agente_che_fa_appuntamento__c</field>
        <formula>IF( Agente_che_fa_appuntamento__c &lt;&gt;&apos;&apos;, Agente_che_fa_appuntamento__r.FirstName+ &apos; &apos;+Agente_che_fa_appuntamento__r.LastName, Agente__r.FirstName+ &apos; &apos;+Agente__r.LastName)</formula>
        <name>Aggiorna agente apuntamento su account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_campo_Ginecologo_su_Account</fullName>
        <field>Ginecologo__c</field>
        <formula>Ginecologo__r.FirstName &amp; &quot; &quot; &amp; Ginecologo__r.LastName</formula>
        <name>Aggiorna campo Ginecologo su Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_campo_origine_definitiva</fullName>
        <field>Origine_definitiva__c</field>
        <formula>&quot;territoriale&quot;</formula>
        <name>Aggiorna campo origine definitiva</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_origine_non_definita</fullName>
        <field>Origine_definitiva__c</field>
        <formula>&quot;da definire&quot;</formula>
        <name>Aggiorna origine non definita</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Aggiorna_origine_non_territoriale</fullName>
        <field>Origine_definitiva__c</field>
        <formula>&quot;non territoriale&quot;</formula>
        <name>Aggiorna origine non territoriale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ginex_su_account</fullName>
        <field>Ginecologo__c</field>
        <formula>Ginecologo__r.FirstName &amp; &quot; &quot; &amp; Ginecologo__r.LastName</formula>
        <name>Ginex su account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Metti_Titolare_ginex_opport_correlat</fullName>
        <field>Titolare_ginecologo_opport_correlat__c</field>
        <formula>Ginecologo__r.Owner.FirstName+&quot; &quot;+Ginecologo__r.Owner.LastName</formula>
        <name>Metti Titolare ginex opport. correlat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Metti_concordato</fullName>
        <field>In_attesa_risposta_prospect__c</field>
        <literalValue>Concordato</literalValue>
        <name>Metti concordato</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Metti_nome_status</fullName>
        <field>Status_redemption__c</field>
        <formula>text( StageName )</formula>
        <name>Metti nome status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Metti_spunta_Contratto_firmato</fullName>
        <field>Contratto_firmato__c</field>
        <literalValue>1</literalValue>
        <name>Metti spunta Contratto firmato</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ptova_aggiorna</fullName>
        <field>Ginecologo__c</field>
        <formula>Ginecologo__r.FirstName &amp; &quot; &quot; &amp; Ginecologo__r.LastName</formula>
        <name>ptova aggiorna</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Aggiornare Campi da opportunità in account</fullName>
        <actions>
            <name>Aggiorna_Data_firma_contratto</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Aggiorna_Data_ordine</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Aggiorna_Status_Prospect_cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Data_firma_contratto__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Data_ordine__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>sfdc supporto</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Aggiornare Campi da opportunità in account 2</fullName>
        <actions>
            <name>Aggionare_Ginex</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Data_ordine__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Campo Ginecologo</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Appuntamento concordato</fullName>
        <actions>
            <name>Metti_concordato</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Data_ora_appuntamento__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Comunicazione appuntamento</fullName>
        <actions>
            <name>Invia_dettagli_appuntamento_al_prospect</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Data_ora_appuntamento__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Agente_che_fa_appuntamento__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Invio email appuntamento prospect da opportunità</fullName>
        <actions>
            <name>Invio_email_appuntamento_prospect_da_opportunit</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Invio email appuntamento prospect da opportunità</description>
        <formula>ISCHANGED(Agente_che_fa_appuntamento__c) &amp;&amp;  Account.RecordType.DeveloperName   = &quot;PersonAccount&quot; &amp;&amp;  Appuntamento_gi_fatto__c = FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mette agente appuntamento da opportunità</fullName>
        <actions>
            <name>Aggiorna_agente_apuntamento_su_account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISCHANGED( Agente_che_fa_appuntamento__c),ISCHANGED( Agente__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Spunta Contratto firmato</fullName>
        <actions>
            <name>Metti_spunta_Contratto_firmato</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Data_firma_contratto__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Tipologia origine non definita</fullName>
        <actions>
            <name>Aggiorna_origine_non_definita</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Origine_in_fase_di_ordine__c</field>
            <operation>equals</operation>
            <value>Cross selling,Altro,Da verificare</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tipologia origine non territoriale</fullName>
        <actions>
            <name>Aggiorna_origine_non_territoriale</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Origine_in_fase_di_ordine__c</field>
            <operation>equals</operation>
            <value>Amici/conoscenti,Già cliente,Siti e app satellite,Social media,Siti extra gruppo,Motore di ricerca,Programma Amico</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tipologia origine territoriale</fullName>
        <actions>
            <name>Aggiorna_campo_origine_definitiva</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Origine_in_fase_di_ordine__c</field>
            <operation>equals</operation>
            <value>Corso Preparto,Specialista,Professional,KAM,Pieghevole,Collaboratore</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Titolare ginecologo opportunità su account</fullName>
        <actions>
            <name>Metti_Titolare_ginex_opport_correlat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISchanged (Ginecologo__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
