
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/navigationbar_main_screens/navigationbar_main_screen.dart';
import '../../cubits/authentication_cubit/authentication_cubit.dart';
import '../general_button_block.dart';
import '../general_text_field_block.dart';



class RegisterBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
  listener: (context, state) {
    if(state is SuccessRegisterState)
      {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:Text('successful register'))
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBarMainScreen(),));
      }
  },
  builder: (context, state) {
    var authData=AuthenticationCubit.get(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: state is LoadingRegisterState?410:370,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent
       ,width: 3 ),
        borderRadius: BorderRadius
          .circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Column(
                children: [
                  GeneralTextFieldBlock(
                    hint: 'Name',
                    controller: authData.registerName,
                    preIcon:const Icon(Icons.person,color: Colors.blueAccent,),
                  ),
                  const SizedBox(height: 10,),
                  GeneralTextFieldBlock(
                      hint: 'Email',
                      controller: authData.registerEmail,
                      preIcon:const Icon(Icons.email,color: Colors.blueAccent,),
                      ),
                  const SizedBox(height: 10,),
                  GeneralTextFieldBlock(
                    hint: 'Password',
                    controller:authData.registerPassword,
                    preIcon:const Icon(Icons.lock,color: Colors.blueAccent,),
                    suffixIcon:authData.authPasswordVisability? const Icon(Icons.visibility,color: Colors.blueAccent,):const Icon(Icons.visibility_off,color: Colors.grey,),
                    isPasswordField: true,
                    isPasswordVisability: true,
                    visability: authData.authPasswordVisability,
                  ),
                  const SizedBox(height: 10,),
                  GeneralTextFieldBlock(
                    hint: 'Confirm Password',
                    controller: authData.registerConfirmPassword,
                    preIcon:const Icon(Icons.lock,color: Colors.blueAccent,),
                    suffixIcon:authData.authConfirmPasswordVisability? const Icon(Icons.visibility,color: Colors.blueAccent,):const Icon(Icons.visibility_off,color: Colors.grey,),
                    isPasswordVisability: true,
                    isPasswordField: false,
                    visability: authData.authConfirmPasswordVisability,

                  ),
                ],
              ),
            ),
            GeneralButtonBlock(
                lable: 'Register',
                function:() async {
                   await authData.register(context: context);
         },

                width: double.maxFinite,
                hight: 50,
                textColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                borderRadius: 20,
              labelFontSize: 20,
            ),
            if(state is LoadingRegisterState)
              const CircularProgressIndicator(color: Colors.blue,)
          ],
        ),
      ),
    );
  },
);
  }
}
