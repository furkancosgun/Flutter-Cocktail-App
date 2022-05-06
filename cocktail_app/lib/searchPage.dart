import 'dart:convert';
import 'package:cocktail_app/detailPage.dart';
import 'package:cocktail_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:cocktail_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'cocktail.dart';
import 'favoritePage.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

var _controller = TextEditingController();
var futureCocktail;
late String cocktailName;

class _searchPageState extends State<searchPage> {
  void initState() {
    cocktailName = "gin";
    futureCocktail = getCocktail();
    super.initState();
  }

  Cocktail parseCocktail(String response) {
    return Cocktail.fromJson(json.decode(response));
  }

  Future<Cocktail> getCocktail() async {
    var url = Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailName");

    var cvp = await http.get(url);

    return parseCocktail(cvp.body);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: screenSize.height / 7.6,
            child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    futureCocktail = getCocktail();
                    cocktailName = _controller.text;
                    _controller.text = "";
                  });
                  futureCocktail = getCocktail();
                },
                style: TextStyle(color: Colors.white, fontSize: 15),
                cursorColor: Colors.white,
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                  hintText: "Search cocktail",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )),
          ),
          SizedBox(
            width: screenSize.width,
            height: screenSize.height / 1.55,
            child: FutureBuilder<Cocktail>(
                future: futureCocktail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var ckList = snapshot.data!;
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                        ),
                        itemCount: ckList.drinks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => DetailPage(
                                            cocktailId: ckList
                                                .drinks[index].idDrink
                                                .toString())));
                              },
                              child: resultCard(cklist: ckList, index: index));
                        });
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text(
                      "Nothing found here",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      )),
    );
  }
}

class resultCard extends StatefulWidget {
  resultCard({Key? key, required this.cklist, required this.index})
      : super(key: key);
  final Cocktail cklist;
  final int index;
  @override
  State<resultCard> createState() => _resultCardState();
}

class _resultCardState extends State<resultCard> {
  Future<bool> onLikeButtonTapped(bool isLiked, Drinks ck) async {
    print(ck.strDrink);
    liked.add(ck);
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: accent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
              widget.cklist.drinks[widget.index].strDrinkThumb.toString(),
              width: 200),
        ),
        Positioned(
          right: 70,
          top: 70,
          child: SizedBox(
            width: 35,
            height: 35,
            child: LikeButton(
              onTap: ((isLiked) => onLikeButtonTapped(
                  isLiked, widget.cklist.drinks[widget.index])),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                widget.cklist.drinks[widget.index].strDrink.toString(),
                style: smallTitle,
              )),
        )
      ]),
    );
  }
}
