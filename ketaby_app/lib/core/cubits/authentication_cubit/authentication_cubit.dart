import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/authentication/authentication_model.dart';
import '../../services/dio_helper_services/dio_helper_service.dart';
import '../prodect_cubit/product_cubit.dart';
import '../profile_cubit/profile_cubit.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context)=>BlocProvider.of(context);
  TextEditingController loginEmail=TextEditingController();
  TextEditingController loginPassword=TextEditingController();
  TextEditingController registerEmail=TextEditingController();
  TextEditingController registerName=TextEditingController();
  TextEditingController registerPassword=TextEditingController();
  TextEditingController registerConfirmPassword=TextEditingController();
  AuthenticationModel? authModel;
  bool authPasswordVisability=false;
  bool authConfirmPasswordVisability=false;
  bool authLoginPasswordVisability=false;
   register({required context})
async {
  try
  {
    emit(LoadingRegisterState());
    var value=  await ECommerceDioHelper.postData(url:'register',
        data: {
          'name':registerName.text,
          'email':registerEmail.text,
          'password':registerPassword.text,
          'password_confirmation':registerConfirmPassword.text,
        });
  authModel=await AuthenticationModel.fromJson(value.data);
  FlutterSecureStorage storage =  const FlutterSecureStorage();
  await storage.write(key: 'token', value: authModel!.data!.token.toString())
  .then((value2){
    emit(SuccessSaveTokenState());
  } );
  emit(SuccessRegisterState());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:   Text('Register Success')
    ));

    resetVariables();

    await ProductCubit.get(context).initializeModels(context: context);

  }catch(error)
  {
    print(error.toString());
    emit(ErrorRegisterState());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:   Text('OOPs\nsomething went wrong please check your registration data')
    ));
  }

}
  login({required context})
  async {
  try
    {
      emit(LoadingLoginState());
      var value= await ECommerceDioHelper.postData(
          url:'login',
          data: {
            'email':loginEmail.text,
            'password':loginPassword.text
          });
     authModel=await AuthenticationModel.fromJson(value.data);
     FlutterSecureStorage storage =  const FlutterSecureStorage();
     await storage.write(key: 'token', value: authModel!.data!.token)
         .then((value) {
           print('//////////////////////////////////////////////////////////');
           print(authModel!.data!.token);
       emit(SuccessSaveTokenState());
     });
     emit(SuccessLoginState());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:   Text('Login Success')
      ));
      resetVariables();
   await  ProductCubit.get(context).initializeModels(context: context);
    }
    catch(error)
    {
      print(error.toString());
      emit(ErrorLoginState());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:   Text('oops!!\nthere was a problem in login process')
      ));
    }
  }
  Future<bool> logout()
  async {
    emit(LoadingDeleteTokenState());
    WidgetsFlutterBinding.ensureInitialized();
    bool isTokenDeleted=false;
    FlutterSecureStorage storage =  const FlutterSecureStorage();
   await storage.delete(key: 'token').then((value) {
     emit(SuccessDeleteTokenState());
     isTokenDeleted=true;
    }).catchError((error){
     emit(ErrorDeleteTokentState());
    });
   return isTokenDeleted;
  }


  changeVisabilityOfPassword({required bool isPasswordField,bool isLogin=false})
  {
    if(isLogin)
    {
      authLoginPasswordVisability=!authLoginPasswordVisability;
      emit(ChangePasswordVisabilityState());
      return;
    }
    if(isPasswordField==true)
      {
        authPasswordVisability=!authPasswordVisability;
      }
    else
      {
        authConfirmPasswordVisability=!authConfirmPasswordVisability;
      }
    emit(ChangePasswordVisabilityState());
  }

 Future<bool> isThereIsStoredUser({required context})
  async {
    emit(IsThereIsUserLoadingState());
    WidgetsFlutterBinding.ensureInitialized();
    FlutterSecureStorage storage =  const FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    print(token);
    if(token==null || token.isEmpty)
    {
      emit(IsThereIsUserSuccessState());
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
      return false;
    }
    try
      {
    await ProfileCubit.get(context).getProfileData();
    if(state is ErrorGetProfileDataState)
      {
        emit(IsThereIsUserErrorState());
        await storage.delete(key: 'token');
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
        return false;
      }
    else
      {
        emit(IsThereIsUserSuccessState());
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  NavigationBarMainScreen(),));
        return true;
      }

      }
  catch(error)
  {
    await storage.delete(key: 'token');
    emit(IsThereIsUserErrorState());
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
  return false;
  }


}

resetVariables()
{
  loginEmail.clear();
  loginPassword.clear();
  registerEmail.clear();
  registerPassword.clear();
  registerConfirmPassword.clear();
  registerName.text;
  authPasswordVisability=false;
  authConfirmPasswordVisability=false;
  authLoginPasswordVisability=false;
  authModel=null;
  emit(ResetVariablesState());


}























}



