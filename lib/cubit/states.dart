
abstract class ecommerceStates {}

class GetproductsInitialState extends ecommerceStates {}
class AppChangeBottomNavState extends ecommerceStates {}

///////////////////////////////////
class GetproductsLoadingState extends ecommerceStates {}

class GetproductsSuccessState extends ecommerceStates
{
  var productsModel;

  GetproductsSuccessState(this.productsModel);
}

class GetproductsErrorState extends ecommerceStates
{
  final dynamic error;

  GetproductsErrorState(this.error);
}
/////////////////////////////////////
class GetUserLoadingState extends ecommerceStates{}

class GetUserSuccessState extends ecommerceStates{}
class GetUserErrorState extends ecommerceStates{

  final dynamic error;
  GetUserErrorState(this.error);

}
//////
class orderproductssucessgState extends ecommerceStates{}
///////////
class signinwithgoogleSuccessState extends ecommerceStates{}