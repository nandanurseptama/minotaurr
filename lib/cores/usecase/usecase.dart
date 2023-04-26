import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:minotaur/cores/usecase/failure.dart';
import 'package:minotaur/cores/usecase/result_usecase.dart';
import 'package:minotaur/cores/utils/uuid_generator.dart';

/// abstract class for usecase
abstract class Usecase<Params, Result> {
  /// Uuid generator function that will generate processId for logging purpose
  final UUIDGenerator _uuidGenerator;

  Usecase({required UUIDGenerator uuidGenerator})
      : _uuidGenerator = uuidGenerator;

  bool isLoading = false;

  late String processId;
  Future<ResultUsecase<Result, Failure>> call(Params params) async {
    try {
      processId = _uuidGenerator();
      isLoading = true;
      var result = await calling(params);
      isLoading = false;
      return ResultUsecase.ok(result);
    } on Failure catch (e) {
      isLoading = false;
      return ResultUsecase.err(e);
    } catch (e, st) {
      isLoading = false;
      return ResultUsecase.err(Failure(message: "Internal Error", trace: st));
    } finally {
      isLoading = false;
      processId = "";
    }
  }

  /// an abstraction of usecase caller
  Future<Result> calling(Params params);
}

class NoUsecaseParams extends Equatable {
  @override
  List<Object?> get props => [];
}
