
class HighliteModel {
  Data? data;

  HighliteModel({this.data});

  HighliteModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<HighliteModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HighliteModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  HighliteModel copyWith({
    Data? data,
  }) => HighliteModel(
    data: data ?? this.data,
  );
}

class Data {
  int? count;
  dynamic cursor;
  dynamic hasFetchedAllRemainingHighlights;
  String? highlightsTrayType;
  List<Items>? items;
  dynamic lastPaginatedHighlightsNodeEditedAtTs;
  dynamic myWeekEnabled;
  List<dynamic>? suggestedHighlights;

  Data({this.count, this.cursor, this.hasFetchedAllRemainingHighlights, this.highlightsTrayType, this.items, this.lastPaginatedHighlightsNodeEditedAtTs, this.myWeekEnabled, this.suggestedHighlights});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
    cursor = json["cursor"];
    hasFetchedAllRemainingHighlights = json["has_fetched_all_remaining_highlights"];
    if(json["highlights_tray_type"] is String) {
      highlightsTrayType = json["highlights_tray_type"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    lastPaginatedHighlightsNodeEditedAtTs = json["last_paginated_highlights_node_edited_at_ts"];
    myWeekEnabled = json["my_week_enabled"];
    if(json["suggested_highlights"] is List) {
      suggestedHighlights = json["suggested_highlights"] ?? [];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["cursor"] = cursor;
    _data["has_fetched_all_remaining_highlights"] = hasFetchedAllRemainingHighlights;
    _data["highlights_tray_type"] = highlightsTrayType;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["last_paginated_highlights_node_edited_at_ts"] = lastPaginatedHighlightsNodeEditedAtTs;
    _data["my_week_enabled"] = myWeekEnabled;
    if(suggestedHighlights != null) {
      _data["suggested_highlights"] = suggestedHighlights;
    }
    return _data;
  }

  Data copyWith({
    int? count,
    dynamic cursor,
    dynamic hasFetchedAllRemainingHighlights,
    String? highlightsTrayType,
    List<Items>? items,
    dynamic lastPaginatedHighlightsNodeEditedAtTs,
    dynamic myWeekEnabled,
    List<dynamic>? suggestedHighlights,
  }) => Data(
    count: count ?? this.count,
    cursor: cursor ?? this.cursor,
    hasFetchedAllRemainingHighlights: hasFetchedAllRemainingHighlights ?? this.hasFetchedAllRemainingHighlights,
    highlightsTrayType: highlightsTrayType ?? this.highlightsTrayType,
    items: items ?? this.items,
    lastPaginatedHighlightsNodeEditedAtTs: lastPaginatedHighlightsNodeEditedAtTs ?? this.lastPaginatedHighlightsNodeEditedAtTs,
    myWeekEnabled: myWeekEnabled ?? this.myWeekEnabled,
    suggestedHighlights: suggestedHighlights ?? this.suggestedHighlights,
  );
}

class Items {
  dynamic adExpiryTimestampInMillis;
  dynamic appStickerInfo;
  bool? canGifQuickReply;
  bool? canReactWithAvatar;
  bool? canReply;
  dynamic canReshare;
  CoverMedia? coverMedia;
  int? createdAt;
  List<String>? disabledReplyTypes;
  String? highlightReelType;
  String? id;
  bool? isAddedToMainGrid;
  bool? isArchived;
  bool? isConvertedToClips;
  dynamic isCtaStickerAvailable;
  bool? isPinnedHighlight;
  int? latestReelMedia;
  int? mediaCount;
  dynamic poolRefreshTtlInSec;
  int? prefetchCount;
  int? rankedPosition;
  String? reelType;
  int? seenRankedPosition;
  dynamic shouldTreatLinkStickerAsCta;
  String? title;
  int? updatedTimestamp;
  User? user;

  Items({this.adExpiryTimestampInMillis, this.appStickerInfo, this.canGifQuickReply, this.canReactWithAvatar, this.canReply, this.canReshare, this.coverMedia, this.createdAt, this.disabledReplyTypes, this.highlightReelType, this.id, this.isAddedToMainGrid, this.isArchived, this.isConvertedToClips, this.isCtaStickerAvailable, this.isPinnedHighlight, this.latestReelMedia, this.mediaCount, this.poolRefreshTtlInSec, this.prefetchCount, this.rankedPosition, this.reelType, this.seenRankedPosition, this.shouldTreatLinkStickerAsCta, this.title, this.updatedTimestamp, this.user});

  Items.fromJson(Map<String, dynamic> json) {
    adExpiryTimestampInMillis = json["ad_expiry_timestamp_in_millis"];
    appStickerInfo = json["app_sticker_info"];
    if(json["can_gif_quick_reply"] is bool) {
      canGifQuickReply = json["can_gif_quick_reply"];
    }
    if(json["can_react_with_avatar"] is bool) {
      canReactWithAvatar = json["can_react_with_avatar"];
    }
    if(json["can_reply"] is bool) {
      canReply = json["can_reply"];
    }
    canReshare = json["can_reshare"];
    if(json["cover_media"] is Map) {
      coverMedia = json["cover_media"] == null ? null : CoverMedia.fromJson(json["cover_media"]);
    }
    if(json["created_at"] is num) {
      createdAt = (json["created_at"] as num).toInt();
    }
    if(json["disabled_reply_types"] is List) {
      disabledReplyTypes = json["disabled_reply_types"] == null ? null : List<String>.from(json["disabled_reply_types"]);
    }
    if(json["highlight_reel_type"] is String) {
      highlightReelType = json["highlight_reel_type"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["is_added_to_main_grid"] is bool) {
      isAddedToMainGrid = json["is_added_to_main_grid"];
    }
    if(json["is_archived"] is bool) {
      isArchived = json["is_archived"];
    }
    if(json["is_converted_to_clips"] is bool) {
      isConvertedToClips = json["is_converted_to_clips"];
    }
    isCtaStickerAvailable = json["is_cta_sticker_available"];
    if(json["is_pinned_highlight"] is bool) {
      isPinnedHighlight = json["is_pinned_highlight"];
    }
    if(json["latest_reel_media"] is num) {
      latestReelMedia = (json["latest_reel_media"] as num).toInt();
    }
    if(json["media_count"] is num) {
      mediaCount = (json["media_count"] as num).toInt();
    }
    poolRefreshTtlInSec = json["pool_refresh_ttl_in_sec"];
    if(json["prefetch_count"] is num) {
      prefetchCount = (json["prefetch_count"] as num).toInt();
    }
    if(json["ranked_position"] is num) {
      rankedPosition = (json["ranked_position"] as num).toInt();
    }
    if(json["reel_type"] is String) {
      reelType = json["reel_type"];
    }
    if(json["seen_ranked_position"] is num) {
      seenRankedPosition = (json["seen_ranked_position"] as num).toInt();
    }
    shouldTreatLinkStickerAsCta = json["should_treat_link_sticker_as_cta"];
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["updated_timestamp"] is num) {
      updatedTimestamp = (json["updated_timestamp"] as num).toInt();
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
  }

  static List<Items> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Items.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ad_expiry_timestamp_in_millis"] = adExpiryTimestampInMillis;
    _data["app_sticker_info"] = appStickerInfo;
    _data["can_gif_quick_reply"] = canGifQuickReply;
    _data["can_react_with_avatar"] = canReactWithAvatar;
    _data["can_reply"] = canReply;
    _data["can_reshare"] = canReshare;
    if(coverMedia != null) {
      _data["cover_media"] = coverMedia?.toJson();
    }
    _data["created_at"] = createdAt;
    if(disabledReplyTypes != null) {
      _data["disabled_reply_types"] = disabledReplyTypes;
    }
    _data["highlight_reel_type"] = highlightReelType;
    _data["id"] = id;
    _data["is_added_to_main_grid"] = isAddedToMainGrid;
    _data["is_archived"] = isArchived;
    _data["is_converted_to_clips"] = isConvertedToClips;
    _data["is_cta_sticker_available"] = isCtaStickerAvailable;
    _data["is_pinned_highlight"] = isPinnedHighlight;
    _data["latest_reel_media"] = latestReelMedia;
    _data["media_count"] = mediaCount;
    _data["pool_refresh_ttl_in_sec"] = poolRefreshTtlInSec;
    _data["prefetch_count"] = prefetchCount;
    _data["ranked_position"] = rankedPosition;
    _data["reel_type"] = reelType;
    _data["seen_ranked_position"] = seenRankedPosition;
    _data["should_treat_link_sticker_as_cta"] = shouldTreatLinkStickerAsCta;
    _data["title"] = title;
    _data["updated_timestamp"] = updatedTimestamp;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }

  Items copyWith({
    dynamic adExpiryTimestampInMillis,
    dynamic appStickerInfo,
    bool? canGifQuickReply,
    bool? canReactWithAvatar,
    bool? canReply,
    dynamic canReshare,
    CoverMedia? coverMedia,
    int? createdAt,
    List<String>? disabledReplyTypes,
    String? highlightReelType,
    String? id,
    bool? isAddedToMainGrid,
    bool? isArchived,
    bool? isConvertedToClips,
    dynamic isCtaStickerAvailable,
    bool? isPinnedHighlight,
    int? latestReelMedia,
    int? mediaCount,
    dynamic poolRefreshTtlInSec,
    int? prefetchCount,
    int? rankedPosition,
    String? reelType,
    int? seenRankedPosition,
    dynamic shouldTreatLinkStickerAsCta,
    String? title,
    int? updatedTimestamp,
    User? user,
  }) => Items(
    adExpiryTimestampInMillis: adExpiryTimestampInMillis ?? this.adExpiryTimestampInMillis,
    appStickerInfo: appStickerInfo ?? this.appStickerInfo,
    canGifQuickReply: canGifQuickReply ?? this.canGifQuickReply,
    canReactWithAvatar: canReactWithAvatar ?? this.canReactWithAvatar,
    canReply: canReply ?? this.canReply,
    canReshare: canReshare ?? this.canReshare,
    coverMedia: coverMedia ?? this.coverMedia,
    createdAt: createdAt ?? this.createdAt,
    disabledReplyTypes: disabledReplyTypes ?? this.disabledReplyTypes,
    highlightReelType: highlightReelType ?? this.highlightReelType,
    id: id ?? this.id,
    isAddedToMainGrid: isAddedToMainGrid ?? this.isAddedToMainGrid,
    isArchived: isArchived ?? this.isArchived,
    isConvertedToClips: isConvertedToClips ?? this.isConvertedToClips,
    isCtaStickerAvailable: isCtaStickerAvailable ?? this.isCtaStickerAvailable,
    isPinnedHighlight: isPinnedHighlight ?? this.isPinnedHighlight,
    latestReelMedia: latestReelMedia ?? this.latestReelMedia,
    mediaCount: mediaCount ?? this.mediaCount,
    poolRefreshTtlInSec: poolRefreshTtlInSec ?? this.poolRefreshTtlInSec,
    prefetchCount: prefetchCount ?? this.prefetchCount,
    rankedPosition: rankedPosition ?? this.rankedPosition,
    reelType: reelType ?? this.reelType,
    seenRankedPosition: seenRankedPosition ?? this.seenRankedPosition,
    shouldTreatLinkStickerAsCta: shouldTreatLinkStickerAsCta ?? this.shouldTreatLinkStickerAsCta,
    title: title ?? this.title,
    updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
    user: user ?? this.user,
  );
}

class User {
  String? fullName;
  String? id;
  bool? isPrivate;
  bool? isVerified;
  String? profilePicId;
  String? profilePicUrl;
  String? username;

  User({this.fullName, this.id, this.isPrivate, this.isVerified, this.profilePicId, this.profilePicUrl, this.username});

  User.fromJson(Map<String, dynamic> json) {
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
    if(json["profile_pic_id"] is String) {
      profilePicId = json["profile_pic_id"];
    }
    if(json["profile_pic_url"] is String) {
      profilePicUrl = json["profile_pic_url"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["full_name"] = fullName;
    _data["id"] = id;
    _data["is_private"] = isPrivate;
    _data["is_verified"] = isVerified;
    _data["profile_pic_id"] = profilePicId;
    _data["profile_pic_url"] = profilePicUrl;
    _data["username"] = username;
    return _data;
  }

  User copyWith({
    String? fullName,
    String? id,
    bool? isPrivate,
    bool? isVerified,
    String? profilePicId,
    String? profilePicUrl,
    String? username,
  }) => User(
    fullName: fullName ?? this.fullName,
    id: id ?? this.id,
    isPrivate: isPrivate ?? this.isPrivate,
    isVerified: isVerified ?? this.isVerified,
    profilePicId: profilePicId ?? this.profilePicId,
    profilePicUrl: profilePicUrl ?? this.profilePicUrl,
    username: username ?? this.username,
  );
}

class CoverMedia {
  dynamic cropRect;
  CroppedImageVersion? croppedImageVersion;
  dynamic fullImageVersion;
  dynamic id;
  dynamic uploadId;

  CoverMedia({this.cropRect, this.croppedImageVersion, this.fullImageVersion, this.id, this.uploadId});

  CoverMedia.fromJson(Map<String, dynamic> json) {
    cropRect = json["crop_rect"];
    if(json["cropped_image_version"] is Map) {
      croppedImageVersion = json["cropped_image_version"] == null ? null : CroppedImageVersion.fromJson(json["cropped_image_version"]);
    }
    fullImageVersion = json["full_image_version"];
    id = json["id"];
    uploadId = json["upload_id"];
  }

  static List<CoverMedia> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CoverMedia.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["crop_rect"] = cropRect;
    if(croppedImageVersion != null) {
      _data["cropped_image_version"] = croppedImageVersion?.toJson();
    }
    _data["full_image_version"] = fullImageVersion;
    _data["id"] = id;
    _data["upload_id"] = uploadId;
    return _data;
  }

  CoverMedia copyWith({
    dynamic cropRect,
    CroppedImageVersion? croppedImageVersion,
    dynamic fullImageVersion,
    dynamic id,
    dynamic uploadId,
  }) => CoverMedia(
    cropRect: cropRect ?? this.cropRect,
    croppedImageVersion: croppedImageVersion ?? this.croppedImageVersion,
    fullImageVersion: fullImageVersion ?? this.fullImageVersion,
    id: id ?? this.id,
    uploadId: uploadId ?? this.uploadId,
  );
}

class CroppedImageVersion {
  int? height;
  String? url;
  int? width;

  CroppedImageVersion({this.height, this.url, this.width});

  CroppedImageVersion.fromJson(Map<String, dynamic> json) {
    if(json["height"] is num) {
      height = (json["height"] as num).toInt();
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["width"] is num) {
      width = (json["width"] as num).toInt();
    }
  }

  static List<CroppedImageVersion> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CroppedImageVersion.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["height"] = height;
    _data["url"] = url;
    _data["width"] = width;
    return _data;
  }

  CroppedImageVersion copyWith({
    int? height,
    String? url,
    int? width,
  }) => CroppedImageVersion(
    height: height ?? this.height,
    url: url ?? this.url,
    width: width ?? this.width,
  );
}