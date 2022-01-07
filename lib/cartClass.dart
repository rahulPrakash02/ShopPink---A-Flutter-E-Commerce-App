import 'package:pinkshop/ProductModel.dart';

//So, this one is a cart item class ----> product, with quantity and total cost
class cartitemClass {
  ProductModel product;
  int qty = 0;
  double totalCost = 0.0;

  cartitemClass(this.product) {
    qty = 0;
    totalCost = 0.0;
  }

  void addItem() {
    qty++;
    totalCost += product.price!;
    computeTotal();
  }

  void removeItem() {
    qty = qty - 1 > 0 ? qty - 1 : 0;
    computeTotal();
  }

  void computeTotal() {
    totalCost = product.price! * qty.toDouble();
  }
}
