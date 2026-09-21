trigger DeliveryOrderTrigger on Delivery_Order__c (
    after insert,
    after update
) {
    DeliveryOrderHandler.handleAfter(
        Trigger.new,
        Trigger.oldMap
    );
}