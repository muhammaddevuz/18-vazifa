import 'package:flutter/material.dart';
import 'package:vazifa4/utils/profile_data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  String? errorEmail;
  String? errorpassword1;
  String? errorpassword2;
  String? errorname;

  @override
  void dispose() {
    // print("Dispose ishladi: ${widget.index}");
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leadingWidth: 75,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/third");
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
          )),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Create your account for you scheduela",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.person),
                    label: const Text(
                      "Your name",
                    ),
                    errorText: errorname,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    label: const Text(
                      "Email Address",
                    ),
                    errorText: errorEmail,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    label: const Text(
                      "Password",
                    ),
                    errorText: errorpassword1,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController2,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.password),
                    label: const Text(
                      "Password",
                    ),
                    errorText: errorpassword2,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have an account?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          "Sign in here",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ))
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      String password2 = passwordController2.text.trim();
                      String name = nameController.text.trim();
                      if (email.isNotEmpty) {
                        errorEmail = null;
                      }
                      if (password2.isNotEmpty) {
                        errorpassword2 = null;
                      }
                      if (password.isNotEmpty) {
                        errorpassword1 = null;
                      }
                      if (name.isNotEmpty) {
                        errorname = null;
                      }

                      if (password.isEmpty) {
                        errorpassword1 = "Iltimos password kiriting";
                      }
                      if (password2.isEmpty) {
                        errorpassword2 = "Iltimos password kiriting";
                      }
                      if (name.isEmpty) {
                        errorname = "Iltimos email kiriting";
                      }
                      if (name.isEmpty) {
                        errorname = "Iltimos ism kiriting";
                      }

                      setState(() {});

                      if (!email.contains("@") || email.length < 8) {
                        errorEmail = "Iltimos to'g'ri email kiriting";
                      } else if (password.length < 8) {
                        errorpassword1 =
                            "parol kamida 8ta belgi bo'lishi kerak";
                      } else if (password2.length < 8) {
                        errorpassword2 =
                            "parol kamida 8ta belgi bo'lishi kerak";
                      } else if (password != password2) {
                        errorpassword2 = "Iltimos parollarni bir xil kiritng";
                        errorpassword1 = "Iltimos parollarni bir xil kiritng";
                        setState(() {});
                      } else {
                        accounts.add({"login": email, "password": password});
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: AlertDialog(
                                title: const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.blue,
                                  size: 150,
                                ),
                                content: SizedBox(
                                  height: 140,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Account created successfully',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/login");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 140, right: 140),
                                          child: Text("Ok"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text("Continue"),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "By continuing you agree to Loana's",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Terms of Use ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      "&",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text(
                      " Privacy Policy",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
