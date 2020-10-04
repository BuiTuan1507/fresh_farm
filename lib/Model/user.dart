import 'package:fresh_farm/App/Model/user.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model_user.dart';
class UserModel extends Model{
  User _user1;
  void login(User user){
    _user1 =user;
  }
  User get user1{
    return user1;
  }

}