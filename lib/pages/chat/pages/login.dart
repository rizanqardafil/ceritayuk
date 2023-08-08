import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatterLogin extends StatefulWidget {
  const ChatterLogin({ Key? key});

  @override
  _ChatterLoginState createState() => _ChatterLoginState();
}

class _ChatterLoginState extends State<ChatterLogin> {
  late String email;
  late String password;
  late bool loggingin = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.textsms,
                  size: 120,
                  color: Colors.deepPurple[900],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Chatter',
                  style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontFamily: 'Poppins',
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                CustomTextInput(
                  hintText: 'Email',
                  leading: Icons.mail,
                  obscure: false,
                  keyboard: TextInputType.emailAddress,
                  userTyped: (val) {
                    email = val;
                  },
                ),
                const SizedBox(
                  height: 0,
                ),
                CustomTextInput(
                  hintText: 'Password',
                  leading: Icons.lock,
                  obscure: true,
                  keyboard: TextInputType.text,
                  userTyped: (val) {
                    password = val;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'login',
                  accentColor: Colors.white,
                  mainColor: Colors.deepPurple,
                  onpress: () async {
                    if (email.isNotEmpty && password.isNotEmpty) {
                      setState(() {
                        loggingin = true;
                      });
                      try {
                        final loggedUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                        setState(() {
                          loggingin = false;
                        });
                        Navigator.pushNamed(context, '/chat');
                      } catch (e) {
                        setState(() {
                          loggingin = false;
                        });
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Login Failed'),
                              content: Text(e.toString()),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Uh oh!'),
                            content:
                                const Text('Please enter the email and password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: const Text(
                    'or create an account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'Made with ♥ by ishandeveloper',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final IconData leading;
  final bool obscure;
  final TextInputType keyboard;
  final Function(String) userTyped;

  const CustomTextInput({
    Key? key,
    required this.hintText,
    required this.leading,
    required this.obscure,
    required this.keyboard,
    required this.userTyped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        keyboardType: keyboard,
        obscureText: obscure,
        onChanged: userTyped,
        decoration: InputDecoration(
          prefixIcon: Icon(leading),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color accentColor;
  final Color mainColor;
  final VoidCallback onpress;

  const CustomButton({
    Key? key,
    required this.text,
    required this.accentColor,
    required this.mainColor,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: accentColor,
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
