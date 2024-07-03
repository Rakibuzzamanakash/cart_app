import 'package:get/get.dart';
import 'package:cart_app/model/MenuModel.dart';
import 'package:cart_app/repository/items_repository.dart';
import '../data/response/status.dart';

class MenuItems {
  int? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _description;
  int? _price;
  int? _discountPrice;
  late final int? quantity;

  MenuItems({
    int? id,
    String? name,
    String? slug,
    String? image,
    String? description,
    int? price,
    int? discountPrice,
    this.quantity = 1,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _description = description;
    _price = price;
    _discountPrice = discountPrice;
  }

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get image => _image;
  String? get description => _description;
  int? get price => _price;
  int? get discountPrice => _discountPrice;

  MenuItems.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _slug = json['slug'],
        _image = json['image'],
        _description = json['description'],
        _price = json['price'],
        _discountPrice = json['discount_price'],
        quantity = 1;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'description': description,
      'price': price,
      'discountPrice': discountPrice,
    };
  }
}

class ItemController extends GetxController {
  final _api = ItemsRepository();

  final rxRequestStatus = Status.loading.obs;
  final itemList = MenuModel().obs;
  var cartItems = <MenuItems>[].obs; // List to store cart items

  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setProductList(MenuModel value) => itemList.value = value;
  void setError(String value) => error.value = value;

  @override
  void onInit() {
    itemApi();
    super.onInit();
  }

  Future<void> itemApi() async {
    setRxRequestStatus(Status.loading);
    try {
      final items = await _api.itemListApi();
      setRxRequestStatus(Status.completed);
      setProductList(items);
    } catch (error) {
      setError(error.toString());
      setRxRequestStatus(Status.error);
      //print('Error fetching item list: $error');
    }
  }

  void addToCart(MenuItems item) {
    cartItems.add(item);
  }

  void removeFromCart(MenuItems item) {
    cartItems.remove(item);
  }

  void incrementItem(MenuItems item) {
    final index = cartItems.indexOf(item);
    cartItems[index] = MenuItems(
      id: item.id,
      name: item.name,
      description: item.description,
      image: item.image,
      discountPrice: item.discountPrice,
      price: item.price,
      quantity: item.quantity! + 1,
    );
  }

  void decrementItem(MenuItems item) {
    final index = cartItems.indexOf(item);
    if (item.quantity! > 1) {
      cartItems[index] = MenuItems(
        id: item.id,
        name: item.name,
        description: item.description,
        image: item.image,
        discountPrice: item.discountPrice,
        price: item.price,
        quantity: item.quantity! - 1,
      );
    } else {
      removeFromCart(item);
    }
  }

  bool isItemInCart(MenuItems item) {
    return cartItems.any((cartItem) => cartItem.id == item.id);
  }

  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + (item.price! * item.quantity!.toDouble()));

  double get totalVAT {
    double total = cartItems.fold(
        0, (sum, item) => sum + (item.price! * item.quantity!.toDouble()));
    return (total * 0.05);
  }

  double get totalPriceWithVAT {
    double total = cartItems.fold(
        0, (sum, item) => sum + (item.price! * item.quantity!.toDouble()));
    return total + (total * 0.05);
  }
}
