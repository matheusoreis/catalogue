class ConditionerModelData {
  final int page;
  final int perPage;
  final int totalItems;
  final int totalPages;
  final List<ConditionerModelItems> items;

  ConditionerModelData({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  factory ConditionerModelData.fromJson(Map<String, dynamic> json) {
    return ConditionerModelData(
      page: json['page'],
      perPage: json['perPage'],
      totalItems: json['totalItems'],
      totalPages: json['totalPages'],
      items: List<ConditionerModelItems>.from(
        json['items'].map(
          (items) {
            return ConditionerModelItems.fromJson(items);
          },
        ),
      ),
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
      )
    };
  }

  factory ConditionerModelData.blank() {
    return ConditionerModelData(
      page: 0,
      perPage: 0,
      totalItems: 0,
      totalPages: 0,
      items: List<ConditionerModelItems>.empty(),
    );
  }
}

class ConditionerModelItems {
  final String airFlow;
  final String area;
  final String collectionId;
  final String collectionName;
  final String created;
  final String dimension;
  final bool disabled;
  final bool emphasis;
  final String engine;
  final List exit;
  final String frequency;
  final String id;
  final String image;
  final String material;
  final String model;
  final String name;
  final String noise;
  final String updated;
  final String voltage;
  final String waterConsumption;
  final String waterTank;

  ConditionerModelItems({
    required this.airFlow,
    required this.area,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.dimension,
    required this.disabled,
    required this.emphasis,
    required this.engine,
    required this.exit,
    required this.frequency,
    required this.id,
    required this.image,
    required this.material,
    required this.model,
    required this.name,
    required this.noise,
    required this.updated,
    required this.voltage,
    required this.waterConsumption,
    required this.waterTank,
  });

  factory ConditionerModelItems.fromJson(Map<String, dynamic> json) {
    return ConditionerModelItems(
      airFlow: json['airFlow'],
      area: json['area'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      dimension: json['dimension'],
      disabled: json['disabled'],
      emphasis: json['emphasis'],
      engine: json['engine'],
      exit: json['exit'],
      frequency: json['frequency'],
      id: json['id'],
      image: json['image'],
      material: json['material'],
      model: json['model'],
      name: json['name'],
      noise: json['noise'],
      updated: json['updated'],
      voltage: json['voltage'],
      waterConsumption: json['waterConsumption'],
      waterTank: json['waterTank'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'airFlow': airFlow,
      'area': area,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'dimension': dimension,
      'disabled': disabled,
      'emphasis': emphasis,
      'engine': engine,
      'exit': exit,
      'frequency': frequency,
      'id': id,
      'image': image,
      'material': material,
      'model': model,
      'name': name,
      'noise': noise,
      'updated': updated,
      'voltage': voltage,
      'waterConsumption': waterConsumption,
      'waterTank': waterTank,
    };
  }
}
