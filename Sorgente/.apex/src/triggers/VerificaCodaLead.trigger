trigger VerificaCodaLead on Lead (after insert) {
    // se i dati aggiuntivi del lead (2a form) arrivano prima del lead, qui verrebbero unificati
    WebForms.ConciliaDatiLead();
}