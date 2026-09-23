public with sharing class DeliveryOrderService {

    public static void updateCustomerStatistics(
        List<Delivery_Order__c> deliveryOrders,
        Map<Id, Delivery_Order__c> oldMap
    ) {

        Set<Id> accountIds = new Set<Id>();

        // Identifica as contas afetadas
        for (Delivery_Order__c order : deliveryOrders) {

            if (order.Account__c != null) {
                accountIds.add(order.Account__c);
            }

            // Se o pedido mudou de cliente, recalcula também o cliente anterior
            if (oldMap != null && oldMap.containsKey(order.Id)) {

                Delivery_Order__c oldOrder = oldMap.get(order.Id);

                if (
                    oldOrder.Account__c != null &&
                    oldOrder.Account__c != order.Account__c
                ) {
                    accountIds.add(oldOrder.Account__c);
                }
            }
        }

        if (accountIds.isEmpty()) {
            return;
        }

        // Total de pedidos por cliente
        Map<Id, Integer> totalOrdersByAccount = new Map<Id, Integer>();

        for (AggregateResult result : [
            SELECT Account__c accountId, COUNT(Id) totalOrders
            FROM Delivery_Order__c
            WHERE Account__c IN :accountIds
            GROUP BY Account__c
        ]) {
            totalOrdersByAccount.put(
                (Id) result.get('accountId'),
                (Integer) result.get('totalOrders')
            );
        }

        // Receita e ticket médio somente de pedidos entregues
        Map<Id, AggregateResult> revenueByAccount =
            new Map<Id, AggregateResult>();

        for (AggregateResult result : [
            SELECT
                Account__c accountId,
                SUM(Value__c) totalRevenue
            FROM Delivery_Order__c
            WHERE Account__c IN :accountIds
            AND Status__c = 'Entregue'
            GROUP BY Account__c
        ]) {
            revenueByAccount.put(
                (Id) result.get('accountId'),
                result
            );
        }

        List<Account> accountsToUpdate = new List<Account>();

        for (Id accountId : accountIds) {

            Integer totalOrders = totalOrdersByAccount.containsKey(accountId)
                ? totalOrdersByAccount.get(accountId)
                : 0;

            Decimal totalRevenue = 0;

            if (revenueByAccount.containsKey(accountId)) {

                AggregateResult revenueData =
                    revenueByAccount.get(accountId);

                totalRevenue =
                    (Decimal) revenueData.get('totalRevenue');

            }

            accountsToUpdate.add(new Account(
                Id = accountId,
                Total_Orders__c = totalOrders,
                Total_Revenue__c = totalRevenue
            ));
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}