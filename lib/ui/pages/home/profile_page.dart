import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mask/mask/mask.dart';
import 'package:planney/stores/planney_user.store.dart';
import '../../../navigator_key.dart';
import '../../../strings.dart';
import '../../components/custom_alert_dialog.dart';
import '../../components/home/planney_logo.dart';
import '../../components/progress_dialog.dart';
import '../../controller/register.controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final _progressDialog = ProgressDialog();
  final _alertDialog = CustomAlertDialog();
  final RegisterController _controller =
      GetIt.instance.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    final userStore = GetIt.instance.get<PlanneyUserStore>();
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.brightness == Brightness.dark
              ? colorScheme.background
              : colorScheme.primary,
          title: LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              width: constraints.maxWidth,
              child: const PlanneyLogo(size: 24),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: deviceHeight * 0.04,
                width: deviceWidth,
              ),
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child: Image.asset(
                    'lib/style/assets/img/userprofile.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              SizedBox(height: deviceHeight * 0.04),
              SizedBox(
                width: deviceWidth * 0.9,
                child: TextFormField(
                  onChanged: _controller.changeName,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, style: BorderStyle.none),
                    ),
                    labelText: Strings.REGISTER_FORM_USERNAME_LABEL,
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    errorStyle: TextStyle(
                      fontSize: 14,
                    ),
                    filled: true,
                  ),
                  validator: ((value) {
                    if (value == '' || value == null) {
                      return Strings.REGISTER_FORM_USERNAME_ERROR;
                    }
                    return null;
                  }),
                ),
              ),
              SizedBox(height: deviceHeight * 0.04),
              SizedBox(
                width: deviceWidth * 0.9,
                child: TextFormField(
                  onChanged: _controller.changeEmail,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(1),
                      ),
                    ),
                    labelText: Strings.LOGIN_FORM_EMAIL_LABEL,
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    errorStyle: TextStyle(
                      fontSize: 14,
                    ),
                    filled: true,
                  ),
                  validator: Mask.validations.email,
                ),
              ),
              SizedBox(height: deviceHeight * 0.04),
              SizedBox(
                width: deviceWidth * 0.9,
                height: 48,
                child: ElevatedButton(
                  onPressed: _doRegister,
                  child: const Text(
                    Strings.CHANGE_PROFILE_DATA,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              SizedBox(
                width: deviceWidth * 0.9,
                height: 48,
                child: ElevatedButton(
                  onPressed: _doRegister,
                  child: const Text(
                    Strings.CANCELING_CHANGE_PROFILE_DATA,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
            ])));
  }

  _doRegister() async {
    _progressDialog.show("Atualizando...");
    try {
      final response = await _controller.doRegister();
      if (response.isSuccess) {
        _progressDialog.hide();
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, "/");
      } else {
        _progressDialog.hide();
        _alertDialog.showInfo(title: "Ops!", message: response.message!);
      }
    } catch (e) {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Ops!", message: "Ops Algo deu errado!");
    }
  }
}
