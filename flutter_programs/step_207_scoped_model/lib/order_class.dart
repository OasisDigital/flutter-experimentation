class Order {
  String customer;
  List orderItems;

  Order(this.customer, this.orderItems);
}

Order oasis = Order('Oasis', ['item1', 'item2', 'item3']);
Order digital = Order('Digital', ['item4', 'item5', 'item6']);
