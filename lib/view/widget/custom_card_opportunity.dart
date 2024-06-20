import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/data/model/opportunity_model.dart';

class CardJob extends StatelessWidget {
  final OpportuntiyModel opportuntiyModel;
  final void Function()? onPressed;
  final void Function() onTapIcon;
  final IconData icon;
  const CardJob({
    super.key,
    required this.opportuntiyModel,
    this.onPressed,
    required this.onTapIcon, required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CircleAvatar(
                //   backgroundImage: AssetImage(AppImageAsset.onBoardingImgFour
                //       //job.companyLogoUrl
                //       ),
                //   radius: 30,
                //  ),
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
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.praimaryColor,
                              height: 1.3),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        opportuntiyModel.companyname!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        opportuntiyModel.location!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                    onTap: onTapIcon,
                    child: Icon(
                      icon,
                      color: Colors.grey,
                      size: 28,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.info_outline,
                      color: AppColor.praimaryColor),
                  label: const Text('Details',
                      style: TextStyle(color: AppColor.praimaryColor)),
                  onPressed: onPressed,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Apply'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
