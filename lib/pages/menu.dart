import 'package:flutter/material.dart';
import 'package:iport_weight/my_data.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyMenuPageState createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Center(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("תפריט"),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                children: [
                  for (int i = 0; i < MyData.items.length; i++)
                    Card(
                        child: Container(
                            padding: const EdgeInsets.all(7),
                            width: double.infinity,
                            child: buttonMenu(i))),
                ]),
          ),
        )));
  }

// 4BAAF6 64F6A3 A3A9F2 808080
  Widget buttonMenu(int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MyData.items[index]["routing"]);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(int.parse(MyData.items[index]["color"]))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconData(int.parse(MyData.items[index]["icon"]),
                  fontFamily: 'MaterialIcons'),
              size: 40,
            ),
            Text(
              MyData.items[index]["name"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: double.parse(MyData.items[index]["fontSize"])),
            )
          ],
        ),
      ),
    );
  }
}

/*
               
              InkWell(
                onTap: () {
                  // ignore: prefer_const_constructors
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WightsEntPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monitor_weight_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "שער יציאה",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WightsEntPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monitor_weight_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "שער כניסה",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WightsEntPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lime,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.line_weight,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "כל המשקלים",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WightsEntPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "הגדרות",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orangeAccent,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "משתמשים",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ),
              )
*/