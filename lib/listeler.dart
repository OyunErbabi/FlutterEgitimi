void main() {
  List<String> sehirler =
      List.generate(3, (index) => ""); //Yeni tip fixed range liste oluşturma
  sehirler[0] = "İstanbul";
  sehirler[1] = "Ankara";
  sehirler[2] = "İzmir";

  for (var item in sehirler) {
    print(item);
  }

  Product product1 = Product("Tv", 500);
  Product product2 = Product("Masaj Aleti", 300);
  //List<Product> products = [product1, product2];

  List<Product> products = []; // Range belirtmeden açılabilecek liste
  products.add(product1);
  products.add(product2);
  products.add(Product("Musluk", 700));

  for (var item in products) {
    print(item._name + " " + item._unitPrice.toString());
  }
}

class Product {
  late String _name;
  late double _unitPrice;

  Product(String name, double unitPrice) {
    _name = name;
    _unitPrice = unitPrice;
  }
}
