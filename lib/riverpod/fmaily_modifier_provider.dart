import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>,int>((ref, data) async{
  await Future.delayed(Duration(seconds: 1,));
  return List.generate(5, (index) => index * data);
});//입력으로 data를 받아서 입력에 따라 다른값 리턴해줌