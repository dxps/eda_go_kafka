# Order Service

This `order_svc` service is a producer of events, published to `OrderReceived` topic.

<br/>

## Running the Service

### Prereqs

The following prerequisites are required before starting this service:

- ZooKeeper
- Kafka
- `OrderReceived` topic

Use the scripts provided in `p1` to accomplish all of these.

### Service Start

Using the classic way, you can start the _cmd_ using `go run order/main.go`.

<br/>

## Testing the Service

1. Start a consumer for the Topic

   ```shell
   $> $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic OrderReceived --from-beginning
   ```

1. Submit a payload to the service

   ```shell
   $> curl -v -H "Content-Type: application/json" -d '{"products":[{"productCode":"12345","quantity":2}],"customer":{"firstName":"Tom","lastName":"Hardy","emailAddress":"tom.hardy@email.com","shippingAddress":{"line1":"123 Anywhere St","city":"Anytown","state":"AL","postalCode":"12345"}}}' http://localhost:8080/orders
   ```

1. Verify an event reached the Topic. You should see a response in the consumer output like this:
   ```json
   {
     "EventBase": {
       "EventID": "d6c54946-0bdc-4d63-898f-447ccdb7ccf4",
       "EventTimestamp": "2020-08-16T09:01:59.757509-04:00"
     },
     "EventBody": {
       "id": "e0012076-cbf8-4dfb-aed8-4660c78431fd",
       "products": [{ "productCode": "12345", "quantity": 2 }],
       "customer": {
         "firstName": "Tom",
         "lastName": "Hardy",
         "emailAddress": "tom.hardy@email.com",
         "shippingAddress": { "line1": "123 Anywhere St", "city": "Anytown", "state": "AL", "postalCode": "12345" }
       }
     }
   }
   ```
