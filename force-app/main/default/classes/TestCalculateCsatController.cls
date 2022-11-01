@isTest
private class TestCalculateCsatController {
    @isTest static void TestCalculateCsatController() {
        Integer [] lstRating = new Integer[] {1,2,3,4,5};
        Id ownerId = '005Dn000000nFiOIAU';
        Id contactId = '003Dn000001onzHIAQ';

        List<Case> lstCase = TestDataFactory.createCasesWithRating(ownerId, contactId, lstRating);

        Test.startTest();
        Decimal result = CalculateCsatController.CalculateCsat(contactId);
        Test.stopTest();

        System.assertEquals(3, result);
    }

    @isTest static void TestCalculateCsatControllerWithoutRating() {
        Integer [] lstRating = new Integer[] {null,null,null,null};
        Id ownerId = '005Dn000000nFiOIAU';
        Id contactId = '003Dn000001onzHIAQ';

        List<Case> lstCase = TestDataFactory.createCasesWithRating(ownerId, contactId, lstRating);

        Test.startTest();
        Decimal result = CalculateCsatController.CalculateCsat(contactId);
        Test.stopTest();

        System.assertEquals(0, result);
    }
}