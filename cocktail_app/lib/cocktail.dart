class Cocktail {
  Cocktail({
    required this.drinks,
  });

  List<Drinks> drinks;

  factory Cocktail.fromJson(Map<String, dynamic> json) => Cocktail(
      drinks: List<Drinks>.from(json["drinks"].map((x) => Drinks.fromJson(x)))
          .toList());

  factory Cocktail.fromJsonAlcholic(Map<String, dynamic> json) => Cocktail(
      drinks: List<Drinks>.from(json["drinks"].map((x) => Alcholic.fromJson(x)))
          .toList());

  factory Cocktail.fromJsonNonAlcholic(Map<String, dynamic> json) => Cocktail(
      drinks:
          List<Drinks>.from(json["drinks"].map((x) => NonAlcholic.fromJson(x)))
              .toList());
}

class Drinks {
  Drinks({
    required this.idDrink,
    required this.strDrink,
    required this.strCategory,
    required this.strIba,
    required this.strAlcoholic,
    required this.strGlass,
    required this.strInstructions,
    required this.strDrinkThumb,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
  });

  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strIba;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;

  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;

  factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strCategory: json["strCategory"],
        strIba: json["strIBA"],
        strAlcoholic: json["strAlcoholic"],
        strGlass: json["strGlass"],
        strInstructions: json["strInstructions"],
        strDrinkThumb: json["strDrinkThumb"],
        strIngredient1: json["strIngredient1"],
        strIngredient2: json["strIngredient2"],
        strIngredient3: json["strIngredient3"],
        strIngredient4: json["strIngredient4"],
        strIngredient5: json["strIngredient5"],
        strIngredient6: json["strIngredient6"],
        strMeasure1: json["strMeasure1"],
        strMeasure2: json["strMeasure2"],
        strMeasure3: json["strMeasure3"],
        strMeasure4: json["strMeasure4"],
        strMeasure5: json["strMeasure5"],
        strMeasure6: json["strMeasure6"],
      );
}

class Alcholic {
  String? idDrink;
  String? strDrink;
  String? strDrinkThumb;
  Alcholic({
    this.idDrink,
    this.strDrink,
    this.strDrinkThumb,
  });

  factory Alcholic.fromJson(Map<String, dynamic> json) => Alcholic(
      idDrink: json["idDrink"],
      strDrink: json["strDrink"],
      strDrinkThumb: json["strDrinkThumb"]);
}

class NonAlcholic {
  String? idDrink;
  String? strDrink;
  String? strDrinkThumb;
  NonAlcholic({
    this.idDrink,
    this.strDrink,
    this.strDrinkThumb,
  });

  factory NonAlcholic.fromJson(Map<String, dynamic> json) => NonAlcholic(
      idDrink: json["idDrink"],
      strDrink: json["strDrink"],
      strDrinkThumb: json["strDrinkThumb"]);
}
