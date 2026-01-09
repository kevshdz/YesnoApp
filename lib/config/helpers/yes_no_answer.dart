import 'package:dio/dio.dart';
import 'package:yes_no_app/config/models/yes_no_model.dart';
import 'package:yes_no_app/screens/domain/entities/message.dart';

class GetYesNoAnswer{
  final _dio = Dio();
  Future <Message> getAnswer() async{
    final response  = await _dio.get("https://yesno.wtf/api");
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    print("Response : ${response.data}");
    return yesNoModel.toMessageEntity();
  }

}