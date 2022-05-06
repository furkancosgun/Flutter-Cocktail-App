import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cocktail.dart';
import 'constants.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.cocktailId,
  }) : super(key: key);

  final String cocktailId;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

late var futureCocktail;

class _DetailPageState extends State<DetailPage> {
  void initState() {
    futureCocktail = getCocktail();
    super.initState();
  }

  Cocktail parseCocktail(String response) {
    return Cocktail.fromJson(json.decode(response));
  }

  Future<Cocktail> getCocktail() async {
    String id = widget.cocktailId.toString();
    var url = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id");

    var cvp = await http.get(url);

    return parseCocktail(cvp.body);
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Text("Details "),
      ),
      backgroundColor: primary,
      body: FutureBuilder<Cocktail>(
        future: futureCocktail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var cocktailData = snapshot.data!;
            var data = cocktailData.drinks[0];
            return SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                        data.strDrinkThumb.toString(),
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [primary, accent, primary],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          color: primary,
                          borderRadius: BorderRadius.circular(25)),
                      width: screensize.width,
                      height: screensize.height / 2.5,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.strDrink.toString(),
                              style: title,
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1,
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strCategory.toString(),
                                  style: title,
                                ),
                                Text(
                                  data.strAlcoholic.toString(),
                                  style: title,
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1,
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data.strInstructions.toString(),
                                  style: smallcontent,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        data.strGlass.toString(),
                                        style: smallcontent,
                                      ),
                                      Icon(
                                        Icons.wine_bar_outlined,
                                        color: Colors.white.withOpacity(0.5),
                                      )
                                    ]),
                              ],
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.5),
                              thickness: 1,
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Ingredient",
                                  style: title,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strIngredient1.toString(),
                                  style: smallcontent,
                                ),
                                Text(
                                  data.strMeasure1.toString(),
                                  style: smallcontent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strIngredient2.toString(),
                                  style: smallcontent,
                                ),
                                Text(
                                  data.strMeasure2.toString(),
                                  style: smallcontent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strIngredient3.toString(),
                                  style: smallcontent,
                                ),
                                Text(
                                  data.strMeasure3.toString(),
                                  style: smallcontent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strIngredient4.toString(),
                                  style: smallcontent,
                                ),
                                Text(
                                  data.strMeasure4.toString(),
                                  style: smallcontent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strIngredient5.toString(),
                                  style: smallcontent,
                                ),
                                Text(
                                  data.strMeasure5.toString(),
                                  style: smallcontent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.strIngredient6.toString(),
                                  style: smallcontent,
                                ),
                                Text(
                                  data.strMeasure6.toString(),
                                  style: smallcontent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
