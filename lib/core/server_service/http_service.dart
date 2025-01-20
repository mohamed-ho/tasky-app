import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tasky/core/failure/exception_handler.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/core/server_service/server_service.dart';
import 'package:tasky/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:tasky/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tasky/tasky_enjection.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class HttpService implements ServerService {
  @override
  Future<dynamic> get(
      {required String url, Map<String, String>? header}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode < 202) {
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 401) {
          await ls<AuthRemoteDataSource>().refreshToken();
          return await get(url: url, header: {
            "Authorization":
                "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
            "Content-Type": "application/json",
          });
        }
        log(response.body);
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> patch(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? header}) async {
    try {
      final response =
          await http.patch(Uri.parse(url), headers: header, body: data);
      if (response.statusCode < 202) {
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 401) {
          await ls<AuthRemoteDataSource>().refreshToken();
          return await patch(
              url: url,
              header: {
                "Authorization":
                    "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
                "Content-Type": "application/json",
              },
              data: data);
        }
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> data,
      File? file,
      Map<String, String>? header}) async {
    try {
      if (file != null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // Add file
        request.files.add(
          await http.MultipartFile.fromPath(
            'image', // Field name on the server
            file.path,
          ),
        );

        // Add additional fields if needed
        request.fields['image'] = path.basename(file.path);

        var response = await request.send();

        if (response.statusCode == 200) {
          return jsonDecode('sucess process');
        } else {
          if (response.statusCode == 401) {
            await ls<AuthRemoteDataSource>().refreshToken();
            return await post(
                url: url,
                header: {
                  "Authorization":
                      "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
                },
                data: data);
          }
          throw ServerFailure(message: response.statusCode.toString());
        }
      } else {
        final response =
            await http.post(Uri.parse(url), headers: header, body: data);

        if (response.statusCode < 202) {
          return jsonDecode(response.body);
        } else {
          if (response.statusCode == 401) {
            await ls<AuthRemoteDataSource>().refreshToken();
            return await post(
                url: url,
                header: {
                  "Authorization":
                      "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
                },
                data: data);
          }
          throw ServerFailure(message: jsonDecode(response.body)['message']);
        }
      }
    } catch (e) {
      log(e.toString());
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, String>? header}) async {
    try {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(data), headers: header);
      if (response.statusCode < 202) {
        return jsonDecode(response.statusCode.toString());
      } else {
        if (response.statusCode == 401) {
          await ls<AuthRemoteDataSource>().refreshToken();

          return await put(
              url: url,
              header: {
                "Authorization":
                    "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
                "Content-Type": "application/json",
              },
              data: data);
        } else {
          throw ServerFailure(message: jsonDecode(response.body)['message']);
        }
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }

  @override
  Future<dynamic> delete(
      {required String url, Map<String, String>? header}) async {
    try {
      final response = await http.delete(Uri.parse(url), headers: header);
      if (response.statusCode < 202) {
        log('deleted');
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 401) {
          await ls<AuthRemoteDataSource>().refreshToken();
          return await delete(url: url, header: {
            "Authorization":
                "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
            "Content-Type": "application/json",
          });
        }
        throw ServerFailure(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      throw ServerFailure(message: ExceptionHandler.getErrorMessage(e));
    }
  }
}
