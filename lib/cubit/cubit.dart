import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/models/user-model.dart';
import 'package:e_commerce/screens/categories.dart';
import 'package:e_commerce/screens/homescreen.dart';
import 'package:e_commerce/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ecommerceCubit extends Cubit<ecommerceStates> {
  ecommerceCubit() : super(GetproductsInitialState());

  static ecommerceCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;

  // List<QueryDocumentSnapshot<ProductModel>>?products;
  List<ProductModel> products = [];
  List<ProductModel> discountproducts = [];
  List<ProductModel> womencolothes = [];


  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  bool isFav = false;

  void changeBottom(int index) {
    currentIndex = index;
    if (index == 2) {

    }
    if (index == 4) {
      getUserData();

    }
    if (index == 0) {
    //  getproducts();
    }

    emit(AppChangeBottomNavState());
  }

  List<Widget> screens = [
    homescreen(),
    categories(),
    Text("1"),
    Text("1"),
    profile(),
  ];
  UserModel ?userModel;
 void changeorder(String orderby){
if(orderby=='rate') {
  womencolothes.sort((a, b) =>
      a.rate.compareTo(b.rate));
}
if(orderby=='price') {
    womencolothes.sort((a, b) =>
        a.price.compareTo(b.price));


}
   emit(orderproductssucessgState());
   print('orderproductssucessgState');

 }
  void getproducts() {
    emit(GetproductsLoadingState());
    print("lodingg...................");

    FirebaseFirestore.instance.collection('products').get().then((value) {
  //    print(value.docs?.length);
int item=0;
      value.docs.forEach((element) {
        products.add(ProductModel.fromJson(element.data()));
        if( ProductModel.fromJson(element.data()).discount>0)
        discountproducts.add(ProductModel.fromJson(element.data()));
        if( ProductModel.fromJson(element.data()).maincategory=='women') {
          womencolothes.add(ProductModel.fromJson(element.data()));
          print("yessssssssssssssssssssssssssss");
          print(item++);
        }


      });
print("llllllldis11");
print(discountproducts.length);
      print("llllllldis22");

      emit(GetproductsSuccessState(products));
      //print(products.length);
      //print(products[1].category);

      print(" get products doneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    }).catchError((error) {
      print(error.toString());
      print("errorrrrrrrrrrrrrrrrrrrrrr in get products");
      emit(GetproductsErrorState(error.toString()));
    });
  }

  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc('ubJHUr3WAytAYn3M4PfE'
    ).get().then((value) {
      //print(value.data());
      userModel = UserModel.fromJson(value.data());
      emit(GetUserSuccessState());
      print(userModel?.name);
      print(userModel?.email);

      print(" get user donee");

    }).catchError((error) {
      print(error.toString());
      print("error in get user");
      emit(GetUserErrorState(error.toString()));
    });
  }



  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    emit(signinwithgoogleSuccessState());
print('signinwithgoogleSuccessState');
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
