import 'package:call_first_api_stacked/model/user_model.dart';
import 'package:call_first_api_stacked/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  late List<UserModel> users = [];

  void getData() async {
    Future.delayed(const Duration(seconds: 2), () async {
      users = (await ApiService().getUsers())!;
      notifyListeners();
    });
  }
}
