import 'package:flutter/material.dart';
import 'package:planney/strings.dart';
import 'package:planney/style/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidht = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.homepageColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Planney',
              style: TextStyle(
                  color: AppStyle.backgroundBuyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            SizedBox(
              height: deviceHeight * 0.1,
            ),
            Stack(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: AppStyle.cardBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: AppStyle.button1Color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.025,
            ),
            Text(
              Strings.LOGIN_TITLE,
              style: TextStyle(
                  color: AppStyle.backgroundBuyColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: deviceHeight * 0.0125,
            ),
            Text(
              Strings.LOGIN_DESCRIPTION,
              style: TextStyle(
                  color: AppStyle.backgroundBuyColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(AppStyle.button1Color),
                  backgroundColor:
                      MaterialStateProperty.all(AppStyle.backgroundBuyColor),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    Size(deviceWidht * 0.35, deviceHeight * 0.06),
                  ),
                ),
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
