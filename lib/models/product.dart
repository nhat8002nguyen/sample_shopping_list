class Product {
  String title;
  int price;
  int count;

  Product({required this.title, required this.price, required this.count});

  void increaseNumItem() {
    count++;
  }

  void decreaseNumItem() {
    if (count > 0) {
      count--;
    }
  }

  Product copy() {
    return Product(title: title, count: count, price: price);
  }
}
