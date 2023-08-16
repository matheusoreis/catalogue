class SignInModel {
  String token;
  SignInModelRecord record;

  SignInModel({
    required this.token,
    required this.record,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      token: json['token'],
      record: SignInModelRecord.fromJson(
        json['record'],
      ),
    );
  }

  factory SignInModel.empty() {
    return SignInModel(
      token: '',
      record: SignInModelRecord.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'record': record.toMap(),
    };
  }
}

class SignInModelRecord {
  String collectionId;
  String collectionName;
  String created;
  String document;
  String email;
  bool emailVisibility;
  String id;
  String name;
  String phone;
  String updated;
  String username;
  String access;

  SignInModelRecord({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.document,
    required this.email,
    required this.emailVisibility,
    required this.id,
    required this.name,
    required this.phone,
    required this.updated,
    required this.username,
    required this.access,
  });

  factory SignInModelRecord.fromJson(Map<String, dynamic> json) {
    return SignInModelRecord(
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      document: json['document'],
      email: json['email'],
      emailVisibility: json['emailVisibility'],
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      updated: json['updated'],
      username: json['username'],
      access: json['access'],
    );
  }

  factory SignInModelRecord.empty() {
    return SignInModelRecord(
      collectionId: '',
      collectionName: '',
      created: '',
      document: '',
      email: '',
      emailVisibility: false,
      id: '',
      name: '',
      phone: '',
      updated: '',
      username: '',
      access: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'document': document,
      'email': email,
      'emailVisibility': emailVisibility,
      'id': id,
      'name': name,
      'phone': phone,
      'updated': updated,
      'username': username,
      'access': access,
    };
  }
}
