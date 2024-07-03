import 'package:cart_app/model/MenuModel.dart';
import 'package:cart_app/resources/app_url/app_urls.dart';

import '../data/network/network_api_services.dart';

class ItemsRepository{
  final _apiService = NetworkApiServices();
  Future<MenuModel> itemListApi() async{
    dynamic response = await _apiService.getApi(AppUrls.itemsUrl);
    return MenuModel.fromJson(response);
  }
}