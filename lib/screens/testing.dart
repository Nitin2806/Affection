import 'dart:typed_data';
import 'package:affection/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:affection/utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? _image;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          children: <Widget>[
            Center(
              child: Card(
                elevation: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Flexible(child: Container(), flex: 2),
                      SvgPicture.asset(
                        'assets/images/ic_instagram.svg',
                        color: primaryColor,
                        height: 84,
                      ),
                      const SizedBox(height: 64),
                      Stack(children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!))
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://i.stack.imgur.com/l60Hf.png'),
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
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Username or Email",
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(30.0),
                        //elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () => {},
                          minWidth: 150.0,
                          height: 50.0,
                          color: const Color(0xFF179CDF),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const <Widget>[
                Expanded(child: Text("Don't Have a Account?")),
                Text("Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                    )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "SKIP SIGN UP FOR NOW",
                style: TextStyle(fontSize: 18.0, color: Color(0xFF179CDF)),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
