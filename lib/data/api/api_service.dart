import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oresto/data/model/restaurant_list.dart';
import 'package:oresto/data/model/restaurant_detail.dart';

class ApiServices {
  static final String _apiUrl = 'https://restaurant-api.dicoding.dev/';
  // static final String _apiKey = '12345';
  static final String _restoList = 'list/';
  static final String _restoDetail = 'detail/';

  Future<RestaurantList> getRestaurantList() async {
    final response = await http.get(_apiUrl + _restoList);

    if(response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load restaurant list");
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String restoId) async {
    final response = await http.get(_apiUrl + _restoDetail + restoId);

    if(response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load restaurant detail");
    }
  }
}