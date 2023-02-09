import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_class/models/api_response.model.dart';
import 'package:planney/model/api_response.model.dart';
import 'package:mobx/mobx.dart';
part 'forgotpassword.controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  
@observable
String _email = "";

  changeEmail(String value) {
    _email = value;
  }

  Future<APIResponse<String>> forgotPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      return APIResponse.success(
          "Caso o email esteja em nossa base de dados, foi enviado um link de recuperação.");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return APIResponse.error("Ops! Algum problema aconteceu!");
    }
  }

}
