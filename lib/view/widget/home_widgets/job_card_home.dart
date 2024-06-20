import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/model/opportunity_model.dart';
import '../../../core/constants/imageassest.dart';

class JobCardHome extends StatelessWidget {
  final OpportuntiyModel opportuntiyModel;
  final void Function()? onPressed;
  final void Function() onTapIcon;

final IconData icon ;
  const JobCardHome({
    required this.opportuntiyModel,
    this.onPressed,
    super.key, required this.icon,required this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 195,
      child: InkWell(
        onTap:onPressed,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(AppImageAsset.onBoardingImgFour
                          ),
                      radius: 25,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: opportuntiyModel.id!,
                            child: Text(
                              opportuntiyModel.title!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.praimaryColor,
                                  height: 1.3),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            //opportuntiyModel.companyname!,
                            "  ",
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black54, height: 1),
                          ),
                        ],
                      ),
                    ),
                     Padding(
                      padding:const  EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap:onTapIcon,
                        child: Icon(
                          //Icons.bookmark_border,
                          icon ,
                          color: Colors.grey,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                ItemCardHomeWithIcon(
                  itemName: opportuntiyModel.salary!,
                  icon: Icons.attach_money_outlined,
                ),
                ItemCardHomeWithIcon(
                  itemName: opportuntiyModel.location!,
                  icon: Icons.location_on_outlined,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ItemDetailCardHome(
                        jobDetails: opportuntiyModel.jopType!,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ItemDetailCardHome(
                        jobDetails: opportuntiyModel.workPlaceType!,
                      ),
                      const Spacer(),
                      Text('',
                      //opportuntiyModel.createdat!.substring(0,10),
                        style: const TextStyle(fontSize: 14, color: AppColor.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCardHomeWithIcon extends StatelessWidget {
  final String itemName;
  final IconData? icon;
  const ItemCardHomeWithIcon({
    super.key,
    required this.itemName,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            itemName,
            style: const TextStyle(
              fontSize: 14,
              color: AppColor.grey,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class ItemDetailCardHome extends StatelessWidget {
  final String jobDetails;
  const ItemDetailCardHome({
    super.key,
    required this.jobDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      child: Text(
        jobDetails,
        style: const TextStyle(fontSize: 14, color: AppColor.black),
      ),
    );
  }
}

class TitleOpportunitiesHome extends StatelessWidget {
  final String title;
  final void Function()? onTapViewAll;
  const TitleOpportunitiesHome({
    super.key,
    required this.title,
    this.onTapViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.praimaryColor,
              // fontFamily: "Pacifico",
            ),
          ),
          InkWell(
            onTap: onTapViewAll,
            child: Text(
              "view all",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.grey.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
