
class FollowersModel {
  Data? data;
  String? paginationToken;

  FollowersModel({this.data, this.paginationToken});

  FollowersModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["pagination_token"] is String) {
      paginationToken = json["pagination_token"];
    }
  }

  static List<FollowersModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => FollowersModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["pagination_token"] = paginationToken;
    return _data;
  }

  FollowersModel copyWith({
    Data? data,
    String? paginationToken,
  }) => FollowersModel(
    data: data ?? this.data,
    paginationToken: paginationToken ?? this.paginationToken,
  );
}

class Data {
  int? count;
  List<Items>? items;
  int? total;

  Data({this.count, this.items, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if(json["total"] is num) {
      total = (json["total"] as num).toInt();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    return _data;
  }

  Data copyWith({
    int? count,
    List<Items>? items,
    int? total,
  }) => Data(
    count: count ?? this.count,
    items: items ?? this.items,
    total: total ?? this.total,
  );
}

class Items {
  String? fullName;
  String? id;
  bool? isPrivate;
  bool? isVerified;
  int? latestStoryTs;
  String? profilePicUrl;
  String? username;

  Items({this.fullName, this.id, this.isPrivate, this.isVerified, this.latestStoryTs, this.profilePicUrl, this.username});

  Items.fromJson(Map<String, dynamic> json) {
    if(json["full_name"] is String) {
      fullName = json["full_name"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["is_private"] is bool) {
      isPrivate = json["is_private"];
    }
    if(json["is_verified"] is bool) {
      isVerified = json["is_verified"];
    }
    if(json["latest_story_ts"] is num) {
      latestStoryTs = (json["latest_story_ts"] as num).toInt();
    }
    if(json["profile_pic_url"] is String) {
      profilePicUrl = json["profile_pic_url"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
  }

  static List<Items> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Items.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["full_name"] = fullName;
    _data["id"] = id;
    _data["is_private"] = isPrivate;
    _data["is_verified"] = isVerified;
    _data["latest_story_ts"] = latestStoryTs;
    _data["profile_pic_url"] = profilePicUrl;
    _data["username"] = username;
    return _data;
  }

  Items copyWith({
    String? fullName,
    String? id,
    bool? isPrivate,
    bool? isVerified,
    int? latestStoryTs,
    String? profilePicUrl,
    String? username,
  }) => Items(
    fullName: fullName ?? this.fullName,
    id: id ?? this.id,
    isPrivate: isPrivate ?? this.isPrivate,
    isVerified: isVerified ?? this.isVerified,
    latestStoryTs: latestStoryTs ?? this.latestStoryTs,
    profilePicUrl: profilePicUrl ?? this.profilePicUrl,
    username: username ?? this.username,
  );
}