import 'package:flutter/material.dart';
import 'package:sa4_migration_kit/sa4_migration_kit.dart';
// // class FadeAnimation extends StatelessWidget {
// //   final Widget child;
// //   final double delay;
// //   FadeAnimation({required this.child, required this.delay});
// //   @override
// //   Widget build(BuildContext context) {
// //     final tween = MultiTrackTween([
// //       Track("opacity")
// //           .add(const Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
// //       Track("translateY")
// //           .add(const Duration(milliseconds: 500), curve: Curves.easeOut)
// //     ]);
// //     return ControlledAnimation(
// //       delay: Duration(milliseconds: (500 * delay).round()),
// //       duration: tween.duration,
// //       tween: tween,
// //       child: child,
// //       builderWithChild: (context, child, animation) => Opacity(
// //         opacity: animation["opacity"],
// //         child: Transform.translate(
// //           offset: Offset(0, animation["translateY"]),
// //           child: child,
// //         ),
// //       ),
// //     );
// //   }
// // }
// // // import 'package:flutter/material.dart';
// // // import 'package:simple_animations/simple_animations.dart';
// // // class FadeAnimation extends StatelessWidget {
// // //   final double delay;
// // //   final Widget child;
// // //   FadeAnimation({required this.delay, required this.child});
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final tween = TimelineTween<AniProps>()
// // //       ..addScene(begin: Duration.zero, duration: Duration(milliseconds: 500))
// // //           .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0));
// // //     return PlayAnimation<TimelineValue<AniProps>>(
// // //       delay: Duration(milliseconds: (500 * delay).round()),
// // //       duration: tween.duration,
// // //       tween: tween,
// // //       child: child,
// // //       builder: (context, child, value) => Opacity(
// // //         opacity: value.get(AniProps.opacity),
// // //         child: child,
// // //       ),
// // //     );
// // //   }
// // // }

// // // enum AniProps { opacity }
// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;

//   FadeAnimation(this.delay, this.child);

//   ///build animation track
//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTrackTween([
//       Track("opacity")
//           .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//       Track("translateY").add(
//           Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//           curve: Curves.easeOut)
//     ]);

//     /// fade animation controller
//     return ControlledAnimation(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation["opacity"],
//         child: Transform.translate(
//             offset: Offset(0, animation["translateY"]), child: child),
//       ),
//     );
//   }
// }


enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation( this.child, this.delay, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
        ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0))
        ..add(AniProps.translateY, Tween(begin: -30.0, end: 0.0), const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, animation.get(AniProps.translateY)),
            child: child
        ),
      ),
    );
  }
}