import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/screens/categories/super_boost/prayer_of_the_day.dart';
import 'package:bloom_app/views/widgets/super_boost_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

class SuperBoostView extends StatelessWidget with BLooMBackroundMixin {
  const SuperBoostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bLooMGradient(),
      child: Scaffold(
        appBar: const AppBarComponent(
          isFlowerAppBar: true,
          flowerImage: AppImages.superBoostFlower,
          title: "Super Boost",
        ),
        body: GroupedListView(
          physics: const BouncingScrollPhysics(),
          elements: const [
            {
              'group': "Prayer of the Day",
              'data': [
                'prayer1',
                'May this day overflow with joy and positivity, brings smiles and warmth to every moment. Embrace growth, gratitude, and kindness. Wishing you a day filled with laughter, love and inspiration.',
                'Jan 16, 2024',
                AppImages.superBoostDummy
              ]
            },
            {
              'group': "Prayer of the Week",
              'data': [
                'prayer2',
                'May this day overflow with joy and positivity, brings smiles and warmth to every moment. Embrace growth, gratitude, and kindness. Wishing you a day filled with laughter, love and inspiration.',
                'Jan 16, 2024',
                AppImages.bloomingCat
              ]
            },
            {
              'group': "Prayer of the Week",
              'data': [
                'prayer3',
                'May this day overflow with joy and positivity, brings smiles and warmth to every moment. Embrace growth, gratitude, and kindness. Wishing you a day filled with laughter, love and inspiration.',
                'Jan 16, 2024',
                AppImages.dailyDevoCat
              ]
            }
          ],
          groupSeparatorBuilder: (value) {
            return Text(
              "$value",
              textAlign: TextAlign.center,
              style: Fonts.noto(
                context,
                AppColors.raisinBlack,
                16,
                FontWeight.w600,
              ),
            ).paddingOnly(top: 14);
          },
          groupBy: (element) {
            return element['group'];
          },
          itemBuilder: (context, Map data) {
            return SuperBoostCardWidget(
              onTap: () => Get.to(() => PrayerOfTheDayView(
                    title: data['data'][0],
                    image: data['data'][3],
                    description: data['data'][1],
                  )),
              title: data['data'][0],
              subTiltle: data['data'][1],
              group: data['group'],
              date: data['data'][2],
              image: data['data'][3],
            );
          },
          padding: EdgeInsets.only(bottom: 100.h),
        ),
      ),
    );
  }
}
