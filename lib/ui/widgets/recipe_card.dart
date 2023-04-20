import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/models/recipe.dart';

const String unavailableImaggeUrl = 'https://www.foodnavigator.com/var/wrbm_gb_food_pharma/storage/images/7/8/6/4/224687-6-eng-GB/EPC-Natural-Products-Co.-Ltd.-SIC-Food-20132.jpg';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final Function() onClick;
  final bool isFavourited;
  final Function() onFavorit;

  const RecipeCard(
      {Key? key,
      required this.recipe,
      required this.onClick,
      required this.isFavourited,
      required this.onFavorit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        height: 150.h,
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1],
                  ),
                  borderRadius: BorderRadius.circular(15.w),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                        image: NetworkImage(recipe.image.isEmpty ? unavailableImaggeUrl : recipe.image), fit: BoxFit.cover)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 270.w,
                    padding: EdgeInsets.all(8.h),
                    child: Text(
                      recipe.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.w),
                    child: IconButton(
                      icon: Icon(Icons.favorite_rounded),
                      color: isFavourited
                          ? Colors.amberAccent.shade100
                          : Colors.black26,
                      onPressed: onFavorit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
