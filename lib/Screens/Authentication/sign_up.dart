import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:maan_hrm/Screens/Authentication/admin_sign_in.dart';
import 'package:maan_hrm/Screens/Authentication/sign_in.dart';
import 'package:maan_hrm/Screens/Home/home_screen.dart';
import 'package:maan_hrm/models/admin_model.dart';
import 'package:maan_hrm/services/database_services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final companyController = TextEditingController();
  final adminController = TextEditingController();
  final emailController = TextEditingController();
  final pnuController = TextEditingController();
  final passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final db = DatabaseService();

  void _signUpAdmin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text);
      await db.addAdminData(
          AdminModel(
              companyName: companyController.text,
              adminName: adminController.text,
              emailAddress: emailController.text,
              pnumber: pnuController.text),
          userCredential.user!.uid);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('sign up successfully')));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminsignIn(),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Sign In',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Sign Up now to begin an amazing journey',
                  style: kTextStyle.copyWith(color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      controller: companyController,
                      textFieldType: TextFieldType.NAME,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Company name is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Company Name',
                        hintText: 'MaanTheme',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      controller: adminController,
                      textFieldType: TextFieldType.NAME,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Owner/Admin name is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Owner/Admin name',
                        hintText: 'MaanTeam',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      controller: emailController,
                      textFieldType: TextFieldType.EMAIL,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email address is required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'maantheme@maantheme.com',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 60.0,
                      child: AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        controller: pnuController,
                        enabled: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone number is required';
                          }
                          // Additional validation if needed
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: '1767 432556',
                          labelStyle: kTextStyle,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: const OutlineInputBorder(),
                          // prefixIcon: CountryCodePicker(
                          //   padding: EdgeInsets.zero,
                          //   onChanged: print,
                          //   initialSelection: 'BD',
                          //   showFlag: true,
                          //   showDropDownButton: true,
                          //   alignLeft: false,
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      controller: passController,
                      textFieldType: TextFieldType.PASSWORD,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: kTextStyle,
                        hintText: 'Enter password',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ButtonGlobal(
                      buttontext: 'Sign Up',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Validation passed, continue with sign-up logic
                          // For now, navigate to HomeScreen as an example
                          _signUpAdmin();
                        }
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Have an account? ',
                            style: kTextStyle.copyWith(
                              color: kGreyTextColor,
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              'Sign In',
                              style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: kMainColor,
                              ),
                            ).onTap(() {
                              SignIn().launch(context);
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Or Sign Up With...',
                      style: kTextStyle.copyWith(
                          color: kGreyTextColor, fontSize: 12.0),
                    ),
                    Hero(
                      tag: 'social',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Center(
                                    child: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Color(0xFF3B5998),
                                )),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 2.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Center(
                                child: Image.asset(
                                  'images/google.png',
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Color(0xFF3FBCFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
