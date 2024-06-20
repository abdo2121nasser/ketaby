
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/navigationbar_main_screens/navigationbar_main_screen.dart';
import '../../cubits/authentication_cubit/authentication_cubit.dart';
import '../general_button_block.dart';
import '../general_text_field_block.dart';


class LoginBlock extends StatelessWidget {
  const LoginBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SuccessLoginState){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBarMainScreen(),));
        }
      },
      builder: (context, state) {
        var authData=AuthenticationCubit.get(context);
        return Container(
          //margin: EdgeInsets.symmetric(horizontal: 30),
          height: state is LoadingLoginState?290:250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent
                , width: 3),
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
                        hint: 'Email',
                        controller: authData.loginEmail,
                        preIcon: const Icon(
                          Icons.email, color: Colors.blueAccent,),
                      ),
                      const SizedBox(height: 10,),
                      GeneralTextFieldBlock(
                        hint: 'Password',
                        controller:authData.loginPassword,
                        preIcon: const Icon(
                          Icons.lock, color: Colors.blueAccent,),
                        suffixIcon:authData.authLoginPasswordVisability? const Icon(Icons.visibility,color: Colors.blueAccent,):const Icon(Icons.visibility_off,color: Colors.grey,),

                        isLogin: true,
                        visability: authData.authLoginPasswordVisability,
                        isPasswordVisability: true,
                      ),
                    ],
                  ),
                ),
                GeneralButtonBlock(lable: 'Login',
                    function: () async {
                      await authData.login(context: context);

                    },
                    width: double.maxFinite,
                    hight: 50,
                    textColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    borderRadius: 20,
                  labelFontSize: 20,
                ),
                if(state is LoadingLoginState)
                  const CircularProgressIndicator(color: Colors.blue,)
              ],
            ),
          ),
        );
      },
    );
  }
}
