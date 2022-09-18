import 'package:e_commerce/cubit/cubit.dart';
import 'package:e_commerce/cubit/states.dart';
import 'package:e_commerce/screens/homescreen.dart';
import 'package:e_commerce/screens/navbar.dart';
import 'package:e_commerce/shared/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _AuthPageState();
}

class _AuthPageState extends State<signin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  /* @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }*/

  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ecommerceCubit, ecommerceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ecommerceCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60.0,
            horizontal: 32.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'log in',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 80.0),
                  const SizedBox(height: 24.0),

                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    //  onChanged: model.updateEmail,
                    validator: (val) {
                      if (val!.isEmpty)
                        return ('Please enter your email!');

                      if(val.contains('@')==false)
                        return('Please enter a valid  email!');


                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email!',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (val) =>
                    val!.isEmpty ? 'Please enter your password!' : null,
                    //   onChanged: model.updatePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your pasword!',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  //    if (model.authFormType == AuthFormType.login)
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: const Text('Forgot your password?'),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  MainButton(
                    text:
                    'log in',
                    onTap: ()async {
                      if (_formKey.currentState!.validate()) {

                        try{
                          final newuser= await
                          _auth.signInWithEmailAndPassword
                            (
                              email: _emailController.text,
                            password: _passwordController.text,
                          );

                     //     ecommerceCubit.get(context).getproducts();

                          if (newuser!=null){
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeLayoutScreen(),
                              ),

                            );


                          }

                        }

                        catch(e){
                          print(e);
                          print("login error");

                        }



                      }                        },
                  ),
                  const SizedBox(height: 16.0),
                  /*Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        'forget your password?',
                      ),
                      onTap: () {
                        //_formKey.currentState!.reset();
                      },
                    ),
                  ),*/
                  SizedBox(height: size.height * 0.09),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Or log in with social account',
                        style: Theme.of(context).textTheme.subtitle1,
                      )),
                  const SizedBox(height: 16.0),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      GestureDetector(
                        onTap: () {
                          ecommerceCubit.get(context).signInWithGoogle();
                          print("tabbbbbbbbbbbbbbb");
                          navto(context, HomeLayoutScreen());

                        }, // Image tapped
                        child: Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.cover, // Fixes border issues
                          //  width: 110.0,
                          //height: 110.0,
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  },
  );
}
}
