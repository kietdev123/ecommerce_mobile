import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:ecommerce_mobile/ui/widgets/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Column(children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                  // IconButton(
                  //     padding: const EdgeInsets.all(0),
                  //     onPressed: () {},
                  //     icon: ),
                  const SizedBox(height: 24),
                  const Icon(Icons.arrow_back_ios),
                  const SizedBox(height: 12),
                  const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 36),

                  CustomCard(
                    child: TextFormField(
                      controller: _emailTextController,
                      // The validator receives the text that the user has entered.
                      maxLength: 30,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: validateEmail,
                    ),
                  ),

                  const SizedBox(height: 12),

                  CustomCard(
                    child: TextFormField(
                      controller: _passwordTextController,
                      // The validator receives the text that the user has entered.
                      maxLength: 30,
                      decoration: const InputDecoration(hintText: "Password"),
                      obscureText: true,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?'),
                      Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.red,
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 46),
                      maximumSize: const Size(double.infinity, 46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          var emailAddress = _emailTextController.text.trim();
                          var password = _passwordTextController.text.trim();

                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailAddress, password: password);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login success')),
                          );
                        } on FirebaseAuthException catch (e) {
                          print(e.message);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.message.toString())),
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: (isLoading)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text('SIGN UP'),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
