


import 'package:e_commerce/cubit/cubit.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:e_commerce/models/productmodel.dart';
import 'package:e_commerce/shared/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class womenclothes extends StatefulWidget {
  const womenclothes({Key? key}) : super(key: key);

  @override
  State<womenclothes> createState() => _womenclothesState();
}
late String dropdownValue;
 String? popupitem;

class _womenclothesState extends State<womenclothes> {
  @override
  Widget build(BuildContext context) {
    var womencolothes = ecommerceCubit.get(context).womencolothes;
print(womencolothes[0].image);

    return BlocConsumer<ecommerceCubit, ecommerceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              bottom:  PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(
                          10
                          ,
                        ),
                        color: Colors.grey[200],
                      ),

                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.sort,
                              color: Colors.black,
                            ),
                          ),
Text(
  'filiters'
),
                         SizedBox(
                           width: 140,
                         ),
                          // popup menu button
                            PopupMenuButton<int>(


                              icon: const Icon(
                                Icons.arrow_upward,
                                color: Colors.black,
                              ),
                              itemBuilder: (context) => [

                                // popupmenu item 1
                                PopupMenuItem(
                                  value: 1,
                                  onTap: (){

                                  },


                                  // row has two child icon and text.
                                  child: Row(
                                    children: [
                                       ElevatedButton(
                                        onPressed:(){

                                          popupitem='price';

                                          Navigator.of(context).pop();
                                          print("priceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

                                          ecommerceCubit.get(context).changeorder(popupitem!);


                                        } ,
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24.0),
                                          )
                                        ),
                                        child: Text(
                                          'price'
                                        ),
                                      ),

                                    ],

                                  ),

                                ),
                                // popupmenu item 2
                                PopupMenuItem(
                                  value: 2,
                                  // row has two child icon and text
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed:(){
                                          print("rateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

                                          popupitem='rate';
                                          ecommerceCubit.get(context).changeorder(popupitem!);
                                          Navigator.of(context).pop();

                                        } ,
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(24.0),
                                            )
                                        ),
                                        child: Text(
                                            'rate'
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              offset: Offset(0, 50),
                              color: Colors.grey,
                              elevation: 2,
    onSelected: (value) {
                                print("uuuuuuuuuuuUUUUuuuuuuuuuuuuuuuu");
      Navigator.of(context).pop();
    },

                            ),
                          if(popupitem!=null)
                          Text(popupitem!),

                     /*     Expanded(
                            child: SizedBox(
                              height:60 ,
                              child: DropDownMenuComponent(

                                items: const ['price', 'rate'],
                                hint: 'sort by',
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                    print(dropdownValue);
                                    ecommerceCubit.get(context).changeorder(dropdownValue);

                                  });
                                },
                              ),
                            ),
                          ),*/

                          /*  IconButton(onPressed:(){
                           DropDownMenuComponent(

                             items: const ['price', 'review'],
                             hint: 'sort by',
                             onChanged: (String? newValue) {
                               setState(() {
                                 dropdownValue = newValue!;
                               });
                             },
                           );


                         } ,
                             icon: Icon(
                               Icons.list
                             )),*/


                        ],
                      ),
                    ),
                  )
              ),


              backgroundColor: Colors.red,
              title: Text(
                'Womens clothes',
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
                    color: Colors.black,
                  ),
                ),

              ],

            ),
            body: SingleChildScrollView(

              child: Container(

                height: 600,
                child: ListView.separated(

                  //   physics: Scrollable,

                  //shrinkWrap: true,




                  itemBuilder: (context, index) =>

                buildwomenItems   ( ecommerceCubit.get(context).womencolothes[index],context),


                  separatorBuilder: (context, index) => SizedBox(

                    height: 0,

                  ),

                  itemCount:         ecommerceCubit.get(context).womencolothes.length
                  ,

                ),
              ),
            ),

          );
        }
    );
  }
}

Widget buildwomenItems(var item,context )=> Container(

  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(


      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(
          10
          ,
        ),
        color: Colors.grey[200],
      ),

      height: 150,
      child: Row(

        children: [


          Image(image:NetworkImage(
            // 'https://images.pexels.com/photos/36029/aroni-arsa-children-little.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            // constmodel['data']['user']['imageUrl']
              item.image
                  ,



          ),
            fit: BoxFit.fill,
            width: 130,
            height: 150,

          ),
         SizedBox(
  width: 10,
),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [

            Text(item.name,
              style: TextStyle(

                fontSize: 20,
                fontWeight: FontWeight.bold

              ),

            ),
          SizedBox(
            height: 5,
          ),

          Text(
                item.category
            ),
          SizedBox(
            height: 5,
          ),

          Row(children: [

        for(int i=0;i<item.rate;i++)
          Icon(Icons.star,
color: Colors.orangeAccent,),
        ],),
          SizedBox(
            height: 5,
          ),

        Text(
                item.price.toString()+"\$"
            ),
        ],),
      ),

          SizedBox(
            width: 20,
          ),



        ],
      ),
    ),
  ),
)  ;
