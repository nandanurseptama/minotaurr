import 'package:equatable/equatable.dart';
/// A class that represent error
class Failure extends Equatable implements Exception {
  /// Used for logging purposes
  final String processId;
  // Pass this value to UI. i would assume the error message from Remote API has meaningfull message to User
  final String message;
  /// Used for logging purposes. Pass technical error to this property
  final StackTrace trace;

  const Failure(
      {required this.message, required this.trace, this.processId = ""});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, trace, processId];
}
