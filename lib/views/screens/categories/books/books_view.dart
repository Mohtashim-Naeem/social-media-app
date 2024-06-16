import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/gradient_mixin.dart';
import 'package:bloom_app/views/components/appbar_component.dart';
import 'package:bloom_app/views/screens/categories/books/post/book_details.dart';
import 'package:bloom_app/views/widgets/book_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksView extends StatelessWidget with BLooMBackroundMixin {
  const BooksView({super.key});

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
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return BookPostWidget(
                  onTap: () {
                    Get.to(() => const BookDetailsView());
                  },
                  data: BookPostData(
                      image: 'assets/images/Rectangle 22683book.png',
                      publisherName: 'John Deo',
                      bookDetails:
                          'Explore the profound world of human connections in John A. Doe\'s thought-provoking novel, where words create a silent symphony.',
                      totalComments: '10',
                      totalLikes: '5',
                      date: 'Jan 15, 2024',
                      bookName: 'The Silent Symphony',
                      bookPrice: '120',
                      isLike: false));
            },
          )),
    );
  }
}
