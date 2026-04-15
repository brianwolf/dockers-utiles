// ignore_for_file: uri_has_not_been_generated

import 'package:ngdart/angular.dart';
import 'package:ngrouter/angular_router.dart';
import 'package:dartvaderweb/app_component.template.dart' as ng;
import 'main.template.dart' as self;

@GenerateInjector(routerProviders)
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
