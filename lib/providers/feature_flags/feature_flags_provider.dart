import 'package:riverpod/riverpod.dart';

class FeatureFlags {
  final bool enableNewFeature;

  FeatureFlags({required this.enableNewFeature});
}

final featureFlagsProvider = Provider<FeatureFlags>((ref) {
  return FeatureFlags(enableNewFeature: true);
});
