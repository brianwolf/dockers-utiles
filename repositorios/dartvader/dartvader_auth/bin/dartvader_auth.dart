import 'dart:io';

import 'package:args/args.dart';
import 'package:console/console.dart';
import 'package:dartvader_auth/dartvader_auth.dart' as dartvader_auth;
import 'package:dartvader_auth/utils.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  parser.addCommand('login');
  parser.addCommand('logout');
  parser.addCommand('migrate');
  parser.addCommand('get');

  final result = parser.parse(arguments);

  dartvader_auth.Flow flow = dartvader_auth.Flow.getToken;

  Object? subArgs;

  switch (result.command?.name) {
    case 'login':
      flow = dartvader_auth.Flow.login;
      break;
    case 'logout':
      flow = dartvader_auth.Flow.logout;
      break;
    case 'migrate':
      flow = dartvader_auth.Flow.migrate;
      if (result.command?.arguments.length != 1) {
        Utils.stdoutPrint("dartvader_auth migrate need a path argument");
        exit(1);
      }
      subArgs = result.command?.arguments.first;
      break;
    case 'get':
      flow = dartvader_auth.Flow.getToken;
      break;
    default:
      stdout.write(format('''
An auth tool for dartvader. dartvader is using Google OAuth2 by default. There's two situations where the dartvader_auth can be used.

{@yellow}1. Login locally, and publish pub packages locally.{@end}
  {@blue}step 1.{@end} Call `dartvader_auth login` when you first use it, and it will save credentials locally.
  {@blue}step 2.{@end} Before calling `dart pub publish` or `flutter pub publish`, call `dartvader_auth get | dart pub token add <self-hosted-pub-server>`
  
{@yellow}2. Login locally, and publish pub packages from CI/CD.{@end}
{@yellow}   On CI/CD host device, you may not have opportunity to call `dartvader_auth login`, so you can use `dartvader_auth migrate` to migrate the credentials file.{@end}
  {@blue}step 1.{@end} In local device, call `dartvader_auth login` when you first use it, and it will save credentials locally.
  {@blue}step 2.{@end} Copy the credentials file which was generated in step 1 to CI/CD device.
  {@blue}step 3.{@end} In CI/CD device, call `dartvader_auth migrate <credentials-file-path>`, so the CI/CD will have the same credentials file.
  {@blue}step 4.{@end} In CI/CD device, before calling `dart pub publish` or `flutter pub publish`, call `dartvader_auth get | dart pub token add <self-hosted-pub-server>`

Usage: {@green}dartvader_auth <command> [arguments]{@end}

Available commands:
  {@green}get{@end}             Refresh and get a new accessToken. Must login first.
  {@green}login{@end}           Login dartvader_auth on Google APIs.
  {@green}logout{@end}          Delete local credentials file.
  {@green}migrate{@end} {@green}<path>{@end}  Migrate existed credentials file from path.
'''));
      exit(0);
  }

  await dartvader_auth.run(flow: flow, args: subArgs);
  exit(0);
}
