
import 'package:flutter/material.dart';

import '../../core/blocks/authentication_blocks/register_block.dart';
import '../../core/constants/image_constants.dart';
import 'login_screen.dart';



class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    Image.asset(ImageConst.kKetabyImage,width: 200,height: 100,),
                  const  Text('Join Us!',
                    style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const  Text("already have an account?",
                            style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                          const SizedBox(width:  10,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                              },
                              child: const Text('Login!',
                              style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),),
                            ),
                        ],
                      ),
                    ),
                    RegisterBlock()

                  ],
                ),
              ),
            ),
    );
  }
}
