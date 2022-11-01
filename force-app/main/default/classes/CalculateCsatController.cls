public class CalculateCsatController {

    @AuraEnabled(cacheable=true)
    public static Decimal CalculateCsat(Id contactId) {
        List<Case> lstCase = new List<Case>();
        lstCase = [SELECT Id, CSAT__c FROM Case WHERE ContactId=:contactId];

        Decimal csat = 0; 
        Integer n = 0;

        for(Case c: lstCase){
            if (c.CSAT__c!=null){
                csat += decimal.valueOf(c.CSAT__c);
                n++;
            }
        }

        if (n==0){ 
            return 0;
        } else {
            Decimal csatAvarage = csat/n;
            return csatAvarage.setScale(1);
        }        
    }
}
