class CreateBudgetModel {
  bool active;
  String city;
  String collectionId;
  String collectionName;
  String created;
  String email;
  String id;
  String name;
  String document;
  String order;
  String phone;
  String state;
  String updated;

  CreateBudgetModel({
    required this.active,
    required this.city,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.email,
    required this.id,
    required this.name,
    required this.document,
    required this.order,
    required this.phone,
    required this.state,
    required this.updated,
  });

  factory CreateBudgetModel.fromJson(Map<String, dynamic> json) {
    return CreateBudgetModel(
      active: json['active'],
      city: json['city'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
      document: json['document'],
      order: json['order'],
      phone: json['phone'],
      state: json['state'],
      updated: json['updated'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'city': city,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'email': email,
      'id': id,
      'name': name,
      'document': document,
      'order': order,
      'phone': phone,
      'state': state,
      'updated': updated,
    };
  }
}
