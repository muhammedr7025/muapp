import '../../../constants/api_const/api_const.dart';
import '../interceptor/app_dio.dart';

class IGListApi {
  Future iGListApi({required String ig,required String district}) async {
    const String subUrl = "lc-list?ig=Web Development&district=Thiruvananthapuram";
    String uri = AppAPI.baseUrl + subUrl;
    final queryParam ={
      "ig":ig,
      "district":district
    };
    final response = await Api().dio.get(
      uri,queryParameters: queryParam
    );
    final statusCode = response.statusCode;
    final body = response.data;
    if (statusCode == 201 || statusCode == 200) {
      return body;
    }
  }
}