import 'package:dio/dio.dart';
import 'package:minotaur/cores/usecase/failure.dart';
/// catcher for any error on repository
Failure repositoryErrorHandler(
    {required dynamic err, StackTrace? trace, required String processId}) {
  if (err is DioError) {
    var response = err.response;
    // when response was null
    //
    // return Failure with Internal Error message
    //
    if (response == null) {
      return Failure(
          message: "Internal Error",
          trace: err.stackTrace,
          processId: processId);
    }
    // when response body was null
    //
    // return Failure with Internal Error message
    //
    // this error may occured when no internet connection or there is an error in API
    if (response.data == null) {
      return Failure(
          message: "Internal Error",
          trace: trace ?? StackTrace.fromString("Response API null"),
          processId: processId);
    }
    //
    // when response body message was null
    //
    // return Failure with Internal Error message
    //
    // this error occured when API send response with invalid body json
    //
    if (response.data['message'] == null) {
      return Failure(
          message: "Internal Error",
          trace: trace ?? StackTrace.fromString("Response API message null"),
          processId: processId);
    }
    //
    // when response body message was not string
    //
    // return Failure with Internal Error message
    //
    // this error occured when API send response with invalid body message type
    //
    if (response.data['message'] is! String) {
      return Failure(
          message: "Internal Error",
          trace:
              trace ?? StackTrace.fromString("Response API message not string"),
          processId: processId);
    }
    //return failure with API response message
    return Failure(
        message: response.data['message']!,
        trace: err.stackTrace,
        processId: processId);
  }
  // This error occured from internal function
  return Failure(
      message: "Internal Error",
      trace: trace ?? StackTrace.current,
      processId: processId);
}
