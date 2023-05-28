import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/feeds_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final themeMode = ValueNotifier(2);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          title: 'Register',
          home: Scaffold(
            appBar: AppBar(
              title: Image.network(
                'https://www.thecocktaildb.com/images/logo.png',
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.nightlight_round),
                    onPressed: () {
                      themeMode.value = themeMode.value == 1 ? 2 : 1;
                    }),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Center(
                        child: const Text(
                          'Register Account',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          icon: Icon(Icons.account_circle),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'What is your',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Male'),
                              leading: Radio(
                                value: 'male',
                                groupValue: '_gen',
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('FeMale'),
                              leading: Radio(
                                value: 'female',
                                groupValue: '_gen',
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Orther'),
                              leading: Radio(
                                value: 'other',
                                groupValue: '_gen',
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add User',
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
      valueListenable: themeMode,
    );
  }
}
