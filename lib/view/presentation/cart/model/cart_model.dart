import '../../product/model/product_model.dart';

class CartModel {
  String? id;
  Products? product;
  double? qty;
  CartModel({this.id, this.product, this.qty});
}
