
import '../../models/User/user_model.dart';

abstract class LoginRepository{
  Future<UserModel> loginApi(dynamic data);
}