class BlogModelData {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<BlogModelItems> items;

  BlogModelData({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory BlogModelData.fromJson(Map<String, dynamic> map) {
    return BlogModelData(
      page: map['page'],
      perPage: map['perPage'],
      totalItems: map['totalItems'],
      totalPages: map['totalPages'],
      items: List<BlogModelItems>.from(
        map['items'].map(
          (item) {
            return BlogModelItems.fromJson(item);
          },
        ),
      ),
    );
  }

  factory BlogModelData.empty() {
    return BlogModelData(page: 0, perPage: 0, totalItems: 0, totalPages: 0, items: <BlogModelItems>[
      BlogModelItems(
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

class BlogModelItems {
  String id;
  String collectionId;
  String collectionName;
  String created;
  String updated;
  String title;
  String description;
  String background;

  BlogModelItems({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.title,
    required this.description,
    required this.updated,
    required this.background,
  });

  factory BlogModelItems.empty() {
    return BlogModelItems(
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

  factory BlogModelItems.fromJson(Map<String, dynamic> json) {
    return BlogModelItems(
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
