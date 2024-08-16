import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'ENVIRONMENT')
  static const String environment = _Env.environment;

  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;

  @EnviedField(varName: 'API_RETRY_ATTEMPTS')
  static const int apiRetryAttempts = _Env.apiRetryAttempts;

  @EnviedField(varName: 'API_RETRY_DELAY')
  static const int apiRetryDelay = _Env.apiRetryDelay;
}
