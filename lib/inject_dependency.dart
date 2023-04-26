
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'inject_dependency.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
  asExtension: false,
  initializerName: '\$Init',
  preferRelativeImports: true,
  
)
void initDependency() => $Init(getIt);

