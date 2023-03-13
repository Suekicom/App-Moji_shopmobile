import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moji_appmb/model/address.dart';

class Addresscontroller extends GetxController {
  Map<int, AddressItem> _items = {};

  Map<int, AddressItem> get items {
    return {..._items};
  }

  int get itemCount {
    // return  _items?.length?? 0;
    return _items.length;
  }

  //////---------- Address   ------------/////////////
  void addItem(int iduser, String villege, String note, String province,
      String districk) {
    _items.putIfAbsent(
      iduser,
      () => AddressItem(
        iduser: iduser,
        villege: villege,
        note: note,
        province: province,
        districk: districk,
      ),
    );
    update();
  }
}
