
class TaggModel {
  Data? data;
  String? paginationToken;

  TaggModel({this.data, this.paginationToken});

  TaggModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["pagination_token"] is String) {
      paginationToken = json["pagination_token"];
    }
  }

  static List<TaggModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TaggModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["pagination_token"] = paginationToken;
    return _data;
  }

  TaggModel copyWith({
    Data? data,
    String? paginationToken,
  }) => TaggModel(
    data: data ?? this.data,
    paginationToken: paginationToken ?? this.paginationToken,
  );
}

class Data {
  int? count;
  List<Items>? items;

  Data({this.count, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
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
    return _data;
  }

  Data copyWith({
    int? count,
    List<Items>? items,
  }) => Data(
    count: count ?? this.count,
    items: items ?? this.items,
  );
}

class Items {
  Captions? captions;
  String? code;
  Comments? comments;
  bool? commentsDisabled;
  Dimensions? dimensions;
  String? displayUrl;
  bool? hasUpcomingEvent;
  String? id;
  bool? isVideo;
  LikedBy? likedBy;
  Owner? owner;
  PreviewLikes? previewLikes;
  String? productType;
  int? takenAtTimestamp;
  String? thumbnailUrl;
  String? type;
  int? viewCount;

  Items({this.captions, this.code, this.comments, this.commentsDisabled, this.dimensions, this.displayUrl, this.hasUpcomingEvent, this.id, this.isVideo, this.likedBy, this.owner, this.previewLikes, this.productType, this.takenAtTimestamp, this.thumbnailUrl, this.type, this.viewCount});

  Items.fromJson(Map<String, dynamic> json) {
    if(json["captions"] is Map) {
      captions = json["captions"] == null ? null : Captions.fromJson(json["captions"]);
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["comments"] is Map) {
      comments = json["comments"] == null ? null : Comments.fromJson(json["comments"]);
    }
    if(json["comments_disabled"] is bool) {
      commentsDisabled = json["comments_disabled"];
    }
    if(json["dimensions"] is Map) {
      dimensions = json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]);
    }
    if(json["display_url"] is String) {
      displayUrl = json["display_url"];
    }
    if(json["has_upcoming_event"] is bool) {
      hasUpcomingEvent = json["has_upcoming_event"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["is_video"] is bool) {
      isVideo = json["is_video"];
    }
    if(json["liked_by"] is Map) {
      likedBy = json["liked_by"] == null ? null : LikedBy.fromJson(json["liked_by"]);
    }
    if(json["owner"] is Map) {
      owner = json["owner"] == null ? null : Owner.fromJson(json["owner"]);
    }
    if(json["preview_likes"] is Map) {
      previewLikes = json["preview_likes"] == null ? null : PreviewLikes.fromJson(json["preview_likes"]);
    }
    if(json["product_type"] is String) {
      productType = json["product_type"];
    }
    if(json["taken_at_timestamp"] is num) {
      takenAtTimestamp = (json["taken_at_timestamp"] as num).toInt();
    }
    if(json["thumbnail_url"] is String) {
      thumbnailUrl = json["thumbnail_url"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["view_count"] is num) {
      viewCount = (json["view_count"] as num).toInt();
    }
  }

  static List<Items> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Items.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(captions != null) {
      _data["captions"] = captions?.toJson();
    }
    _data["code"] = code;
    if(comments != null) {
      _data["comments"] = comments?.toJson();
    }
    _data["comments_disabled"] = commentsDisabled;
    if(dimensions != null) {
      _data["dimensions"] = dimensions?.toJson();
    }
    _data["display_url"] = displayUrl;
    _data["has_upcoming_event"] = hasUpcomingEvent;
    _data["id"] = id;
    _data["is_video"] = isVideo;
    if(likedBy != null) {
      _data["liked_by"] = likedBy?.toJson();
    }
    if(owner != null) {
      _data["owner"] = owner?.toJson();
    }
    if(previewLikes != null) {
      _data["preview_likes"] = previewLikes?.toJson();
    }
    _data["product_type"] = productType;
    _data["taken_at_timestamp"] = takenAtTimestamp;
    _data["thumbnail_url"] = thumbnailUrl;
    _data["type"] = type;
    _data["view_count"] = viewCount;
    return _data;
  }

