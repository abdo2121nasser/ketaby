
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/authentication_screens/login_screen.dart';
import '../../screens/other_screens/change_password_screen.dart';
import '../../screens/other_screens/order_history_screen.dart';
import '../constants/image_constants.dart';
import '../cubits/authentication_cubit/authentication_cubit.dart';
import '../cubits/navigation_cubit/navigation_cubit.dart';
import '../cubits/prodect_cubit/product_cubit.dart';


class DrawerBlock extends StatelessWidget {
 String name,email;
 String? photo;

 DrawerBlock({required this.name,required this.email,required this.photo});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return BlocConsumer<NavigationCubit, NavigationState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var authCubit=AuthenticationCubit.get(context);
    var navCubit=NavigationCubit.get(context);
    var prodCubit= ProductCubit.get(context);
    return Drawer(
       child: ListView(
         physics: const BouncingScrollPhysics(),
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.only(bottom: 5),
               child:photo!.isNotEmpty?
               CircleAvatar(
                   radius: 35,
                   backgroundImage: Image.network(photo!,).image)
               :
               const CircularProgressIndicator(color: Colors.white,),
             ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(name,
                    style:const TextStyle(
                      color: Colors.white,fontSize:20,fontWeight: FontWeight.bold
                    ),),
                ),
              ],
            ),const SizedBox(height: 5,),
             Row(
               children: [
                 Expanded(
                   flex:1 ,
                   child: Text(email,
                     style:const TextStyle(
                       color: Colors.white,fontSize:16,
                     ),),
                 ),
               ],
             ),
           ],
                )
            ),
            ListTile(

              leading: const Icon(
                Icons.history_edu_outlined,
                color: Colors.grey,
              ),
              title: const Text('Order History',
              style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
              onTap: () {
                // Handle the onTap event for the Home item
                prodCubit.getAllOrderHistory();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  OrderHistoryScreen(),));
                Scaffold.of(context).closeDrawer();
              },
            ),
           const Divider(thickness: 2,endIndent: 20,indent: 20,),
            ListTile(
              leading: const Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              title: const Text('Edit Profile',
    style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
              onTap: () {
               navCubit.changeScreenIndex(screenIndex1: 4,context: context);
               Scaffold.of(context).closeDrawer();
              },
            ),
            const Divider(thickness: 2,endIndent: 20,indent: 20,),
            ListTile(

              leading: const Icon(
                Icons.change_circle_outlined,
                color: Colors.grey,
              ),
              title: const Text('Change Password',
                style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
              onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen(),));
              },
            ),
            const Divider(thickness: 2,endIndent: 20,indent: 20,),
            ListTile(

              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text('LogOut',
                style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
              onTap: () async {
              bool isLogout= await authCubit.logout();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: await isLogout?const Text('successful logout')
                    :const Text('oops!!\nthere was a problem'),
              ));
              if(isLogout)
                {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                }
              },
            ),
          ],
        )
    );
  },
);
  },
);
  },
);
  }
}
