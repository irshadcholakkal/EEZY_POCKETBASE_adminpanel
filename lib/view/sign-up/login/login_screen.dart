import 'package:eezy_admin/model/getx_controller.dart';
import 'package:eezy_admin/model/services/authentication_services.dart';
import 'package:eezy_admin/model/user/user_data.dart';
import 'package:eezy_admin/utils/colors.dart';
import 'package:eezy_admin/utils/images.dart';
import 'package:eezy_admin/utils/variable.dart';
import 'package:eezy_admin/view/dashbord/web_layout.dart';

import 'package:eezy_admin/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/services/api_services.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({
    super.key,
  });

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final Control controller = Get.put(Control());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          FittedBox(
            child: Text(
              "Welcome !",
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          FittedBox(
            child: Text("Please login to continue our app",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
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
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(width: .2)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(width: .2)),
                            labelText: "Email",
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: black),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter password";
                          }
                          if (value.length < 8) {
                            return "password must be  8 digit ";
                          }
                          return null;
                        },
                        obscureText: isPasswordHide,
                        controller: password,
                        decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(width: .2)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(width: .2)),
                            labelText: "Password",
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: black),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordHide = !isPasswordHide;
                                  });
                                },
                                icon: isPasswordHide ? hideImage : viewImage)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 60,
          ),
          customeButton(
              text: 'Login',
              onpressed: () async {
                await Authentication()
                    .adminLogin(email: email.text, password: password.text);

                final auth = pb.authStore;

                if (pb.authStore.isValid == true) {
                  Get.offAll(WebLayout());
                }
                print("tt${pb.authStore.isValid}");
                print(pb.authStore.token);
                print(pb.authStore.model);

                print("oo${auth.isValid}");
                print(auth.token);
                print(auth.model);
                print("isValid: ${pb.authStore.isValid}");
                print("Token: ${pb.authStore.token}");
                print("Model: ${pb.authStore.model}");

                // if (_formKey.currentState!.validate()) {
                //   // Navigator.pushReplacement(
                //   //       context,
                //   //       MaterialPageRoute(
                //   //           builder: (context) =>  DashBoard()));
                // }
              },
              bgColor: const MaterialStatePropertyAll(Colors.black)),
          //  const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child:  FittedBox(
          //     fit: BoxFit.scaleDown,
          //     child: Text(
          //       "or",
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          //     ),
          //   ),
          // ),
          // Flexible(

          //   child: FittedBox(
          //     fit: BoxFit.scaleDown,
          //     child: InkWell(
          //       onTap: ()async{
          //        // await Authentication().signInWithGoogle();
          //      //   storeUserData();
          //       },
          //       child: Container(
          //         height:60,
          //         width: 320,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(40),
          //             border: Border.all(
          //                 width: 1, color: const Color.fromRGBO(138, 138, 141, 1))),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Image.asset(
          //               'assets/images/googlelogo.png',
          //             ),
          //             Flexible(
          //               child: FittedBox(
          //                 fit: BoxFit.scaleDown,
          //                 child: Text(
          //                   'Sign Up with Google',
          //                   style: GoogleFonts.rubik(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w600,
          //                       color: Colors.black),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // FittedBox(
          //   fit: BoxFit.scaleDown,
          //   child: SizedBox(
          //     child: Column(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             const Text("Don’t have an account yet?",
          //                 style: TextStyle(
          //                   color: Color.fromRGBO(145, 145, 159, 1),
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                 )),
          //             FittedBox(
          //               child: TextButton(
          //                 onPressed: () {

          //                  setState(() {
          //                     // widget.togglePage();
          //                  });
          //                  print("login");
          //                 },
          //                 child: const Text(" Sign Up",
          //                     style: TextStyle(
          //                       decoration: TextDecoration.underline,
          //                       color: Color.fromRGBO(127, 61, 255, 1),
          //                       fontSize: 16,
          //                       fontWeight: FontWeight.w500,
          //                     )),
          //               ),
          //             ),
          //           ],
          //         ),
          //         TextButton(
          //           child: const Text(
          //             "Forgot Password?",
          //             style: TextStyle(
          //               color: Color.fromRGBO(127, 61, 255, 1),
          //               fontSize: 18,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //           onPressed: () {
          //             // Navigator.push(
          //             //     context,
          //             //     MaterialPageRoute(
          //             //         builder: (context) => Forgotpage()));
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
