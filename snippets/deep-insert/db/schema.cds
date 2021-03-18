namespace ns;


entity Orders {
    key id: UUID;
    customer: String; /* Would be assoc. to a customer in reality. */
    items: Composition of many OrderItems on items.order = $self;
}

entity OrderItems {
    key order: Association to Orders;
    key product: String; /* Would be assoc. to a product in reality. */
    quantity: Integer default 1;
}