import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/widgets/book_post_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget with BLooMBackroundMixin {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: bLooMGradient(),
        child: Scaffold(
            appBar: const AppBarComponent(
              isFlowerAppBar: true,
              flowerImage: AppImages.bookFlower,
              title: 'Books of the Month',
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BookPostWidget(
                  data: BookPostData(
                      image: 'assets/images/Rectangle 22683book.png',
                      publisherName: 'John Deo',
                      bookDetails:
                          'Explore the profound world of human connections in John A. Doe\'s thought-provoking novel, where words create a silent symphony.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      totalComments: '10',
                      totalLikes: '5',
                      date: 'Jan 15, 2024',
                      bookName: 'The Silent Symphony',
                      bookPrice: '120',
                      isLike: false,
                      isExpand: true)),
            )));
  }
}
