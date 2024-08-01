enum AppTheme { light, dark }

enum NetworkException {
  noInternetConnection,
  timeOutError,
  unknown,
}

enum HttpException {
  badRequest, //400 -  API rejected request
  unauthorized, //401 - user- is not authorised
  forbidden, //403 - API rejected request
  notFound, //404 - not found
  internalServerError, //500 - crash in server side
  unknown,
}
