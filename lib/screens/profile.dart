

import 'package:e_commerce/cubit/cubit.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:e_commerce/screens/productdetalis.dart';
import 'package:e_commerce/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     var user= ecommerceCubit.get(context).userModel;
     print("profillllll");

     print(user?.email);
    print(user?.name);



    return BlocConsumer<ecommerceCubit, ecommerceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
             title: Text('My Profile')
            ),
            body:
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          // bottom: 3.0,
                          // end: 3.0,
                            top: 20
                        ),
                        child: CircleAvatar(
                            radius: 50.0,

                            backgroundImage: NetworkImage(
user!.image!
                            )
                        ),
                      ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(user!.name![0].toUpperCase()+user!.name!.substring(1)
                             ,
                           style: TextStyle(
                             fontWeight: FontWeight.bold,

                                 fontSize: 20
                           ),
                         ),
                        SizedBox(
                          height: 5,
                        ),

                        Text(user!.email!,
                          style: TextStyle(
color: Colors.grey
                          ),

                        )

                      ],
                    )

                    /*  Container(
   color: Colors.red,
   child: MaterialButton(
onPressed: ()
                    {
                      var productmodel = ecommerceCubit.get(context).getUserData();

                      print("هااااااااHHHHHHHHHHHHHHHااااااااااااااااجر");
                    },
            ),
 ),*/

                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}



