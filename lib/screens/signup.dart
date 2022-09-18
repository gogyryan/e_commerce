import 'package:e_commerce/shared/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _nameController =TextEditingController();
  final _nameFocusNode= FocusNode();
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
                            'Register',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 80.0),
                      TextFormField(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_emailFocusNode),
                        textInputAction: TextInputAction.next,
                        //  onChanged: model.updateEmail,
                        validator: (val) =>
                        val!.isEmpty ? 'Please enter your mame!' : null,
                        decoration: const InputDecoration(
                          labelText: 'name',
                          hintText: 'Enter your name!',
                        ),
                      ),
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
                             'Register',
                        onTap: ()async {
                          if (_formKey.currentState!.validate()) {


    try{
    final newuser= await
    _auth.createUserWithEmailAndPassword
    (
   //   name:_nameController.text,
      email: _emailController.text,
    password: _passwordController.text,
    );
    }
    catch(e){
    print(e);
    print("regester error");

    }
    print("regester doneeeeeeeeeee");

                            /*Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatScreen(),),);*/

                          }                        },
                      ),
                      const SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Text(
                                 'Have an account? Login',
                          ),
                          onTap: () {
                            //_formKey.currentState!.reset();
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.09),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                                 'Or Register with',
                            style: Theme.of(context).textTheme.subtitle1,
                          )),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          InkWell(
                            onTap:(){
                              print('yess');
                            } ,
                            child: const Image(
                              image: AssetImage('images/HH.png'),

                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: (){},
                            child: const Image(
                              image: AssetImage('images/facebook.png'),

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

  }
}