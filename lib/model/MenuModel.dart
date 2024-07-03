// import 'dart:convert';
// /// menu : [{"id":1,"name":"Special Food Menu one","slug":"special-food-menu-one","image":"https://media.istockphoto.com/id/1295633127/photo/grilled-chicken-meat-and-fresh-vegetable-salad-of-tomato-avocado-lettuce-and-spinach-healthy.jpg?s=1024x1024&w=is&k=20&c=2HQ3drj21kzwpvGYh-YjAmPVShsv7vbnOPNEJ-lg_pQ=","description":"Lorem ipsum dolor sit amet consectetur.","price":550,"discount_price":500},{"id":2,"name":"Special Food Menu two","slug":"special-food-menu-two","image":"http://res.cloudinary.com/dlg2emvsz/image/upload/v1717993515/event.jpg","description":"Lorem ipsum dolor sit amet consectetur.","price":300,"discount_price":0},{"id":3,"name":"Special Food Menu Three","slug":"special-food-menu-three","image":"https://media.istockphoto.com/id/1463643346/photo/salad-with-chicken-meat-fresh-vegetable-salad-with-chicken-breast-meat-salad-with-chicken.jpg?s=1024x1024&w=is&k=20&c=COIUeIOuygJkw0M7a6CNZgjUYvN2jSXhOadBVYNeNNY=","description":"Lorem ipsum dolor sit amet consectetur.","price":400,"discount_price":350},{"id":4,"name":"Special Food Menu Four","slug":"special-food-menu-four","image":"https://media.istockphoto.com/id/1295633127/photo/grilled-chicken-meat-and-fresh-vegetable-salad-of-tomato-avocado-lettuce-and-spinach-healthy.jpg?s=1024x1024&w=is&k=20&c=2HQ3drj21kzwpvGYh-YjAmPVShsv7vbnOPNEJ-lg_pQ=","description":"Lorem ipsum dolor sit amet consectetur.","price":700,"discount_price":600},{"id":5,"name":"Special Food Menu Five","slug":"special-food-menu-five","image":"https://media.istockphoto.com/id/1155240408/photo/table-filled-with-large-variety-of-food.jpg?s=1024x1024&w=is&k=20&c=y-Lbco14g-CbkNKEaNId872h0XaYxtiRWwrh35aAAOk=","description":"Lorem ipsum dolor sit amet consectetur.","price":300,"discount_price":0},{"id":6,"name":"Special Food Menu Six","slug":"special-food-menu-six","image":"https://media.istockphoto.com/id/1789088869/photo/ingredients-of-healthy-diet-that-maintains-overall-health.jpg?s=1024x1024&w=is&k=20&c=zkfdOphmAZm6LaCiaEsxGg68x44AGbr5Ulk96InFH74=","description":"Lorem ipsum dolor sit amet consectetur.","price":300,"discount_price":280}]
// /// vat : 10
// /// note : "Prices include VAT and service charges. vat will be calculated by percentage"
//
// MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));
// String menuModelToJson(MenuModel data) => json.encode(data.toJson());
// class MenuModel {
//   MenuModel({
//       List<Menu>? menu,
//       num? vat,
//       String? note,}){
//     _menu = menu;
//     _vat = vat;
//     _note = note;
// }
//
//   MenuModel.fromJson(dynamic json) {
//     if (json['menu'] != null) {
//       _menu = [];
//       json['menu'].forEach((v) {
//         _menu?.add(Menu.fromJson(v));
//       });
//     }
//     _vat = json['vat'];
//     _note = json['note'];
//   }
//   List<Menu>? _menu;
//   num? _vat;
//   String? _note;
// MenuModel copyWith({  List<Menu>? menu,
//   num? vat,
//   String? note,
// }) => MenuModel(  menu: menu ?? _menu,
//   vat: vat ?? _vat,
//   note: note ?? _note,
// );
//   List<Menu>? get menu => _menu;
//   num? get vat => _vat;
//   String? get note => _note;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_menu != null) {
//       map['menu'] = _menu?.map((v) => v.toJson()).toList();
//     }
//     map['vat'] = _vat;
//     map['note'] = _note;
//     return map;
//   }
//
// }
//
// /// id : 1
// /// name : "Special Food Menu one"
// /// slug : "special-food-menu-one"
// /// image : "https://media.istockphoto.com/id/1295633127/photo/grilled-chicken-meat-and-fresh-vegetable-salad-of-tomato-avocado-lettuce-and-spinach-healthy.jpg?s=1024x1024&w=is&k=20&c=2HQ3drj21kzwpvGYh-YjAmPVShsv7vbnOPNEJ-lg_pQ="
// /// description : "Lorem ipsum dolor sit amet consectetur."
// /// price : 550
// /// discount_price : 500
//
// Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));
// String menuToJson(Menu data) => json.encode(data.toJson());
// class Menu {
//   Menu({
//       num? id,
//       String? name,
//       String? slug,
//       String? image,
//       String? description,
//       num? price,
//       num? discountPrice,}){
//     _id = id;
//     _name = name;
//     _slug = slug;
//     _image = image;
//     _description = description;
//     _price = price;
//     _discountPrice = discountPrice;
// }
//
//   Menu.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _slug = json['slug'];
//     _image = json['image'];
//     _description = json['description'];
//     _price = json['price'];
//     _discountPrice = json['discount_price'];
//   }
//   num? _id;
//   String? _name;
//   String? _slug;
//   String? _image;
//   String? _description;
//   num? _price;
//   num? _discountPrice;
// Menu copyWith({  num? id,
//   String? name,
//   String? slug,
//   String? image,
//   String? description,
//   num? price,
//   num? discountPrice,
// }) => Menu(  id: id ?? _id,
//   name: name ?? _name,
//   slug: slug ?? _slug,
//   image: image ?? _image,
//   description: description ?? _description,
//   price: price ?? _price,
//   discountPrice: discountPrice ?? _discountPrice,
// );
//   num? get id => _id;
//   String? get name => _name;
//   String? get slug => _slug;
//   String? get image => _image;
//   String? get description => _description;
//   num? get price => _price;
//   num? get discountPrice => _discountPrice;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['slug'] = _slug;
//     map['image'] = _image;
//     map['description'] = _description;
//     map['price'] = _price;
//     map['discount_price'] = _discountPrice;
//     return map;
//   }
//
// }

