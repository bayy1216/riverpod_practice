import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';
//1- 어떤 프로바이더를 사용할지 고민 안하도록
//2- 파라미터 -family에서 파라미터 만드는거 자동으로

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');


@riverpod
String gState(GStateRef ref){
  return 'Hello Code Generation';
}


@riverpod
Future<int> gStateFuture(GStateFutureRef ref)async{
   await Future.delayed(Duration(seconds: 3));

   return 10;
}

@Riverpod(
  keepAlive: true,
)//autodispose안하는거
Future<int> gStateFuture2(GStateFuture2Ref ref)async{
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

class Parameter{
  final int number1;
  final int number2;
  Parameter({required this.number1, required this.number2});
}
final _test = Provider.family<int, Parameter>((ref, parameter) => parameter.number1 * parameter.number2);

@riverpod
int gStateMultiply(GStateMultiplyRef ref,{required int number1, required int number2}){
  return number1 * number2;
}



@riverpod
class GStateNotifier extends _$GStateNotifier{

  @override
  int build(){
    return 0;
  }

  increment(){
    state++;
  }
  decrement(){
    state--;
  }
}