class IntroModelData {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<IntroModelItems> items;

  IntroModelData({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory IntroModelData.fromJson(Map<String, dynamic> map) {
    return IntroModelData(
      page: map['page'],
      perPage: map['perPage'],
      totalItems: map['totalItems'],
      totalPages: map['totalPages'],
      items: List<IntroModelItems>.from(
        map['items'].map(
          (item) {
            return IntroModelItems.fromJson(item);
          },
        ),
      ),
    );
  }

  factory IntroModelData.empty() {
    return IntroModelData(
      page: 0,
      perPage: 0,
      totalItems: 0,
      totalPages: 0,
      items: List<IntroModelItems>.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
      'totalItems': totalItems,
      'totalPages': totalPages,
      'items': List<dynamic>.from(
        items.map(
          (item) {
            return item.toMap();
          },
        ),
      ),
    };
  }
}

class IntroModelItems {
  String button;
  String collectionId;
  String collectionName;
  String created;
  String background;
  String id;
  String title;
  String updated;

  IntroModelItems({
    required this.button,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.background,
    required this.id,
    required this.title,
    required this.updated,
  });

  factory IntroModelItems.fromJson(Map<String, dynamic> json) {
    return IntroModelItems(
      button: json['button'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      background: json['background'],
      id: json['id'],
      title: json['title'],
      updated: json['updated'],
    );
  }

  factory IntroModelItems.empty() {
    return IntroModelItems(
      button: '',
      collectionId: '',
      collectionName: '',
      created: '',
      background: '',
      id: '',
      title: '',
      updated: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'button': button,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'background': background,
      'id': id,
      'title': title,
      'updated': updated,
    };
  }
}