class MenuModel {
  List<Menu>? _menu;
  int? _vat;
  String? _note;

  MenuModel({List<Menu>? menu, int? vat, String? note}) {
    if (menu != null) {
      this._menu = menu;
    }
    if (vat != null) {
      this._vat = vat;
    }
    if (note != null) {
      this._note = note;
    }
  }

  List<Menu>? get menu => _menu;
  set menu(List<Menu>? menu) => _menu = menu;
  int? get vat => _vat;
  set vat(int? vat) => _vat = vat;
  String? get note => _note;
  set note(String? note) => _note = note;

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      _menu = <Menu>[];
      json['menu'].forEach((v) {
        _menu!.add(new Menu.fromJson(v));
      });
    }
    _vat = json['vat'];
    _note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._menu != null) {
      data['menu'] = this._menu!.map((v) => v.toJson()).toList();
    }
    data['vat'] = this._vat;
    data['note'] = this._note;
    return data;
  }
}

class Menu {
  int? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _description;
  int? _price;
  int? _discountPrice;

  Menu(
      {int? id,
        String? name,
        String? slug,
        String? image,
        String? description,
        int? price,
        int? discountPrice}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (image != null) {
      this._image = image;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (discountPrice != null) {
      this._discountPrice = discountPrice;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get price => _price;
  set price(int? price) => _price = price;
  int? get discountPrice => _discountPrice;
  set discountPrice(int? discountPrice) => _discountPrice = discountPrice;

  Menu.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _description = json['description'];
    _price = json['price'];
    _discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['image'] = this._image;
    data['description'] = this._description;
    data['price'] = this._price;
    data['discount_price'] = this._discountPrice;
    return data;
  }
}

