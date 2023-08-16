class AboutModelData {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<AboutModelItems> items;

  AboutModelData({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory AboutModelData.fromJson(Map<String, dynamic> map) {
    return AboutModelData(
      page: map['page'],
      perPage: map['perPage'],
      totalItems: map['totalItems'],
      totalPages: map['totalPages'],
      items: List<AboutModelItems>.from(
        map['items'].map(
          (item) {
            return AboutModelItems.fromJson(item);
          },
        ),
      ),
    );
  }

  factory AboutModelData.empty() {
    return AboutModelData(page: 0, perPage: 0, totalItems: 0, totalPages: 0, items: <AboutModelItems>[
      AboutModelItems(
        collectionId: '',
        collectionName: '',
        created: '',
        id: '',
        title: '',
        description: '',
        updated: '',
        background: '',
      ),
    ]);
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

class AboutModelItems {
  String id;
  String collectionId;
  String collectionName;
  String created;
  String updated;
  String title;
  String description;
  String background;

  AboutModelItems({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.title,
    required this.description,
    required this.updated,
    required this.background,
  });

  factory AboutModelItems.empty() {
    return AboutModelItems(
      id: '',
      collectionId: '',
      collectionName: '',
      created: '',
      updated: '',
      title: '',
      description: '',
      background: '',
    );
  }

  factory AboutModelItems.fromJson(Map<String, dynamic> json) {
    return AboutModelItems(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      updated: json['updated'],
      title: json['title'],
      description: json['description'],
      background: json['background'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'title': title,
      'description': description,
      'background': background,
    };
  }
}
