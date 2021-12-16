import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    // add your local storage here to load for every request
    // var token = LocalStorage.readToken();
    // final String userToken = AuthService().getToken();

    //1.base_url
    httpClient.baseUrl = '';
    //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 45);
    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Charset': 'utf-8'
    // };
    // httpClient.addAuthenticator(authInterceptor);
    // httpClient.addRequestModifier(requestInterceptor);
    // httpClient.addResponseModifier(responseInterceptor);

    httpClient.addResponseModifier((request, response) async {
      // print(response.body.toString());
      return response;
    });

    httpClient.addRequestModifier<void>((request) async {
      // request.headers['apikey'] = '12345678';
      // print('userToken :: $userToken');
      // request.headers['Authorization'] = 'Bearer $userToken';
      return request;
    });
    // httpClient.addRequestModifier((request) async {
    //   // add request here
    //   return request;
    // });
    // var headers = {'Authorization': "Bearer $token"};
    // httpClient.addAuthenticator((request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });
    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;

    super.onInit();
  }
}
