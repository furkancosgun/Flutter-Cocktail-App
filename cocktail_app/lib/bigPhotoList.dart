// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'cocktail.dart';
import 'constants.dart';
import 'detailPage.dart';
import 'favoritePage.dart';
import 'main.dart';

class bigPhotoCard extends StatefulWidget {
  const bigPhotoCard({
    Key? key,
    required this.cocktail,
  }) : super(key: key);
  final Drinks cocktail;

  @override
  State<bigPhotoCard> createState() => _bigPhotoCardState();
}

class _bigPhotoCardState extends State<bigPhotoCard> {
  Future<bool> onLikeButtonTapped(bool isLiked, Drinks ck) async {
    liked.add(ck);

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => DetailPage(
                      cocktailId: widget.cocktail.idDrink.toString(),
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: screenSize.width,
        height: screenSize.height / 2,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  widget.cocktail.strDrinkThumb.toString(),
                  fit: BoxFit.fitHeight,
                )),
            Positioned(
              bottom: 35,
              right: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: LikeButton(
                  onTap: ((isLiked) =>
                      onLikeButtonTapped(isLiked, widget.cocktail)),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.cocktail.strDrink.toString(),
                      style: title,
                    ),
                    Text(
                      widget.cocktail.strCategory.toString(),
                      style: smallTitle2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
