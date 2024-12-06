import 'package:fire_auth/screen/home/model/home_model.dart';
import 'package:fire_auth/utils/helper/firedb_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<HomeModel> model = HomeModel().obs;

  void getCurrentUser() async {
    HomeModel data = await FirebaseDBHelper.helper.currentUser();
    model.value = data;
  }


}
