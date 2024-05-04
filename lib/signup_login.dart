import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignupLogin extends StatefulWidget {
  const SignupLogin({super.key});

  @override
  State<SignupLogin> createState() => _SignupLoginState();
}

class _SignupLoginState extends State<SignupLogin> {
  var fullNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Signup Login',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: fullNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    if (value.length > 30) {
                      return 'Enter 30 Character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    if (value.length > 11) {
                      return 'Enter 11 Number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.call,
                        color: Colors.grey,
                      ),
                      labelText: 'Mobile Number',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    if (value.length > 10) {
                      return 'Enter 10 Character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                      labelText: 'User Name',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    if (value.length > 12 || value.length < 6) {
                      return 'Password must be less than 12 or more than 6 character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: Colors.grey,
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 55,
                  width: 280,
                  child: ElevatedButton(
                    onPressed: () {
                      _signup();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 15,
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 55,
                  width: 280,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 15,
                    ),
                    child: const Text(
                      'Login Page Here',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    if (formKey.currentState!.validate()) {
      String name = fullNameController.text.toString();
      String mobile = mobileController.text.toString();
      String email = emailController.text.toString();
      String userName = userNameController.text.toString();
      String password = passwordController.text.toString();

      fullNameController.clear();
      mobileController.clear();
      emailController.clear();
      userNameController.clear();
      passwordController.clear();

      try {
        Response response = await http.post(
          Uri.parse('https://signuplogin.myanmarpyitharnews.com/signup.php'),
          body: {
            'fullname': name,
            'mobile': mobile,
            'email': email,
            'username': userName,
            'password': password,
          },
        );

        if (response.statusCode == 200) {
          print('Signup Successfully');
        } else {
          print('Signup Failed');
        }
      } catch (e) {
        print(e.toString());
      }

      //print('$name\n$mobile\n$email\n$userName\n$password');
    }
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();

  //var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    //emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  if (value.length > 10) {
                    return 'Enter 10 Character';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    labelText: 'User Name',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
            /*Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Required';
                }
                return null;
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  )),
            ),
          ),*/
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  if (value.length > 12 || value.length < 6) {
                    return 'Password must be less than 12 or more than 6 character';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Colors.grey,
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 55,
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 15,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 55,
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupLogin()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 15,
                  ),
                  child: const Text(
                    'Signup Page Here',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      String userName = userNameController.text.toString();
      //String email = emailController.text.toString();
      String password = passwordController.text.toString();

      userNameController.clear();
      //emailController.clear();
      passwordController.clear();

      try {
        Response response = await http.post(
            Uri.parse('https://signuplogin.myanmarpyitharnews.com/login.php'),
            body: {
              'username': userName,
              'password': password,
            });

        if (response.statusCode == 200 && response.body == 'Login Success') {
          print('Login Successfully');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login Success'),
          ));
        } else {
          print('Login Failed');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login Failed'),
          ));
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
