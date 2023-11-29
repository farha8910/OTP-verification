import 'dart:developer';

void main(){
  int a = 10;
  int b = 35;
  add(a, b);
}

Future<void>add(int a,int  b)async{
  final sum =await Future.delayed(Duration(seconds: 2),()=>(a+b));
  return log(sum as String);
}