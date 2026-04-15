# dartvader_auth

Only for Dart 2.15 and later.

Since Dart 2.15:

1. The `accessToken` is only sent to https://pub.dev and https://pub.dartlang.org. See [dart-lang/pub #3007](https://github.com/dart-lang/pub/pull/3007) for details.
2. Since Dart 2.15, the third-party pub's token is stored at `/Users/username/Library/Application Support/dart/pub-tokens.json` (macOS)

So the self-hosted pub server should have its own auth flow. dartvader is using Google OAuth2 by default.

- `dartvader_auth login` will generate `dartvader-credentials.json` locally after developer login the `dartvader_auth`.
- Before calling `dart pub publish` or `flutter pub publish`, please call `dartvader_auth get | dart pub token add <self-hosted-pub-server>` first.
- `dartvader_auth get` will refresh the token. New accessToken will be write to `pub-tokens.json` by `dart pub token add <self-hosted-pub-server>`.
- So you can always use a valid accessToken in `dart pub publish` and `flutter pub publish`.

## Usage

### Required environment variables

Before running `dartvader_auth`, configure:

```bash
export GOOGLE_CLIENT_ID="your-google-client-id"
export GOOGLE_CLIENT_SECRET="your-google-client-secret"
```

### Overview

dartvader is using Google OAuth2 by default. There's two situations where the dartvader_auth can be used.

- Login locally, and publish pub packages locally.
  1. Call `dartvader_auth login` when you first use it, and it will save credentials locally.
  2. Before calling `dart pub publish` or `flutter pub publish`, call `dartvader_auth get | dart pub token add <self-hosted-pub-server>`

- Login locally, and publish pub packages from CI/CD.
  On CI/CD host device, you may not have opportunity to call `dartvader_auth login`, so you can use `dartvader_auth migrate` to migrate the credentials file.
  1. In local device, call `dartvader_auth login` when you first use it, and it will save credentials locally.
  2. Copy the credentials file which was generated in step 1 to CI/CD device.
  3. In CI/CD device, call `dartvader_auth migrate <credentials-file-path>`, so the CI/CD will have the same credentials file.
  4. In CI/CD device, before calling `dart pub publish` or `flutter pub publish`, call `dartvader_auth get | dart pub token add <self-hosted-pub-server>`

```
Usage: dartvader_auth <command> [arguments]

Available commands:
  get             Refresh and get accessToken. Must login first.
  login           Login dartvader_auth on Google APIs.
  logout          Delete local credentials file.
  migrate <path>  Migrate existed credentials file from path.
```

### Install and run

``` bash
dart pub global activate dartvader_auth # activate the cli app
```

### Uninstall

``` bash
dart pub global deactivate dartvader_auth # deactivate the cli app
```

### Get a token and export to Dart Client

``` bash
dartvader_auth get | dart pub token add <self-hosted-pub-server>
```

**Please call `dartvader_auth login` first before you run the `dartvader_auth get` if you never login in 'terminal'.**

## Develop and debug locally

``` bash
dart pub global activate --source path ./  # activate the cli app
dartvader_auth  # run it
```
