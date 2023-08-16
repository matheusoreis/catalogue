class EntryModelData {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<EntryModelItems> items;

  EntryModelData({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory EntryModelData.fromJson(Map<String, dynamic> map) {
    return EntryModelData(
      page: map['page'],
      perPage: map['perPage'],
      totalItems: map['totalItems'],
      totalPages: map['totalPages'],
      items: List<EntryModelItems>.from(
        map['items'].map(
          (item) => EntryModelItems.fromJson(item),
        ),
      ),
    );
  }

  factory EntryModelData.clear() {
    return EntryModelData(
      page: 0,
      perPage: 0,
      totalItems: 0,
      totalPages: 0,
      items: List<EntryModelItems>.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
      'totalItems': totalItems,
      'totalPages': totalPages,
      'items': List<dynamic>.from(items.map((item) => item.toMap())),
    };
  }
}

class EntryModelItems {
  String background;
  String collectionId;
  String collectionName;
  String createAccountButton;
  String id;
  String loginAccountButton;
  String welcomeMessage;

  EntryModelItems({
    required this.background,
    required this.collectionId,
    required this.collectionName,
    required this.createAccountButton,
    required this.id,
    required this.loginAccountButton,
    required this.welcomeMessage,
  });

  factory EntryModelItems.fromJson(Map<String, dynamic> map) {
    return EntryModelItems(
      background: map['background'],
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      createAccountButton: map['createAccountButton'],
      id: map['id'],
      loginAccountButton: map['loginAccountButton'],
      welcomeMessage: map['welcomeMessage'],
    );
  }

  factory EntryModelItems.empty() {
    return EntryModelItems(
      background: '',
      collectionId: '',
      collectionName: '',
      createAccountButton: '',
      id: '',
      loginAccountButton: '',
      welcomeMessage: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'background': background,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'createAccountButton': createAccountButton,
      'id': id,
      'loginAccountButton': loginAccountButton,
      'welcomeMessage': welcomeMessage,
    };
  }
}
