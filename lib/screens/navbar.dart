
//................
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/cubit/cubit.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ecommerceCubit, ecommerceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ecommerceCubit.get(context);
        return Scaffold(
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar:CurvedNavigationBar(
            items:  <Widget>[
              Icon(Icons.home_filled, size: 30,
                color: cubit.currentIndex==0?Colors.white:Colors.black,
              ),
              Icon(Icons.shopping_cart_rounded, size: 30,
                color: cubit.currentIndex==1?Colors.white:Colors.black,
              ),



              Icon(Icons.shopping_bag, size: 30,
                color: cubit.currentIndex==2?Colors.white:Colors.black,
              ),
              Icon(Icons.favorite ,size: 30,
                color: cubit.currentIndex==3?Colors.white:Colors.black,
              ),

           /*   ImageIcon(
                AssetImage("images/qrcode.png"),
                color: cubit.currentIndex==3?Colors.white:Colors.black,
              ),*/


              Icon(Icons.person, size: 30,
                color: cubit.currentIndex==4?Colors.white:Colors.black,
              ),
            ],
            index: cubit.currentIndex,
            height: 60.0,
            color: Colors.red,
            buttonBackgroundColor: Colors.red,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              cubit.changeBottom(index);
            },
            letIndexChange: (index) => true,
          ),
        );
      },
    );
  }
}
