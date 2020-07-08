import 'package:http/http.dart' show Response;
abstract class BaseParserFactory {
  Response handleResponse(Response r);
}