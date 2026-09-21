public with sharing class DeliveryOrderService {

    public static void updateCustomerStatistics(
        List<Delivery_Order__c> deliveryOrders,
        Map<Id, Delivery_Order__c> oldMap
    ) {

        Set<Id> accountIds = new Set<Id>();

        for (Delivery_Order__c order : deliveryOrders) {

            if (order.Account__c != null) {
                accountIds.add(order.Account__c);
            }

        }

        System.debug('Accounts encontradas: ' + accountIds);

    }

}