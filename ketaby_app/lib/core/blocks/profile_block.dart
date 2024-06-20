import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/profile_cubit/profile_cubit.dart';
import 'general_text_field_block.dart';


class ProfileBlock extends StatelessWidget {
  const ProfileBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var profCubit=ProfileCubit.get(context);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(children: [
            GeneralTextFieldBlock(hint: 'name', controller: profCubit.nameController,
              preIcon: const Icon(Icons.person, color: Colors.blueAccent,),
              hintColor: Colors.black,),
            const SizedBox(height: 15,),
            GeneralTextFieldBlock(hint: 'email', controller: profCubit.emailController,
              preIcon: const Icon(Icons.email, color: Colors.blueAccent,),canEdit: false,
              hintColor: Colors.black,),
            const SizedBox(height: 15,),
            GeneralTextFieldBlock(hint: 'phone', controller: profCubit.phoneController,
              preIcon: const Icon(Icons.phone, color: Colors.blueAccent),onlyInteger: true,
              hintColor: Colors.black,),
            const SizedBox(height: 15,),
            GeneralTextFieldBlock(hint: 'city', controller:profCubit.cityController,
              preIcon: const Icon(
                  Icons.location_city, color: Colors.blueAccent),
              hintColor: Colors.black,),
            const SizedBox(height: 15,),
            GeneralTextFieldBlock(
              hint: 'address', controller: profCubit.addressController,
              preIcon: const Icon(
                  Icons.location_on_sharp, color: Colors.blueAccent),
              hintColor: Colors.black,),
          ],
          ),
        );
      },
    );
  }
}
