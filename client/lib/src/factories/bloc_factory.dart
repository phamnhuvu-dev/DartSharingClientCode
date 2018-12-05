import 'package:client/src/base_bloc.dart';
import 'package:client/src/blocs/local_blocs/login_bloc.dart';
import 'package:client/src/blocs/local_blocs/register_bloc.dart';
import 'package:client/src/blocs/global_blocs/app_global_bloc.dart';

class BlocFactory {
  B create<B extends BaseBloc>() {
    switch (B) {
      case AppGlobalBloc:
        return AppGlobalBloc() as B;

      case LoginBloc:
        return LoginBloc() as B;

      case RegisterBloc:
        return RegisterBloc() as B;
    }
  }
}
