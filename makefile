.PHONY: files integration lint icons splash

files:
	dart run build_runner build --delete-conflicting-outputs

integration:
	flutter test -r github integration_test/integration_suite.dart

lint:
	dart run custom_lint

icons:
	dart pub run flutter_launcher_icons:main

splash:
	dart pub run flutter_native_splash:create