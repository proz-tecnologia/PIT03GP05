import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String userName;
  final double userBalance;
  const Avatar({super.key, required this.userName, required this.userBalance});

  @override
  Widget build(BuildContext context) {
    var selectedTheme = Theme.of(context);
    return SizedBox(
      width: double.maxFinite,
      height: 160,
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xffeff1f5),
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Color(0xffc1cdda),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text.rich(
                          TextSpan(
                            text: "Olá, ",
                            style: const TextStyle(fontSize: 28),
                            children: [
                              TextSpan(
                                text: "$userName!",
                                style: TextStyle(
                                    color: selectedTheme.colorScheme.primary,
                                    fontSize: 28),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'O seu balanço atual é:',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "R\$ $userBalance",
              style: TextStyle(
                  color: selectedTheme.colorScheme.primary, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
