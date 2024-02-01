import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({ required this.title, required this.onPressed, required this.animation, super.key});

 final String title;
 final Function() onPressed;
 final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(Tween(begin: const Offset(0, 1), end: const Offset(0, 0.0))
            .chain(CurveTween(curve: Curves.easeIn))),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Card(
                elevation: 1,
                margin: EdgeInsets.only(top: 1.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold
                    ),),
                    const Icon(Icons.arrow_forward_ios)
                  ]),
                ),
              ),
      ),
    );
  }
}