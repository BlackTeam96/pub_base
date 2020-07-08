import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client, Response;
import 'package:pub_base/src/repositories/api_error/client_error.dart';
import 'package:pub_base/src/repositories/response/base_parser.dart';
export 'dart:io';
export 'dart:convert';

abstract class BaseRepositoryFactory {
  Client client = Client();
  final String baseUrl;
  final Map<String, String> headers;
  final BaseParserFactory resHandle;

  BaseRepositoryFactory(this.baseUrl, this.headers, this.resHandle);

  String _toUrl(String path) => '$baseUrl$path';

  String getBaseUrl() => this.baseUrl;

  String toString() {
    return "baseUrl: $baseUrl \nHeader:${headers.toString()}";
  }

  Future<Response> get(String path) => client.get(_toUrl(path), headers: headers)
    .then(_handleResponse)
    .catchError(_handleOffline, test: (e) => e is SocketException);

  Future<Response> delete(String path) => client.delete(_toUrl(path), headers: headers)
    .then(_handleResponse)
    .catchError(_handleOffline, test: (e) => e is SocketException);
  Future<Response> post(String path, dynamic payload) => client.post(_toUrl(path), headers: headers, body: payload == null ? '' : json.encode(payload))
    .then(_handleResponse)
    .catchError(_handleOffline, test: (e) => e is SocketException);
  Future<Response> put(String path, dynamic payload) => client.put(_toUrl(path), headers: headers, body: payload == null ? '' : json.encode(payload))
    .then(_handleResponse)
    .catchError(_handleOffline, test: (e) => e is SocketException);
  Future<Response> patch(String path, dynamic payload) => client.patch(_toUrl(path), headers: headers, body: payload == null ? '' : json.encode(payload))
    .then(_handleResponse)
    .catchError(_handleOffline, test: (e) => e is SocketException);
  Future<Response> unSecurePost(String path, dynamic payload) => client.post(
      _toUrl(path), headers: {'Content-Type': 'application/json'}, body: payload == null ? '' : json.encode(payload))
      .then(_handleResponse)
      .catchError(_handleOffline, test: (e) => e is SocketException);

  // Future<TrailerModel> fetchTrailer(int movieId) async {
  //   final response =
  //       await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

  //   if (response.statusCode == 200) {
  //     return TrailerModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load trailers');
  //   }
  // }

  Response _handleResponse(Response r) {
    return resHandle.handleResponse(r);
  }
  _handleOffline(dynamic e) {
    throw ClientError(status: 500, message: "unknown error!");
  }
}