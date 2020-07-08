class ClientError implements Exception {
  ClientError({this.status, this.message});

  int status;
  String message;
}