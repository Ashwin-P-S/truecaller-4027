// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:truecaller/grid_view.dart';
import 'module.dart';

FirebaseOptions get fireBaseOptions => const FirebaseOptions(
      apiKey: "AIzaSyATpFxRrzbjnKvmdK7gAuuQFQ7clXLA0tI",
      appId: "1:41257800874:android:30c0bc241915d5f5706cd3",
      messagingSenderId: "41257800874",
      projectId: "weather-ashwi",
    );

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: fireBaseOptions);
  runApp(MyApp());
}

final _formKey = GlobalKey<FormBuilderState>();
final _signUpKey = GlobalKey<FormBuilderState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image(image: AssetImage("truecaller.png")),
        // nextScreen: Home(),
        nextScreen: GridViewPage(),
        duration: 100,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  final record;
  Home({super.key, this.record});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormBuilderState>();
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     funCall();
  //   });
  // }

  // void funCall() {
  //   if (widget.record == null || widget.record == '') return;
  //   Map record = widget.record as Map;
  //   record.forEach((key, value) {
  //     _formKey.currentState!.patchValue({'$key': '$value'});
  //   });
  // }

  CollectionReference records =
      FirebaseFirestore.instance.collection('records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Truecaller"))),
      body: Padding(
        padding: EdgeInsets.all(100),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "Username",
                decoration: InputDecoration(labelText: "Username"),
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: "Password",
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      Map<String, dynamic> data = _formKey.currentState!.value
                          .map((key, value) => MapEntry(key, value));
                      if (_formKey.currentState!.value.values.contains(null)) {
                        records.add(data);
                        _formKey.currentState!.patchValue(
                            {"Username": "", "Password": "", "DocumentId": ""});
                      }
                    },
                    child: Text("Login"),
                  ),
                  SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:page_transition/page_transition.dart';

// Future main() async {
//   runApp(MyApp());
// }

// Image trueCaller = Image(image: AssetImage("truecaller.png"));

// // 1 - Login
// // 2 - Sign Up
var operation = 1;

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimatedSplashScreen(
//         splash: Image(image: AssetImage("truecaller.png")),
//         nextScreen: Home(),
//         duration: 100,
//         splashTransition: SplashTransition.fadeTransition,
//         pageTransitionType: PageTransitionType.fade,
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//             child: Text(
//           "Truecaller",
//           style: TextStyle(fontSize: 25),
//         )),
//       ),
//       body: FormContainer(),
//     );
//     ;
//   }
// }

// class FormContainer extends StatefulWidget {
//   const FormContainer({super.key});

//   @override
//   State<FormContainer> createState() => _FormContainerState();
// }

// class _FormContainerState extends State<FormContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(50),
//       child: FormBuilder(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(height: 50),
//             FormBuilderTextField(
//               validator: FormBuilderValidators.compose(
//                 [
//                   FormBuilderValidators.required(
//                     errorText: "Please Enter Username",
//                   )
//                 ],
//               ),
//               name: "Username",
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 labelText: "Username",
//               ),
//             ),
//             SizedBox(height: 50),
//             FormBuilderTextField(
//               validator: FormBuilderValidators.compose(
//                 [
//                   FormBuilderValidators.required(
//                     errorText: "Please Enter Password",
//                   )
//                 ],
//               ),
//               name: "Password",
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(100)),
//                 labelText: "Password",
//               ),
//             ),
//             SizedBox(height: 100),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     _formKey.currentState!.save();
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => MainPage()));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text("Login"),
//                   ),
//                 ),
//                 SizedBox(width: 50),
//                 ElevatedButton(
//                   onPressed: () {
//                     operation = 2;
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUp()),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text("Sign Up"),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var user = (operation == 1)
        ? _formKey.currentState!.value['Username']
        : _signUpKey.currentState!.value['Name'];

    return Scaffold(
      appBar: AppBar(title: Text("Welcome, ${user}!")),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
            key: _signUpKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FormBuilderTextField(
                    name: "Name",
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FormBuilderTextField(
                    name: "Age",
                    decoration: InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FormBuilderTextField(
                    name: "Email",
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: FormBuilderTextField(
                    name: "Password",
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    _signUpKey.currentState!.save();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  child: Text("Submit"),
                )
              ],
            )),
      ),
    );
  }
}
