import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payme/api.dart';
import 'package:payme/models/payme_model.dart';
import '../dio/dio_error_exception.dart';
import '../log_service.dart';

class PaymeService {
static Future<Either<String, List<PaymeModel>>> paymeService() async {
 try {
Response response = await Dio().get(
  '${Payme.getPayme}/payme',
);
Log.w(response.statusCode.toString());
if(response.statusCode == 200 || response.statusCode == 201){
  List<PaymeModel> photos = [];
  for (var e in (response.data as List)) {
    photos.add(PaymeModel.fromJson(e));
  }
  return right(photos);
}else{
  Log.e(DioExceptions.fromDioError(response.data).toString());
  return left(DioExceptions.fromDioError(response.data).toString());
}
 } on DioError catch (e) {
   Log.e(e.toString());
   if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
     return left('Token xatoo');
   }
   return left(DioExceptions.fromDioError(e).toString());
 } catch (m) {
   Log.e(m.toString());
   return left(m.toString());
 }
}
}