import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/images.dart';
import 'package:eezy_admin/utils/texts.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view/dashbord/home.dart';
import 'package:eezy_admin/widgets/custome_button.dart';
import 'package:eezy_admin/view-model/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback togglePage;
  const SignupPage({super.key, required this.togglePage});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confPasswordController = TextEditingController();

  bool isPasswordHide = true;
  bool isCheckBoxEnabled = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      height: hight,
      width: width,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Sign Up",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("Create an new account",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              width: width! * .87,
              height: hight! * .346,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customeTextField(
                        
                          controller: userNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter user name";
                            }
                            return null;
                          },
                          labelText: "User Name",
                          icon: userNameController.text.isNotEmpty
                              ? const Icon(
                                  Icons.check_circle_sharp,
                                  color: lightGreen,
                                )
                              : const Icon(
                                  Icons.check_circle_outline,
                                  color: grey,
                                )),
                      customeTextField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter email address";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "enter correct email address";
                          }
                          return null;
                        },
                        labelText: "Email",
                      ),
                      customeTextField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter new password";
                            }
                            if (value.length < 8) {
                              return "password must be  8 digit ";
                            }
                            return null;
                          },
                          labelText: "Password",
                          obsecure: isPasswordHide,
                          icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordHide = !isPasswordHide;
                                });
                              },
                              icon: isPasswordHide ? hideImage : viewImage)),
                      customeTextField(
                          controller: confPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "confirm your password";
                            }
                            if (value != passwordController.text) {
                              return "does not match password";
                            }
                            return null;
                          },
                          labelText: "Confirm Password",
                          obsecure: isPasswordHide,
                          icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordHide = !isPasswordHide;
                                });
                              },
                              icon: isPasswordHide ? hideImage : viewImage)),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
                leading: FittedBox(
                  fit: BoxFit.cover,
                  child: Checkbox(
                      checkColor: const Color.fromARGB(255, 255, 255, 255),
                      activeColor: black,
                      value: isCheckBoxEnabled,
                      onChanged: (_) {
                        setState(() {
                          isCheckBoxEnabled = _!;
                        });
                      }),
                ),
                title: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                
                  child: termsAndCondition)),
            customeButton(
                
                text: "Sign up",
                onpressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      if (isCheckBoxEnabled != true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Center(
                          child: Text(
                            "accept the terms & condition",
                            style: GoogleFonts.poppins(),
                          ),
                        )));
                      } else {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>  Home()));
                      }
                    }
                  });
                },
                bgColor: const MaterialStatePropertyAll(black)),
            FittedBox(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?",
                      style: TextStyle(
                        color: Color.fromRGBO(145, 145, 159, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  TextButton(
                    onPressed: () {
                      print("sign");
                      setState(() {
                        widget.togglePage();
                      });
                    },
                    child: const Text("Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(127, 61, 255, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
