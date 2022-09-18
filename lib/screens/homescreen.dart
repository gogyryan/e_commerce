

import 'package:e_commerce/cubit/cubit.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:e_commerce/screens/productdetalis.dart';
import 'package:e_commerce/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   //  ecommerceCubit.get(context).getproducts();

    var productmodel = ecommerceCubit.get(context).products;
    print("hiiiiiiiiiiii");
     print(productmodel[1].name);
     print(ecommerceCubit.get(context).discountproducts.length);

    return BlocConsumer<ecommerceCubit, ecommerceStates>(
        listener: (context, state) {},
        builder: (context, state) {
    return Scaffold(
      appBar: null,
      body:
       SafeArea(
         child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/images/home.png",
                    width: double.infinity,
                    height: size.height * 0.3,
                    fit: BoxFit.cover,
                  ),

                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      width: double.infinity,
                      height: size.height * 0.3,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    child: Text(
                      'Street Clothes',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                const SizedBox(height: 24.0),
                Text("Sale",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold

                )),
                Text("super summer sale"),
           ecommerceCubit.get(context).discountproducts.length!=0?


      Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.separated(

                  //   physics: Scrollable,

                     //shrinkWrap: true,

                      scrollDirection: Axis.horizontal,



                     itemBuilder: (context, index) =>

                        buildItem( ecommerceCubit.get(context).discountproducts[index],context),
                  /*   Image(image:                 NetworkImage(
                       'https://www.linkpicture.com/q/image-2@2x.png',
                       // 'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                       // constmodel['data']['user']['imageUrl']
                       //    user.imageUrl


                     )),*/


                         separatorBuilder: (context, index) => SizedBox(

                       width: 3,

                     ),

                     itemCount:         ecommerceCubit.get(context).discountproducts.length
                      ,

                        ),
                  ),
                ):
                Center(
                  child: CircularProgressIndicator(),
                ),


           //      SizedBox(height: 5.0),
                Text("New",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold

                    )),
                Text("you have never see it before"),
                ecommerceCubit.get(context).products.length!=0?


                Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.separated(

                      //   physics: Scrollable,

                      //shrinkWrap: true,

                      scrollDirection: Axis.horizontal,



                      itemBuilder: (context, index) =>

                          buildItem( ecommerceCubit.get(context).products[index],context),


                      separatorBuilder: (context, index) => SizedBox(

                        width: 3,

                      ),

                      itemCount:         ecommerceCubit.get(context).products.length
                      ,

                    ),
                  ),
                ):
                Center(
                  child: CircularProgressIndicator(),
                )
                  ],
                ),
              )
            ],
          ),
      ),
       ),
    );
    }
  );
  }
}



Widget buildItem(var product,context)=>
InkWell(
  onTap: (){

    navto(context,    ProductDetails(product: product));
  },
  child:   Stack(

    alignment: AlignmentDirectional.topStart,



    children: [

          Container(















             child: Padding(



               padding: const EdgeInsets.all(5.0),



               child: Column(



                 mainAxisAlignment: MainAxisAlignment.start,



                 crossAxisAlignment: CrossAxisAlignment.start,



                 children: [







                      Image(image:                 NetworkImage(



                     //   'https://www.linkpicture.com/q/image-2@2x.png',



                        // 'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),



                        // constmodel['data']['user']['imageUrl']



                        //    user.imageUrl



                        product.image











                      ),



                        fit: BoxFit.fill,



                        width: 140,



                        height: 150,



                      ) ,































      Row(



        children: [



          for(int i=0;i<product.rate;i++)Icon(Icons.star,



              color: Colors.orangeAccent,







            )



          /*  IconButton(



                onPressed: (){},



                icon: Icon(Icons.star_border_outlined)



            )*/



        ],



      ),







                   SizedBox(



                     width: 5,



                   ),



                   Text(product.name,



                     style: TextStyle(



                       fontSize: 19,



                       fontWeight: FontWeight.bold



                     ),



                   ),



                   Row(



                     children: [



                       Text(product.oldPrice.toString()+'\$',



                         style: TextStyle(







      color: Colors.grey



                         ),



                       ),



                       SizedBox(



                         width: 10,



                       ),







                       Text(product.price.toString()+'\$',



                         style: TextStyle(



                             color: Colors.red



                         ),



                       ),















                     ],



                   )







                 ],



               ),



       )  ,



       ),

      if(product.discount>0)

      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),



        child: CircleAvatar(

            radius: 15.0,

          backgroundColor: Colors.red,

          child:Text(product.discount.toString()+'%',

            style: TextStyle(

              fontSize: 15

            ),

          ),



        ),

      )



    ],

  ),
);