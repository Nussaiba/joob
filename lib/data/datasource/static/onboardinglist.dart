import 'package:get/get.dart';
import 'package:jobs/core/constants/imageassest.dart';
import 'package:jobs/data/model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "1".tr,
      body:
       "2".tr,
      //image: AppImageAsset.onBoardingImgOne,
      image: AppImageAsset.searchOnboarding),
  OnBoardingModel(
      title:"3".tr,
      body:
       "4".tr,
      //image : AppImageAsset.onBoardingImgTwo,
      image: AppImageAsset.onboardingmessage),
  OnBoardingModel(
      title: "Your Career Opportunities\n On the Map",
      body:
          "Discover job vacancies in your area\n Guide you to the nearest opportunities\n to your location . ",
      // image: AppImageAsset.onBoardingImgThree,
      image: AppImageAsset.map2),
];
