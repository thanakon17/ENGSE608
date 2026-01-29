class Product {
  String _id;
  String name;
  double _price;
  int? stock;

  Product({
    required String id,
    required this.name,
    required double price,
    this.stock,
  })  : _id = id,
        _price = price {
    print("New Product created: $id ($name)");
  }

  String get id => _id;
  double get price => _price;

  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("ราคาไม่ถูกต้อง (ต้อง > 0) -> ไม่เปลี่ยนค่า");
    }
  }

  void applyDiscount(double percent) {
    if (percent >= 0 && percent <= 100) {
      _price -= _price * percent / 100;
    }
  }

  void restock(int amount) {
    stock ??= 0;
    stock = stock! + amount;
  }

  void showInfo() {
    print("----------------");
    print("ID: $_id");
    print("Name: $name");
    print("Price: $_price");
    print(
      stock == null ? "Stock: ยังไม่ระบุสต็อก" : "Stock: $stock",
    );
  }
}

class DigitalProduct extends Product {
  double fileSizeMB;

  DigitalProduct({
    required String id,
    required String name,
    required double price,
    required this.fileSizeMB,
  }) : super(id: id, name: name, price: price);

  @override
  void showInfo() {
    super.showInfo();
    print("Type: Digital");
    print("File Size: $fileSizeMB MB");
  }
}

class FoodProduct extends Product {
  String expireDate;

  FoodProduct({
    required String id,
    required String name,
    required double price,
    required this.expireDate,
    int? stock,
  }) : super(id: id, name: name, price: price, stock: stock);

  @override
  void showInfo() {
    super.showInfo();
    print("Type: Food");
    print("Expire Date: $expireDate");
  }
}

void main() {
  var p1 = Product(
    id: "P001",
    name: "Notebook",
    price: 50,
  );

  var d1 = DigitalProduct(
    id: "D001",
    name: "E-Book Flutter",
    price: 199,
    fileSizeMB: 120.5,
  );

  var f1 = FoodProduct(
    id: "F001",
    name: "Milk",
    price: 25,
    expireDate: "2026-01-10",
    stock: 15,
  );

  p1.price = -100;
  p1.applyDiscount(10);
  p1.restock(50);

  List<Product> products = [p1, d1, f1];

  for (var item in products) {
    item.showInfo();
  }
}