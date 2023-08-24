import 'package:dio/dio.dart';

import '../models/user.dart';
import '../utils/configuration.dart';

class Repository {

  Dio _dio = Dio();

  Repository() {
    /*_dio.options.baseUrl = Configuration.api;
    ..interceptors.add(LogInterceptor())
    ..httpClientAdapter = Http2Adapter(
    ConnectionManager(
    idleTimeout: 10000,
    // Ignore bad certificate
    onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
    ),
    );*/

    var dio = Dio()
      ..options.baseUrl = 'https://google.com'
      ..interceptors.add(LogInterceptor())
      ..httpClientAdapter = Http2Adapter(
        ConnectionManager(
          idleTimeout: 10000,
          // Ignore bad certificate
          onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
        ),
      );
  }


  Future<Map> LoginAPI(String email, String password) async {

    var map = <String, dynamic>{};

    try {
        Response response = await _dio.post("/login", data: {
          "email": email,
          "password": password
        },
        options: Options(
            //ollowRedirects: false,
            //validateStatus: (status) { return status! < 500; },
            followRedirects: false,
            validateStatus: (status) => true,
            headers: {'Content-type': 'application/json; charset=UTF-8'}
        )
      );

      print("RESPUESTA DEL SERVIDOR");
      print(response.data);

      map['user'] = response.data;

      //User user = User.fromJson(response.data["user"]);

      return map;
    } catch (e) {
      return {"error": e};
    }
  }
}