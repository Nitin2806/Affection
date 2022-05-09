import 'package:affection/components/login_component.dart';
import 'package:flutter/material.dart';
import 'package:affection/utils/color.dart';
import 'package:affection/widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/images/ic_instagram.svg',
                color: primaryColor,
                height: 84,
              ),
              const SizedBox(height: 64),

              Stack(children: [
                const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://nitin2806.github.io/assets/img/N_Pic.jpeg')),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ]),
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
                  hintText: "Username or email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 14),
              //password

              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 14),

              InkWell(
                child: Container(
                  child: const Text("Sign up"),
                  // child: !_isLoading
                  //     ? const Text(
                  //         'Log in',
                  //       )
                  //     : const CircularProgressIndicator(
                  //         color: primaryColor,
                  //       ),
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
                onTap: () {},
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
                      'Dont have an account?',
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
                        ' Signup.',
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
