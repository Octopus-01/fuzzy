
import '../../config/network/network_services_api.dart';
import '../../config/url/app_url.dart';
import '../../models/User/user_model.dart';
import 'login_repository.dart';

class LoginHttpApiRepository implements LoginRepository{
  final _api = NetworkServicesAoi();

  @override
  Future<UserModel> loginApi(dynamic data)async{
    final response = await _api.postApi(AppUrl.LoginUrl, data);
    return UserModel.fromJson(response);
  }
}