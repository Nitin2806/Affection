import 'dart:typed_data';
import 'package:affection/resources/auth_methods.dart';
import 'package:affection/screens/login.dart';
import 'package:affection/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:affection/utils/color.dart';
import 'package:affection/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  void signUpuser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      file: _image!,
    );

    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const ResponsiveLayout(
      //       mobileScreenLayout: MobileScreenLayout(),
      //       webScreenLayout: WebScreenLayout(),
      //     ),
      //   ),
      // )
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              //logo

              SvgPicture.asset(
                'assets/images/ic_affection.svg',
                height: 105,
                color: primaryColor,
              ),
              const SizedBox(height: 14),

              Stack(children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                        backgroundColor: Colors.black,
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ]),
              const SizedBox(height: 14),

              TextFieldInput(
                hintText: "Enter your Name",
                textInputType: TextInputType.text,
                textEditingController: _nameController,
              ),
              const SizedBox(height: 14),

              TextFieldInput(
                hintText: "Enter your Username",
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(height: 14),

              //email
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your Email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 14),
              //password

              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Enter your Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 14),

              InkWell(
                onTap: signUpuser,
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Sign Up',
                        )
                      : const CircularProgressIndicator(
                          color: primaryColor,
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      "Already have an account? ",
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
