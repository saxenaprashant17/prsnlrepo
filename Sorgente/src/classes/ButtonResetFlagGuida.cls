global class ButtonResetFlagGuida {
    webservice static boolean Reset(){
        new ResetFlagInvioGuida().execute();
        return true;
    }
}