trigger UpdateOwnerCaseTrigger on Case (after insert) {
    
    if (Trigger.isAfter){
        if (Trigger.isInsert) {
            
            List<Case> lstCase = new List<Case>();
            User user = [SELECT ManagerId FROM User WHERE Id=:UserInfo.getUserId()];

            for (Case c: Trigger.new) {
                Case createdCase = new Case();
                
                createdCase.Id = c.Id;
                createdCase.OwnerId = user.ManagerId;

                lstCase.add(createdCase);
            }

            update lstCase;
        } 
    }
}