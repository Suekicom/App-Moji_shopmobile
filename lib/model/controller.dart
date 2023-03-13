import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moji_appmb/model/user_models.dart';

class Controller extends GetxController {
  var photoList = <Users>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAlbumData();
    super.onInit();
  }

  Future<void> fetchAlbumData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    String? id = preferences.getString('id');
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/user/detail/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 201) {
      photoList.clear();
      print(response.statusCode);
      Users _albumModel = Users.fromJson(jsonDecode(response.body));

      photoList.add(
        Users(
          name: _albumModel.name == null ? '....' : _albumModel.name,
          email: _albumModel.email == null ? null : _albumModel.email,
          phone: _albumModel.phone == null ? null : _albumModel.phone,
          surname: _albumModel.surname == null ? '....' : _albumModel.surname,
          status: _albumModel.status,
          depositStatus: _albumModel.depositStatus,
          twoFactorConfirmedAt: _albumModel.twoFactorConfirmedAt,
          profile: _albumModel.profile,
          id: _albumModel.id,
        ),
      );

      isLoading.value = false;
      update();
    } else {}
  }

  void clear() {
    photoList.clear();
    update();
  }
}
