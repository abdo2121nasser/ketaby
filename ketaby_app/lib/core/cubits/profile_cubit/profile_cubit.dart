import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../models/profile_models/profile_model.dart';
import '../../services/dio_helper_services/dio_helper_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  //------------------------------------------------------
  TextEditingController currentPassword    = TextEditingController();
  TextEditingController newPassword        = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();
  //--------------------------------------------------------
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
   String? photo;

  //----------------------------------------------------------

  var pickedFilename;
  File? imageFile;
  var imagePicker=ImagePicker();
  //-----------------------------------------------------------
  ProfileModel? profileModel;

 Future<bool> changePassword() async {
     WidgetsFlutterBinding.ensureInitialized();
     FlutterSecureStorage storage = const FlutterSecureStorage();
     String? token = await storage.read(key: 'token');
      bool isPasswordChanged=false;
    emit(LoadingChangePasswordState());
    await ECommerceDioHelper.postData(url:'update-password',
        data: {
      "current_password": currentPassword.text,
      "new_password": newPassword.text,
      "new_password_confirmation":newConfirmPassword.text
    },
        token: await token
    ).then((value) {
      isPasswordChanged=true;
      emit(SuccessChangePasswordState());
    }).catchError((error) {
      print(error);
      emit(ErrorChangePasswordState());
    });
    return isPasswordChanged;
  }


  setProfileControllers()
  {
    nameController.text=profileModel!.data!.name.toString();
    emailController.text=profileModel!.data!.email.toString();

    phoneController.text=profileModel!.data!.phone==null?'':profileModel!.data!.phone.toString();
    cityController.text=profileModel!.data!.city==null?'':profileModel!.data!.city.toString();
    addressController.text=profileModel!.data!.address==null?'':profileModel!.data!.address.toString();

    photo=profileModel!.data!.image!;
    imageFile=null;
  }
  resetProfileControllers()
  {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    cityController.clear();
    addressController.clear();
    imageFile=null;

    emit(SuccessResetControllersState());
  }
  //todo fix on enter the profile screen reset containers
 // the email is a1@gmail.com
  getProfileData()
  async {
    resetProfileControllers();
   emit(LoadingGetProfilDataState());
   try
       {
         WidgetsFlutterBinding.ensureInitialized();
         FlutterSecureStorage storage = const FlutterSecureStorage();
         String? token = await storage.read(key: 'token');
      var value=   await ECommerceDioHelper.getData(
           url: 'profile',
           token: token,
         );
         profileModel=await ProfileModel.fromJson(value.data);
         setProfileControllers();
         emit(SuccessGetProfileDataState());

       }catch(error)
    {
      emit(ErrorGetProfileDataState());
      print(error);
    }



  }

  Future<void> pickImage()
  async {
   emit(LoadingPickImageState());
       final pickedFile=await imagePicker.pickImage(source: ImageSource.gallery);
       if(pickedFile!=null)
         {
           pickedFilename=pickedFile.path.split('/').last;
           imageFile=File(pickedFile.path);
           emit(SuccessPickImageState());
         }
       else
         {
           print('no image selected');
           emit(ErrorPickImageState());
         }

  }

  updateProfile()
  async {

     try{

       WidgetsFlutterBinding.ensureInitialized();
       FlutterSecureStorage storage = const FlutterSecureStorage();
       String? token = await storage.read(key: 'token').catchError((error){print(error);});
    emit(LoadingUpdateProfileDataState());

       FormData formData = FormData.fromMap({
         'name': nameController.text,
         'email': emailController.text,
         'phone': phoneController.text,
         'address': addressController.text,
         'city': cityController.text,
         if (imageFile != null && imageFile!.path.isNotEmpty && pickedFilename != null)
           'image': [
             await MultipartFile.fromFile(
               imageFile!.path,
               filename: pickedFilename,
             ),
           ],
       });

   var value= await ECommerceDioHelper.postData(
    url: 'update-profile',
     data: {},
       formData: formData,
    token: token
   );
    profileModel=await ProfileModel.fromJson(value.data);
    setProfileControllers();
    emit(SuccessUpdateProfileDataState());
    await getProfileData();
     }catch(error)
    {
    emit(ErrorUpdateProfileDataState());
    print(error);
    }

 }





}



