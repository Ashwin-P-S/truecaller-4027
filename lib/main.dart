// ignore_for_file: prefer_const_constructors
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:page_transition/page_transition.dart';
import 'package:truecaller/module.dart';

void main() => runApp(MyApp());
Image trueCaller = Image(image: AssetImage("truecaller.png"));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image(image: AssetImage("truecaller.png")),
        nextScreen: Home(),
        duration: 100,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Truecaller"),
      ),
      body: FormContainer(),
    );
    ;
  }
}

class FormContainer extends StatefulWidget {
  const FormContainer({super.key});

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            FormBuilderTextField(
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: "Please Enter Username",
                  )
                ],
              ),
              name: "Username",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                labelText: "Username",
              ),
            ),
            SizedBox(height: 50),
            FormBuilderTextField(
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: "Please Enter Password",
                  )
                ],
              ),
              name: "Password",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                labelText: "Password",
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 500),
                        alignment: Alignment.center,
                        child: Home(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Login"),
                  ),
                  // shape: ShapeBorder(Border(top: 10)),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Sign Up"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
