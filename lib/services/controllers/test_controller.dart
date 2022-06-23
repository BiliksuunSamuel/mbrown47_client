import 'package:get/get.dart';
import 'package:glory/routes/routes.dart';
import 'package:glory/services/api/api_client.dart';

class TestController extends GetxController {
  final ApiClient apiclient = ApiClient(appBaseUrl: Routes.appBaseUrl);

  void dummyTest() async {
    Response response = await apiclient.post("api/dummy", {
      "username": "samuelbills",
      "phone": "0550465223",
      "email": "biliksuunsamuel@gmail.com"
    });

    print(response.body);
    update();
  }
}
