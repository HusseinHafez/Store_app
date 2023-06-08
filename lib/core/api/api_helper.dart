abstract class ApiHelper{

  Future<dynamic> postData({required String url ,required Map<String,dynamic> data,Map<String,dynamic>?queryParameters});
  Future<dynamic> putData({required String url ,required Map<String,dynamic> data,Map<String,dynamic>?queryParameters});
  Future<dynamic> getData({required String url ,Map<String,dynamic>?queryParameters});
  Future<dynamic> deleteData({required String url ,Map<String,dynamic>?queryParameters});
}