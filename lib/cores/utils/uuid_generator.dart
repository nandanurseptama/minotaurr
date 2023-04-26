import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class UUIDGenerator {
  final Uuid _uuid;
  UUIDGenerator({@preResolve required Uuid uuid}) : _uuid = uuid;
  String call() {
    return _uuid.v4();
  }
}
