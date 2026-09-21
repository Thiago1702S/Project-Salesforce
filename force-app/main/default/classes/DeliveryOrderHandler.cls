public with sharing class DeliveryOrderHandler {

    public static void handleAfter(
        List<Delivery_Order__c> newOrders,
        Map<Id, Delivery_Order__c> oldMap
    ) {

        DeliveryOrderService.updateCustomerStatistics(
            newOrders,
            oldMap
        );

    }

}