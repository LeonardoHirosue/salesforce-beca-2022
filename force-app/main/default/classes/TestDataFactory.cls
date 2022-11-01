@isTest
public class TestDataFactory {

    public static List<Case> createCasesWithRating(Id ownerId, Id contactId, Integer[] lstRate) {

        List<Case> lstCase = new List<Case>();

        for(Integer i=0 ; i < lstRate.size(); i++) {
            Case c = new Case();
            c.OwnerId = ownerId;
            c.ContactId = contactId;
            c.CSAT__c = String.valueOf(lstRate[i]);
            lstCase.add(c);
        }
        
        insert lstCase;

        return lstCase;
    }
}
