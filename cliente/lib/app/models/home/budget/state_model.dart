class StateModelData {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<StateModelItems> items;

  StateModelData({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory StateModelData.fromJson(Map<String, dynamic> map) {
    return StateModelData(
      page: map['page'],
      perPage: map['perPage'],
      totalItems: map['totalItems'],
      totalPages: map['totalPages'],
      items: List<StateModelItems>.from(
        map['items'].map(
          (item) {
            return StateModelItems.fromJson(item);
          },
        ),
      ),
    );
  }

  factory StateModelData.empty() {
    return StateModelData(
      page: 0,
      perPage: 0,
      totalItems: 0,
      totalPages: 0,
      items: <StateModelItems>[
        StateModelItems(
          collectionId: '',
          collectionName: '',
          created: '',
          id: '',
          name: '',
          reduction: '',
          disabled: false,
          updated: '',
        ),
      ],
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

class StateModelItems {
  String collectionId;
  String collectionName;
  String created;
  String id;
  String name;
  String reduction;
  bool disabled;
  String updated;

  StateModelItems({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.name,
    required this.reduction,
    required this.disabled,
    required this.updated,
  });

  factory StateModelItems.empty() {
    return StateModelItems(
      collectionId: '',
      collectionName: '',
      created: '',
      id: '',
      name: '',
      reduction: '',
      disabled: false,
      updated: '',
    );
  }

  factory StateModelItems.fromJson(Map<String, dynamic> json) {
    return StateModelItems(
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      id: json['id'],
      name: json['name'],
      reduction: json['reduction'],
      disabled: json['disabled'],
      updated: json['updated'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'name': name,
      'reduction': reduction,
      'updated': updated,
    };
  }
}
