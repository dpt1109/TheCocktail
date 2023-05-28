import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/feeds_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final themeMode = ValueNotifier(2);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          title: 'Login',
          home: Scaffold(
            appBar: AppBar(
              // elevation: 4,
              title: const Text('The Cocktail'),

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
                          'Log in',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          icon: Icon(Icons.account_circle),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          icon: Icon(Icons.password),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const MyApp()),
                          // );
                        },
                        child: Text('Log in'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      valueListenable: themeMode,
    );
  }
}
