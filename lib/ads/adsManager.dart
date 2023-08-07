import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class AdManager {
  static Future<void> loadUnityIntAd() async {
    await UnityAds.load(
      placementId: 'Interstitial_Android',
      onComplete: (placementId) => print('Load Complete $placementId'),
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }

  static Future<void> showIntAd() async {
    UnityAds.showVideoAd(
        placementId: 'Interstitial_Android',
        onStart: (placementId) => print('Video Ad $placementId started'),
        onClick: (placementId) => print('Video Ad $placementId click'),
        onSkipped: (placementId) => print('Video Ad $placementId skipped'),
        onComplete: (placementId) async {
          await loadUnityIntAd();
        },
        onFailed: (placementId, error, message) async {
          await loadUnityIntAd();
        });
  }

  static Future<void> loadUnityRewardedAd() async {
    await UnityAds.load(
      placementId: 'Rewarded_Android',
      onComplete: (placementId) => print('Load Complete $placementId'),
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }

  static Future<void> showRewardedAd() async {
    UnityAds.showVideoAd(
        placementId: 'Rewarded_Android',
        onStart: (placementId) => print('Video Ad $placementId started'),
        onClick: (placementId) => print('Video Ad $placementId click'),
        onSkipped: (placementId) => print('Video Ad $placementId skipped'),
        onComplete: (placementId) async {
          await loadUnityRewardedAd();
        },
        onFailed: (placementId, error, message) async {
          await loadUnityRewardedAd();
        });
  }
}
