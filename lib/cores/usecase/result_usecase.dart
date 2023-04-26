import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_usecase.freezed.dart';

@freezed
class ResultUsecase<Success, Fail> with _$ResultUsecase<Success, Fail>{
  const factory ResultUsecase.ok(Success data) = Ok<Success, Fail>;
  const factory ResultUsecase.err(Fail data) = Err<Success, Fail>;
}