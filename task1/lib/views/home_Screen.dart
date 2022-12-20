import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task1/views/cv_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task1/views/login_screen.dart';

// import 'profile_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  late BannerAd _bannerAd;

  bool _isAdLoaded = false;

  @override
  initState() {
    super.initState();
    _initBannerAd();
  }

  _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-8249373889615589/5769940695',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {},
        ),
        request: AdRequest());

    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(my_profile());
                },
                child: Icon(
                  Icons.person_add_alt,
                  size: 50,
                )),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await auth.signOut();
            if (auth.currentUser == null) {
              Get.to(LoginScreen());
            }
          },
          child: Icon(Icons.logout),
        ),
        bottomNavigationBar: _isAdLoaded
            ? Container(
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd))
            : SizedBox());
  }
}
