import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cubits/authentication_cubit/authentication_cubit.dart';



class GeneralTextFieldBlock extends StatelessWidget {
  final String hint;
  bool onlyInteger,canEdit,isPasswordVisability,isPasswordField,visability,isLogin;
  final Icon? preIcon,suffixIcon;
  final TextEditingController controller;
  final Color? hintColor;
  GeneralTextFieldBlock({
    this.isLogin=false,
    this.visability=false,
    this.isPasswordVisability=false,
    this.isPasswordField=true,
    this.canEdit=true,
    this.onlyInteger=false,
    required this.hint,
    required this.controller,
     this.preIcon,
     this.suffixIcon,
    this.hintColor
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: isPasswordVisability==true && visability?true :false,
      keyboardType: canEdit? TextInputType.text:TextInputType.none,
controller: controller,
        inputFormatters: <TextInputFormatter>[
         if(onlyInteger)
          FilteringTextInputFormatter.digitsOnly,
        ],
      decoration:  InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
            BorderSide(width: 1.7,color: Colors.grey.shade600)),
        border:const  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        label: Text (hint,
        style: TextStyle(
          color: hintColor
        ),),
         labelStyle: const TextStyle(color: Colors.blueAccent),
         prefixIcon: preIcon,

        suffixIcon: suffixIcon!=null && isPasswordVisability==true?
          InkWell(
            onTap: () {
                 AuthenticationCubit.get(context).changeVisabilityOfPassword(isPasswordField: isPasswordField,isLogin: isLogin);

            },

            child: suffixIcon,)
            :null,


        hintStyle:const TextStyle(color: Colors.black87,fontSize: 20)
      ),
    );
  }
}
