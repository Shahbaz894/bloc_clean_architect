import 'package:bloc_clean_architect/config/app_url.dart';
import 'package:bloc_clean_architect/models/user/user_model.dart';

import '../../data/network/network_services_api.dart';

class LoginRepository{
  final api=NetworkServicesApi();
  Future<UserModel>loginApi(dynamic data)async{
    final response=await api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}