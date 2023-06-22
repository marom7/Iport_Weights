// ignore_for_file: prefer_final_fields, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iport_weight/my_data.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _idControler = TextEditingController();
  TextEditingController _nameControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  TextEditingController _descControler = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  late String shortName;
  // ignore: prefer_typing_uninitialized_variables
  late Map user;

  // String sn;
//FOR UPDATE USER
  showModalBox(int index) {
    _nameControler.text = MyData.users[index]["name"].toString();
    _passwordControler.text = MyData.users[index]["password"].toString();
    _descControler.text = MyData.users[index]["description"].toString();

    showModalBottomSheet(
        context: context,
        barrierColor: const Color.fromARGB(150, 212, 196, 135).withOpacity(0.7),
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              // ignore: unnecessary_const
              color: Color.fromARGB(149, 167, 173, 224),
              //backgroundBlendMode: BlendMode.clear,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    MyData.users[index]["id"].toString(),
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration(
                        labelText: "שם משתמש",
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintTextDirection: TextDirection.rtl),
                    controller: _nameControler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "הכנס שם !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration(
                        labelText: "תפקיד",
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintTextDirection: TextDirection.rtl),
                    controller: _descControler,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        labelText: "סיסמא",
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                        hintTextDirection: TextDirection.rtl),
                    textDirection: TextDirection.ltr,
                    controller: _passwordControler,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "הכנס סיסמה !";
                      }
                      return null;
                    },
                  ),

                  // confirm button
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.red),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[600]),
                      ),
                      child: const Text('עדכן'),
                      onPressed: () {
                        setState(() => updateUser(index));
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'משתמשים במערכת',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // Display the data loaded from sample.json
            MyData.users.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: MyData.users.length,
                      itemBuilder: (context, index) {
                        shortName = "@";
                        if (MyData.users[index]["name"].toString().isNotEmpty) {
                          // ignore: prefer_interpolation_to_compose_strings
                          shortName = MyData.users[index]["name"]
                              .toString()
                              .substring(0, 1);
                          if (MyData.users[index]["name"]
                              .toString()
                              .contains(' ')) {
                            // ignore: prefer_interpolation_to_compose_strings
                            try {
                              // ignore: prefer_interpolation_to_compose_strings
                              shortName = shortName +
                                  "." +
                                  MyData.users[index]["name"]
                                      .toString()
                                      .split(' ')[1]
                                      .substring(0, 1);
                              // ignore: empty_catches
                            } catch (e) {
                              if (kDebugMode) {
                                print(e.toString());
                              }
                            }
                          }
                        }
                        return Card(
                            key: ValueKey(MyData.users[index]["id"]),
                            margin: const EdgeInsets.all(7),
                            color: Colors.amber.shade100,
                            child: ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    foregroundColor: Colors.black,
                                    child: Text(shortName)),
                                title: Text(
                                    MyData.users[index]["name"].toString()),
                                subtitle: Text(MyData.users[index]
                                        ["description"]
                                    .toString()),
                                trailing: SizedBox(
                                  width: 70,
                                  child: Row(children: [
                                    Expanded(
                                        child: IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {
                                              showModalBox(index);
                                            })),
                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {
                                          showDialogBox(
                                              "מערכת שקילה",
                                              "?האם אתה בטוח שברצונך למחוק משתמש זה",
                                              index);
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    )
                                  ]),
                                )));
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          newUserScreen();
        },
        backgroundColor: Colors.orange,
        label: const Text("משתמש חדש"),
        icon: const Icon(Icons.add),
      ),
    );
  }

// FOR DELETE USER
  showDialogBox(String title, String message, int index) async {
    var res = await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));

    if (res == 'OK') setState(() => MyData.users.removeAt(index));
  }

  void updateUser(int index) {
    MyData.users[index]["name"] = _nameControler.text;
    MyData.users[index]["password"] = _passwordControler.text;
    MyData.users[index]["description"] = _descControler.text;
  }

  void newUserScreen() {
    _idControler.text = "";
    _nameControler.text = "";
    _descControler.text = "";
    _passwordControler.text = "";
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                'משתמש חדש',
                textDirection: TextDirection.rtl,
              ),
            ),
            body: Column(children: [userForm()])),
      ),
    );
  }

  // FOR NEW USER
  userForm() {
    return Form(
        child: Column(children: [
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        textDirection: TextDirection.rtl,
        decoration: const InputDecoration(
            labelText: "מס עובד",
            icon: Icon(Icons.format_list_numbered),
            border: OutlineInputBorder(),
            hintTextDirection: TextDirection.rtl),
        controller: _idControler,
        validator: (value) {
          if (value!.isEmpty) {
            return "הכנס שם !";
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        keyboardType: TextInputType.text,
        textDirection: TextDirection.rtl,
        decoration: const InputDecoration(
            labelText: "שם משתמש",
            icon: Icon(Icons.person),
            border: OutlineInputBorder(),
            hintTextDirection: TextDirection.rtl),
        controller: _nameControler,
        validator: (value) {
          if (value!.isEmpty) {
            return "הכנס שם !";
          }
          return null;
        },
      ),
      const SizedBox(
        height: 25,
      ),
      TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            labelText: "סיסמא",
            icon: Icon(Icons.password),
            border: OutlineInputBorder(),
            hintTextDirection: TextDirection.rtl),
        textDirection: TextDirection.ltr,
        controller: _passwordControler,
        validator: (value) {
          if (value!.isEmpty) {
            return "הכנס סיסמה !";
          }
          return null;
        },
      ),
      const SizedBox(
        height: 15,
      ),
      TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
            labelText: "תפקיד",
            icon: Icon(Icons.my_library_books_outlined),
            border: OutlineInputBorder(),
            hintTextDirection: TextDirection.rtl),
        textDirection: TextDirection.ltr,
        controller: _descControler,
        validator: (value) {
          if (value!.isEmpty) {
            return "הכנס תאור !";
          }
          return null;
        },
      ),
      const SizedBox(
        height: 70,
      ),
      ElevatedButton(
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(Colors.red),
            backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
          ),
          child: const Text('צור משתמש'),
          onPressed: () {
            user = {
              "id": _idControler.text,
              "name": _nameControler.text,
              "description": _descControler.text,
              "password": _passwordControler.text
            };

            setState(() => MyData.users.add(user));
            Navigator.pop(context);
          })
    ]));
  }
}
