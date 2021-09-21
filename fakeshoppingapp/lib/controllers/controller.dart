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
    //decoding data from JSON on re-init
    preferences = await SharedPreferences.getInstance();
    var decodedData = preferences!.getString('favorites');
    var decodedList = Product.decode(decodedData!);
    favoriteProducts.value = decodedList;

  }

  

  void fetchProducts() async {
    isLoading(true);
    
      var products = await APIServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        fetchCategories();
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

    if (favoriteProducts.where((product) => product.id == id).isNotEmpty) {
      print('fav');
      isFav.value = true;
    } else {
      print('notfav');
      isFav.value = false;
    }
  }

  void makeFavorite(int id) {
    if (favoriteProducts.where((product) => product.id == id).isNotEmpty) {
      isFav.value = false; //-- Optimistic UI 
      removeFav(id);
    } else {
      isFav.value = true; //-- Optimistic UI 
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
    //encode favorites list to product list and load on re-init
    //---To save multiple API Calls, all products will be encoded directly. 
    var encodedData = Product.encode(favoriteProducts);
    preferences!.setString('favorites', encodedData);
  }

  void extractProducts() {
    //---To save multiple API Calls, this method will extract "category", split it & store that data
    //---alternative way is to call by using "category" argument and then storing it.

    categoriesList.forEach((element) {
      var list =
          productList.where((product) => product.category == element).toList();

      if (category1List.length == 0) {

        category1List.value = list;
        thumbnailsList.add(category1List.first.image!);
      } else if (category2List.length == 0) {

        category2List.value = list;
        thumbnailsList.add(category2List.first.image!);
      } else if (category3List.length == 0) {

        category3List.value = list;
        thumbnailsList.add(category3List.first.image!);
      } else {

        category4List.value = list;
        thumbnailsList.add(category4List.first.image!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  
}
