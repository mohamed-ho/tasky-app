import 'dart:io';

abstract class ServerService {
  Future<dynamic> get({required String url, Map<String, String>? header});
  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, String>? header});

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> data,
      File? file,
      Map<String, String>? header});
  Future<dynamic> patch(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? header});
  Future<dynamic> delete({required String url, Map<String, String>? header});
}