  Items copyWith({
    Captions? captions,
    String? code,
    Comments? comments,
    bool? commentsDisabled,
    Dimensions? dimensions,
    String? displayUrl,
    bool? hasUpcomingEvent,
    String? id,
    bool? isVideo,
    LikedBy? likedBy,
    Owner? owner,
    PreviewLikes? previewLikes,
    String? productType,
    int? takenAtTimestamp,
    String? thumbnailUrl,
    String? type,
    int? viewCount,
  }) => Items(
    captions: captions ?? this.captions,
    code: code ?? this.code,
    comments: comments ?? this.comments,
    commentsDisabled: commentsDisabled ?? this.commentsDisabled,
    dimensions: dimensions ?? this.dimensions,
    displayUrl: displayUrl ?? this.displayUrl,
    hasUpcomingEvent: hasUpcomingEvent ?? this.hasUpcomingEvent,
    id: id ?? this.id,
    isVideo: isVideo ?? this.isVideo,
    likedBy: likedBy ?? this.likedBy,
    owner: owner ?? this.owner,
    previewLikes: previewLikes ?? this.previewLikes,
    productType: productType ?? this.productType,
    takenAtTimestamp: takenAtTimestamp ?? this.takenAtTimestamp,
    thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    type: type ?? this.type,
    viewCount: viewCount ?? this.viewCount,
  );
}

class PreviewLikes {
  int? count;

  PreviewLikes({this.count});

  PreviewLikes.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
  }

  static List<PreviewLikes> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PreviewLikes.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    return _data;
  }

  PreviewLikes copyWith({
    int? count,
  }) => PreviewLikes(
    count: count ?? this.count,
  );
}

class Owner {
  String? id;
  String? username;

  Owner({this.id, this.username});

  Owner.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
  }

  static List<Owner> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Owner.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["username"] = username;
    return _data;
  }

  Owner copyWith({
    String? id,
    String? username,
  }) => Owner(
    id: id ?? this.id,
    username: username ?? this.username,
  );
}

class LikedBy {
  int? count;

  LikedBy({this.count});

  LikedBy.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
  }

  static List<LikedBy> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => LikedBy.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    return _data;
  }

  LikedBy copyWith({
    int? count,
  }) => LikedBy(
    count: count ?? this.count,
  );
}

class Dimensions {
  int? height;
  int? width;

  Dimensions({this.height, this.width});

  Dimensions.fromJson(Map<String, dynamic> json) {
    if(json["height"] is num) {
      height = (json["height"] as num).toInt();
    }
    if(json["width"] is num) {
      width = (json["width"] as num).toInt();
    }
  }

  static List<Dimensions> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Dimensions.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["height"] = height;
    _data["width"] = width;
    return _data;
  }

  Dimensions copyWith({
    int? height,
    int? width,
  }) => Dimensions(
    height: height ?? this.height,
    width: width ?? this.width,
  );
}

class Comments {
  int? count;

  Comments({this.count});

  Comments.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
  }

  static List<Comments> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Comments.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    return _data;
  }

  Comments copyWith({
    int? count,
  }) => Comments(
    count: count ?? this.count,
  );
}

class Captions {
  List<Items1>? items;

  Captions({this.items});

  Captions.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items1.fromJson(e)).toList();
    }
  }

  static List<Captions> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Captions.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Captions copyWith({
    List<Items1>? items,
  }) => Captions(
    items: items ?? this.items,
  );
}

class Items1 {
  String? text;

  Items1({this.text});

  Items1.fromJson(Map<String, dynamic> json) {
    if(json["text"] is String) {
      text = json["text"];
    }
  }

  static List<Items1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Items1.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["text"] = text;
    return _data;
  }

  Items1 copyWith({
    String? text,
  }) => Items1(
    text: text ?? this.text,
  );
}