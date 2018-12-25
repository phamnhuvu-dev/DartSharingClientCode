/// Support for doing something awesome.
///
/// More dartdocs go here.
library core_app;

// Models
export 'src/data/models/user.dart';


// Blocs


// Global blocs
export 'src/features/global_blocs/app_global_bloc.dart';


// Repositories service
export 'src/data/repositories/user/user_service.dart';
export 'src/data/repositories/user/user_api_service.dart';


// Static
export 'src/statics/routes.dart';


// Src
export 'package:core_app/src/features/bloc.dart';
export 'package:core_app/src/features/global_blocs/user_global_bloc.dart';

//Module
export 'package:core_app/src/modules/validator.dart';


export 'package:tuple/tuple.dart';

// TODO: Export any libraries intended for clients of this package.
