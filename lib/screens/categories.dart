


import 'package:e_commerce/cubit/cubit.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/screens/womenswear.dart';
import 'package:e_commerce/shared/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class categories extends StatelessWidget {
  const categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>categorytitles=[
    'New',
      'Clothes',
      'Shoes',
      'Accessories'
    ];
    List<Image>categoryimg=[
      Image.asset(
        "assets/images/new.png",

      ),
      Image.asset(
        "assets/images/clothes.png",

      ),

      Image.asset(
        "assets/images/shoes.png",

      ),
      Image.asset(
        "assets/images/acc.png",

      ),
    ];

    return BlocConsumer<ecommerceCubit, ecommerceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  'Cateories',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                      color: Colors.grey.shade100,
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Colors.red),
                  ),


                    ),
                    labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    isScrollable: true,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 4,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.green,
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    tabs: [
                      //  itemproducts(ShopLoginCubit.get(context).products),

                      Tab(
                        child: Text('women'),
                      ),

                      Tab(
                        child: Text('men'),
                      ),
                      Tab(
                        child: Text('kids'),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 3,
                    ),

                  Expanded(
                    child: TabBarView(

                      children: [
                        // first tab bar view widget
                      //  Text('women'),
                        itemwomen(context),
                        Text('men'),

                        Text('kids')


                      ],
                    ),

                  ),

                ],
              ),

            ),
          );
        }
    );
  }
}

  Widget itemwomen(context) =>
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width:double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                  30,

                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text('SUMMER SALES',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                    Text('Up to 50% off'),

                  ],

                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Container(
    width:double.infinity,
    decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(
                3,
              ),
              color: Colors.grey[200],
    ),

    child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('New',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/new.png",

                  ),
                ],

          ),
    ),
  ),
  SizedBox(
    height: 5,
  ),
  GestureDetector(
    onTap: (){
      navto(context, womenclothes());
    },
    child: Container(
      width:double.infinity,
      decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(
              3,
            ),
            color: Colors.grey[200],
      ),

      child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,


              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Clothes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/clothes.png",

                ),
              ],

            ),
      ),
    ),
  ),
  SizedBox(
    height: 5,
  ),

  Container(
    width:double.infinity,
    decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(
            3,
          ),
          color: Colors.grey[200],
    ),

    child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Shoes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              Spacer(),
              Image.asset(
                "assets/images/shoes.png",

              ),
            ],

          ),
    ),
  ),
  SizedBox(
    height: 5,
  ),

  Container(
    width:double.infinity,
    decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(
            3,
          ),
          color: Colors.grey[200],
    ),

    child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Accessories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              Spacer(),
              Image.asset(
                "assets/images/acc.png",

              ),
            ],

          ),
    ),
  ),

  /*Container(
    width:double.infinity,
    decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(
                3,
              ),
              color: Colors.grey[100],
    ),

    child: Row(
              children: [
                Text('Clothes'),
                Image.asset(
                  "assets/images/clothes.png",

                ),
              ],

    ),
  ),
  Container(
    width:double.infinity,
    decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(
                3,
              ),
              color: Colors.grey[100],
    ),

    child: Row(
              children: [
                Text('Accessories'),
                Image.asset(
                  "assets/images/acc.png",

                ),
              ],

    ),
  ),
  Container(
    width:double.infinity,
    decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(
                3,
              ),
              color: Colors.grey[100],
    ),

    child: Row(
              children: [
                Text('Shoes'),
                Image.asset(
                  "assets/images/shoes.png",

                ),
              ],

    ),
  ),*/

],
              ),
            ),
          ),
        ],
      );

