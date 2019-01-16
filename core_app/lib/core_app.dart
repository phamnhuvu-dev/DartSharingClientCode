/// Support for doing something awesome.
///
/// More dartdocs go here.
library core_app;

// Models
export 'package:core_app/src/data/models/user/user.dart';
export 'package:core_app/src/data/models/task/task.dart';


// Blocs


// Global blocs

// Inject
export 'src/di/injector.dart';
export 'src/di/inject_bloc.dart';
export 'src/di/inject_repository.dart';
export 'src/di/inject_module.dart';

// Repositories service
export 'src/data/repositories/user/user_repository_service.dart';
export 'src/data/repositories/user/user_api_service.dart';

// Static
export 'src/statics/routes.dart';


// Src
export 'package:core_app/src/features/bloc.dart';
export 'package:core_app/src/features/user_global_bloc.dart';
export 'package:core_app/src/features/task_global_bloc.dart';

//Module
export 'package:core_app/src/modules/validator.dart';


export 'package:tuple/tuple.dart';

// TODO: Export any libraries intended for clients of this package.
