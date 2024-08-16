.PHONY: files integration lint

files:
	dart run build_runner build --delete-conflicting-outputs

integration:
	flutter test -r github integration_test/integration_suite.dart

lint:
	dart run custom_lint