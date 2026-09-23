@IsTest
private class DeliveryOrderServiceTest {

    @IsTest
    static void shouldUpdateCustomerStatisticsWhenOrderIsDelivered() {

        // 1. Cria o cliente
       Account customer = new Account(
    Name = 'Cliente Teste SkyLog',
    CNPJ__c = '12345678000199'
);
        insert customer;

        // 2. Cria o motorista
        Driver__c driver = new Driver__c(
            CPF__c = '12345678901',
            CNH__c = '123456789',
            Category__c = 'B'
        );
        insert driver;

        // 3. Cria o veículo
        Vehicle__c vehicle = new Vehicle__c(
            Model__c = 'Van Teste',
            type__c = 'Van',
            Capacity__c = 1000,
            Year__c = 2025,
            Status__c = 'Disponível',
            Plate__c = 'TST1234'
        );
        insert vehicle;

        // 4. Cria o pedido
        Delivery_Order__c deliveryOrder = new Delivery_Order__c(
            Account__c = customer.Id,
            Origin__c = 'São Paulo',
            Destination__c = 'Campinas',
            Value__c = 1000,
            Weight__c = 100,
            Expected_Delivery_Date__c = Date.today().addDays(2),
            Priority__c = 'Normal',
            Driver__c = driver.Id,
            Vehicle__c = vehicle.Id
        );

        insert deliveryOrder;

        // 5. Segue o fluxo permitido de status
        deliveryOrder.Status__c = 'Em preparação';
        update deliveryOrder;

        deliveryOrder.Status__c = 'Em rota';
        update deliveryOrder;

        Test.startTest();

        deliveryOrder.Status__c = 'Entregue';
        update deliveryOrder;

        Test.stopTest();

        // 6. Busca os indicadores calculados
        Account updatedCustomer = [
            SELECT
                Total_Orders__c,
                Total_Revenue__c,
                Average_Order_Value__c
            FROM Account
            WHERE Id = :customer.Id
        ];

        // 7. Verifica o resultado esperado
        System.assertEquals(
            1,
            updatedCustomer.Total_Orders__c,
            'O cliente deveria possuir 1 pedido.'
        );

        System.assertEquals(
            1000,
            updatedCustomer.Total_Revenue__c,
            'A receita realizada deveria ser 1000.'
        );

        System.assertEquals(
            1000,
            updatedCustomer.Average_Order_Value__c,
            'O valor médio deveria ser 1000.'
        );
    }
}