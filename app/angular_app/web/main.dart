import 'package:angular/angular.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:angular_app/messages/messages_all.dart';
import 'package:angular_router/angular_router.dart';
import 'package:intl/intl_browser.dart';

import 'main.template.dart' as self;



@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() async {
  final locale = await findSystemLocale();
  await initializeMessages(locale);
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
