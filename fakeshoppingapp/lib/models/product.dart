import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Product singleProductFromJson(String str) => Product.fromJson(json.decode(str));


class Product {
    Product({
        this.id,
        this.title,
        this.price,
        this.category,
        this.description,
        this.image,
    });

    int? id;
    String? title;
    double? price;
    String? category;
    String? description;
    String? image;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        category: json["category"],
        description: json["description"],
        image: json["image"],
    );

    static Map<String, dynamic> toJson(Product product) => {
        "id": product.id,
        "title": product.title,
        "price": product.price,
        "category": product.category,
        "description": product.description,
        "image": product.image,
    };

    //for Shared Preferences -- Favorites List will be stored in SharedPreferences when the app re-initiates.

  static List<Product> decode(String products) =>
      (json.decode(products) as List<dynamic>)
          .map<Product>((product) => Product.fromJson(product))
          .toList();

  static String encode(List<Product> products) => json.encode(
        products
            .map<Map<String, dynamic>>((product) => Product.toJson(product))
            .toList(),
      ); 

    


}
