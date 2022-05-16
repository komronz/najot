import 'package:najot/data/model/user.dart';

import '../token_model.dart';

class LoginModel {
  final User? user;
  final TokenModel? tokenModel;

  LoginModel({
    this.user,
    this.tokenModel,
  });
}
