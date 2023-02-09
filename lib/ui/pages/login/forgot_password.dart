import 'package:flutter/material.dart';
import 'package:planney/ui/components/custom_alert_dialog.dart';
import 'package:planney/ui/components/progress_dialog.dart';
import 'package:planney/ui/controller/forgotpassword.controller.dart';



class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final _controller_ = ForgotPasswordController();

  final _progressDialog = ProgressDialog(color: Colors.black, onSurface: Colors.white );
  final _alertDialog = CustomAlertDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Esqueci a Senha"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: _controller_.changeEmail,
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 48,
              child: ElevatedButton(
                onPressed: _forgotPassword,
                child: const Text("Recuperar Senha"),
              ),
            )
          ],
        ),
      ),
    );
  }

  _forgotPassword() async {
    _progressDialog.show("Consultando nossa base de dados...");
    final response = await _controller_.forgotPassword();
    if (response.isSuccess) {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Sucesso!", message: response.data!);
    } else {
      _progressDialog.hide();
      _alertDialog.showInfo(title: "Ops!", message: response.message!);
    }
  }
}
