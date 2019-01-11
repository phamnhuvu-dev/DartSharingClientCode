/// Support for doing something awesome.
///
/// More dartdocs go here.
library core_app;

// Models
export 'src/data/models/user.dart';
export 'src/data/models/task.dart';


// Blocs


// Global blocs

// Inject
export 'src/di/injector.dart';
export 'src/di/inject_screen.dart';
export 'src/di/inject_bloc.dart';
export 'src/di/inject_repository.dart';

// Repositories service
export 'src/data/repositories/user/user_repository_service.dart';
export 'src/data/repositories/user/user_api_service.dart';

// Static
export 'src/statics/routes.dart';


// Src
export 'package:core_app/src/features/bloc.dart';
export 'package:core_app/src/features/flutter_global_bloc.dart';
export 'package:core_app/src/features/user_global_bloc.dart';
export 'package:core_app/src/features/task_global_bloc.dart';

//Module
export 'package:core_app/src/modules/validator.dart';


export 'package:tuple/tuple.dart';

// TODO: Export any libraries intended for clients of this package.
