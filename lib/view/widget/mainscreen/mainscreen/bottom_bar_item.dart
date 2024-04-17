import 'package:flutter/material.dart';
import 'package:jobs/core/constants/color.dart';

class CustamTapBottomItem extends StatelessWidget {
  final int index;
  final  IconData icon;
  final bool isSelected;
  const CustamTapBottomItem({super.key, required this.index, required this.icon, required this.isSelected , });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: kToolbarHeight,
      width: isSelected ? 120 : 80,
      color: AppColor.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 150),
            left: isSelected ? -30 : 0,
            top: isSelected ? -25 : 0,
            child: AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: const Duration(milliseconds: 150),
              child: ClipPath(
                clipper: HalfCircleClipper(),
                child: Container(
                  width: 180,
                  height: 180,
                  color: isSelected ? AppColor.praimaryColor : AppColor.white,
                ),
              ),
            ),
          ),



Column(mainAxisSize: MainAxisSize.min
,children: [
 Icon(icon,
              shadows: [
                Shadow(
                  blurRadius: isSelected ? 5 : 0,
                  color: isSelected ? AppColor.white : AppColor.praimaryColor,
                )
              ],
              size: isSelected ? 28 : 23,
              color: isSelected ? AppColor.white : AppColor.praimaryColor),


],),
         
              
        ],
      ),
    );
  }
  }

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromLTWH(30, -100, size.width /1.5, size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}