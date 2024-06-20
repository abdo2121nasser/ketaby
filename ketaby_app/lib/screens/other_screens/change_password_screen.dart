
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocks/general_button_block.dart';
import '../../core/blocks/general_text_field_block.dart';
import '../../core/cubits/profile_cubit/profile_cubit.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var profCubit=ProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text('Change Password',
            style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding:const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
            height: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: Colors.green.shade400)
              ),
              child: Column(
                children: [
                  GeneralTextFieldBlock(hint: 'current Password', controller:profCubit.currentPassword),
                  const SizedBox(height: 10,),
                  GeneralTextFieldBlock(hint: 'new Password', controller:profCubit.newPassword),
                  const SizedBox(height: 10,),
                  GeneralTextFieldBlock(hint: 'confirm new Password', controller:profCubit.newConfirmPassword),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GeneralButtonBlock(
                        lable: 'change password',
                        function: () async {
                          bool isPasswordChanged= await profCubit.changePassword();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: await isPasswordChanged?const Text('successful Password Changed')
                                  :const Text('oops!!\nthere was a problem'),
                          ));
                        },
                        width: double.maxFinite, hight: 50,
                        textColor: Colors.white, backgroundColor: Colors.blueAccent,
                        borderRadius: 20,labelFontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
