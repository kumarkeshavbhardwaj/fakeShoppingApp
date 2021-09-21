import 'package:fakeshoppingapp/models/product.dart';
import 'package:fakeshoppingapp/services/api_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var categoriesList = <String>[].obs;
  var category1List = <Product>[].obs;
  var category2List = <Product>[].obs;
  var category3List = <Product>[].obs;
  var category4List = <Product>[].obs;
  var thumbnailsList = <String>[].obs;
  var product = Product().obs;
  var filteredProducts = <Product>[].obs;
  var searchKeyword = ''.obs;
  var tabIndex = 0.obs;
  var isFav = false.obs;
  var favoriteProducts = <Product>[].obs;

  SharedPreferences? preferences;

  @override
  void onInit() {
    fetchProducts();
    decodeSharedPrefs();
    super.onInit();
  }

  decodeSharedPrefs() async {
    preferences = await SharedPreferences.getInstance();
    var decodedData = preferences!.getString('favorites');
    var decodedList = Product.decode(decodedData!);
    favoriteProducts.value = decodedList;
    print(favoriteProducts);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await APIServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        fetchCategories();
      }
    } finally {
      //------------
    }
  }

  void fetchCategories() async {
    //-----------
    try {
      var categories = await APIServices.fetchCategories();
      if (categories != null) {
        categoriesList.value = categories;
        extractProducts();
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCategory1Products() async {
    isLoading(true);
    try {
      var categories = await APIServices.fetchCategories();
      if (categories != null) {
        categoriesList.value = categories;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCategory2Products() async {
    isLoading(true);
    try {
      var categories = await APIServices.fetchCategories();
      if (categories != null) {
        categoriesList.value = categories;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCategory3Products() async {
    isLoading(true);
    try {
      var categories = await APIServices.fetchCategories();
      if (categories != null) {
        categoriesList.value = categories;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCategory4Products() async {
    isLoading(true);
    try {
      var categories = await APIServices.fetchCategories();
      if (categories != null) {
        categoriesList.value = categories;
      }
    } finally {
      isLoading(false);
    }
  }

  void linkToProductDetail(int id) async {
    isLoading(true);

    try {
      var newproduct = await APIServices.fetchProductDetail(id);
      if (newproduct != null) {
        product.value = newproduct;
      }
    } finally {
      isLoading(false);
    }
  }

  void searchList() {
    final newfilteredProducts = productList.where((product) {
      final titleLower = product.title!.toLowerCase();
      final searchLower = searchKeyword.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    filteredProducts.value = newfilteredProducts;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Future<bool> onBackPress() {
    searchKeyword.value = '';
    Get.back();
    return Future.value(true);
  }

  void checkFav(int id) {
    ;
    // print(product.category);
    if (favoriteProducts.where((product) => product.id == id).isNotEmpty) {
      print('fav');
      isFav.value = true;
    } else {
      print('notfav');
      isFav.value = false;
    }
  }

  void makeFavorite(int id) {
    // Product product = productList.where((product) => product.id == id).single;

    if (favoriteProducts.where((product) => product.id == id).isNotEmpty) {
      isFav.value = false;
      print('removing');
      removeFav(id);
    } else {
            isFav.value = true;

      print('adding');
      addFav(id);
    }
  }

  void addFav(int id) {
    
    Product product = productList.where((product) => product.id == id).single;
    favoriteProducts.add(product);
    encodeSharedPrefs();
  }

  void removeFav(int id) {


    Product product = productList.where((product) => product.id == id).single;
    favoriteProducts.removeWhere((fproduct) => fproduct.id == product.id);
    encodeSharedPrefs();
  }

  void encodeSharedPrefs() {
    var encodedData = Product.encode(favoriteProducts);
    preferences!.setString('favorites', encodedData);
  }

  void extractProducts() {
    // print(categoriesList.length);
    // print(productList.length);
    categoriesList.forEach((element) {
      var list =
          productList.where((product) => product.category == element).toList();

      if (category1List.length == 0) {
        // print(list.first.category);
        category1List.value = list;
        thumbnailsList.add(category1List.first.image!);
      } else if (category2List.length == 0) {
        // print(list.first.category);
        category2List.value = list;
        thumbnailsList.add(category2List.first.image!);
      } else if (category3List.length == 0) {
        // print(list.first.category);
        category3List.value = list;
        thumbnailsList.add(category3List.first.image!);
      } else {
        // print(list.first.category);
        category4List.value = list;
        thumbnailsList.add(category4List.first.image!);
      }
    });
  }
}
