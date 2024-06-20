import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocks/clippers_blocks/profile_clipper_block.dart';
import '../../../core/blocks/general_button_block.dart';
import '../../../core/blocks/profile_block.dart';
import '../../../core/cubits/profile_cubit/profile_cubit.dart';


class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var profCubit=ProfileCubit.get(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
           child:
            Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                clipper: ProfileCurveClipper(),
          child: Container(
            color: Colors.blueAccent,
            height: state is LoadingUpdateProfileDataState?170: 140.0,
          ),
        ),
                  Center(
                    child: SizedBox(
                      child: Column(
                        children: [
                         const Padding(
                           padding: EdgeInsets.only(top: 20,),
                           child: Text('Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white
                            ),),
                         ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 0),
                            child:  profCubit!.imageFile==null?
                            profCubit.photo!=null ?InkWell(
                              onTap: (){
                                profCubit.pickImage();
                              },
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 7),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: Image.network(profCubit.photo!).image

                                  )
                                ),

                              ),
                            )
                            :
                            const CircularProgressIndicator(color: Colors.white,)
                                :  InkWell(
                              onTap: (){
                                profCubit.pickImage();
                              },
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 7),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: Image.file(File(profCubit.imageFile!.path)).image

                                    )
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
             const SizedBox(height: 10,),
              const ProfileBlock(),
              SizedBox(height: 10,),
              if(state is LoadingUpdateProfileDataState)
                const CircularProgressIndicator(color: Colors.blue,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: GeneralButtonBlock(lable: 'Edit Profile', function: () async {
                 await profCubit.updateProfile();
                },
                    width: double.maxFinite, hight: 60,
                    textColor: Colors.white, backgroundColor:Colors.blueAccent,
                    borderRadius: 30,labelFontSize: 20),
              ),

            ],
          ),
      ),
    );
  },
);
  }
}
