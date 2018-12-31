/// Support for doing something awesome.
///
/// More dartdocs go here.
library core_app;

// Models
export 'src/data/models/user.dart';
export 'src/data/models/task.dart';

export 'src/features/bloc_provider.dart';
// Blocs


// Global blocs


// Repositories service
export 'src/data/repositories/user/user_repository_service.dart';
export 'src/data/repositories/user/user_api_service.dart';

// Factories
export 'src/factories/bloc_factory.dart';
export 'src/factories/repository_factory.dart';
export 'src/factories/screen_factory.dart';

// Static
export 'src/statics/routes.dart';


// Src
export 'package:core_app/src/features/bloc.dart';
export 'package:core_app/src/features/global_blocs/flutter_global_bloc.dart';
export 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
export 'package:core_app/src/features/global_blocs/task_global_bloc.dart';

//Module
export 'package:core_app/src/modules/validator.dart';


export 'package:tuple/tuple.dart';

// TODO: Export any libraries intended for clients of this package.
