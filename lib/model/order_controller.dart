import 'package:get/get.dart';
import 'package:moji_appmb/model/order_model.dart';

class OrderController extends GetxController {
  Map<int, OrderItem> _items = {};

  Map<int, OrderItem> get items {
    return {..._items};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }

  //////---------- Add to Cart  ------------/////////////
  void addItem(int productId, id, int price, String name, String image,
      int quantity, String discription, size) {
    _items.putIfAbsent(
      productId,
      () => OrderItem(
          id: id.toString(),
          image: image,
          name: name,
          price: price,
          quantity: quantity,
          discription: discription,
          size: size),
    );
    update();
  }
}
