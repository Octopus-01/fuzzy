
import '../../models/User/user_model.dart';
import 'login_repository.dart';

class LoginMockHttpApiRepository implements LoginRepository{
  @override
  Future<UserModel> loginApi(dynamic data)async{
    await Future.delayed(const Duration(seconds: 3));
    final response = {
      'token' : 'kaljfaljpoandd'
    };
    return UserModel.fromJson(response);
  }
}