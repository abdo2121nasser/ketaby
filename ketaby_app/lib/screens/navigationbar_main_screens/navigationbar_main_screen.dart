
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/blocks/drawer_block.dart';
import '../../core/constants/image_constants.dart';
import '../../core/cubits/navigation_cubit/navigation_cubit.dart';
import '../../core/cubits/profile_cubit/profile_cubit.dart';


class NavigationBarMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var navCubit=NavigationCubit.get(context);
        var profCubit=ProfileCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            toolbarHeight: 60,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Builder(
              builder: (context) => InkWell(
                child: Image.asset(
                  ImageConst.kDrawerImage,cacheHeight: 30,cacheWidth: 30,),
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                   SizedBox(
                     width: 220,
                     child: Row(
                       children: [
                         profCubit.nameController.text.isNotEmpty?
                         Expanded(
                           child: Text('Hi, ${profCubit.nameController.text}',
                           style:const TextStyle(
                             color: Colors.black,fontSize:25, fontWeight: FontWeight.bold
                           ),),
                         ):
            const CircularProgressIndicator(),
                       ],
                     ),
                   ),
                   const SizedBox(height: 5,),
                   const Text('What are you reading today?',
                      style:TextStyle(
                          color: Colors.grey,fontSize:15,
                      ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: profCubit.photo != null?
                  CircleAvatar(
                      radius: 23,
                      backgroundImage: Image.network(profCubit.photo!,).image):
                  const CircularProgressIndicator(),
                )
              ],
            ),
          ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey.shade700,
              onTap: (newIndex) => navCubit.changeScreenIndex(screenIndex1: newIndex,context: context),
              currentIndex:navCubit.screenIndex,
              backgroundColor: Colors.redAccent,
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
                const BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label:'Favourite'),
                const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
                const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          drawer: DrawerBlock(name: profCubit.nameController.text,
              email: profCubit.emailController.text,
          photo: profCubit.photo !=null? profCubit.photo:''
          ),

          body: navCubit.currentScreen,
        );
      },
    );
  },
);
  }
}
