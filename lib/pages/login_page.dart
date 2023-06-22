import 'dart:async';
import 'dart:convert';
import 'package:iport_weight/my_data.dart';
import 'package:iport_weight/pages/menu.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/router.dart' as rout;
//void main() => runApp(const MyApp());

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String _title = 'נמל אשדוד';

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      onGenerateRoute: rout.Router.generateRoute,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              _title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
            )),
        body: const LoginStatefulWidget(),
      ),
    );
  }
}

class LoginStatefulWidget extends StatefulWidget {
  const LoginStatefulWidget({Key? key}) : super(key: key);

  @override
  State<LoginStatefulWidget> createState() => _LoginStatefulWidgetState();
}

class _LoginStatefulWidgetState extends State<LoginStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRead = false;
  Future<void> readJson() async {
    final String responseUser =
        await rootBundle.loadString('assets/users.json');
    final String responseMenu = await rootBundle.loadString('assets/menu.json');
    // ignore: unused_local_variable
    final dataUser = await json.decode(responseUser);
    final dataMenu = await json.decode(responseMenu);
    setState(() {
      MyData.users = dataUser["users"];
      MyData.items = dataMenu["buttons"];
    });
    isRead = true;
  }

  @override
  Widget build(BuildContext context) {
    !isRead ? readJson() : DoNothingAction();
    Widget pad = Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'מערכת שקילה',
                  style: TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: AutofillHints.email),
                )),
            Column(children: <Widget>[
              Image.asset(
                'assets/images/ashdodPort.jpg',
                height: 200,
                width: 200,
                scale: 2,
              )
            ] // color: Color.fromARGB(255, 15, 147, 59), //   <--- image
                ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 120,
              width: 60,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    bool isSuccess = false;
                    for (int index = 0; index < MyData.users.length; index++) {
                      if (MyData.users[index]["password"].toString().trim() ==
                              passwordController.text &&
                          MyData.users[index]["id"].toString().trim() ==
                              nameController.text) {
                        Toast.show("נכנסת בהצלחה",
                            duration: 3,
                            gravity: 0,
                            backgroundColor: Colors.greenAccent,
                            backgroundRadius: 25);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyMenuPage()));
                        isSuccess = true;
                        break;
                      }
                    }
                    if (!isSuccess) {
                      Toast.show("שם משתמש או סיסמא לא נכונים",
                          duration: 3,
                          gravity: 1,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          backgroundRadius: 10);
                    }
                  },
                )),
          ],
        ));

    return pad;
  }
}
