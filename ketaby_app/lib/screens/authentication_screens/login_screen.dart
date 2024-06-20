
import 'package:flutter/material.dart';
import 'package:ketaby_app/screens/authentication_screens/register_screen.dart';

import '../../core/blocks/authentication_blocks/login_block.dart';
import '../../core/constants/image_constants.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  Image.asset(ImageConst.kKetabyImage,width: 200,height: 100,),
                const  Text('Login now!',
                  style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const  Text("Don't have an account?",
                          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(width:  10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                            },
                            child: const Text('Register Now!',
                            style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),),
                          ),
                      ],
                    ),
                  ),
                  LoginBlock()

                ],
              ),
            ),
    );
  }
}
