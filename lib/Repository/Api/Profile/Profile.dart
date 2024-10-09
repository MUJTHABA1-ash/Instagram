import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled8/Repository/Model_class/Highlite_Model.dart';
import 'package:untitled8/Repository/Model_class/Profile_Model.dart';


import '../../Model_class/Followers_Model.dart';
import '../../Model_class/Following_Model.dart';
import '../../Model_class/Post_Model.dart';
import '../../Model_class/Tagg_Model.dart';
import '../api_client.dart';

class ProfileApi {
  ApiClient apiClient = ApiClient();

  Future<ProfileModel> getProfile(String name) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/info?username_or_id_or_url=$name';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ProfileModel.fromJson(jsonDecode(response.body));
  }

  Future<HighliteModel> getHighlite(String name) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/highlights?username_or_id_or_url=$name';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return HighliteModel.fromJson(jsonDecode(response.body));
  }

  Future<PostModel> getPost(String name) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1.2/posts?username_or_id_or_url=$name';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return PostModel.fromJson(jsonDecode(response.body));
  }

  Future<TaggModel> getTagg(String name) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/tagged?username_or_id_or_url=$name';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return TaggModel.fromJson(jsonDecode(response.body));
  }
  Future<FollowersModel> getFollowers(String name) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/followers?username_or_id_or_url=$name';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return FollowersModel.fromJson(jsonDecode(response.body));
  }
  Future<FollowingModel> getFollowing(String name) async {
    String trendingpath =
        'https://instagram-scraper-api2.p.rapidapi.com/v1/following?username_or_id_or_url=$name';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return FollowingModel.fromJson(jsonDecode(response.body));
  }
}