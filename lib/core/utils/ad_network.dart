import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sakuralifestoryschool/core/utils/constant.dart';

AdRequest request = AdRequest(
  nonPersonalizedAds: true,
);

class AdNetworkAdmob {
  BannerAd? _bannerAd;

  BannerAd? get bannerAd => _bannerAd;

  void loadAdBanner() async {
    BannerAd(
            size: AdSize.fullBanner,
            adUnitId: admobBanner,
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                _bannerAd = ad as BannerAd;
              },
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
                print(error.toString());
              },
              onAdOpened: (ad) {},
              onAdClosed: (ad) {},
              onAdImpression: (ad) {},
            ),
            request: request)
        .load();
  }
}
