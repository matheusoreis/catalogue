class SignUpData {
  String id;
  String username;
  String name;
  String document;
  String phone;
  bool verified;
  String access;

  SignUpData({
    required this.id,
    required this.username,
    required this.name,
    required this.document,
    required this.phone,
    required this.verified,
    required this.access,
  });

  factory SignUpData.fromJson(Map<String, dynamic> json) {
    return SignUpData(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      document: json['document'],
      phone: json['phone'],
      verified: json['verified'],
      access: json['access'],
    );
  }

  factory SignUpData.empty() {
    return SignUpData(
      id: '',
      username: '',
      name: '',
      document: '',
      phone: '',
      verified: false,
      access: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'document': document,
      'phone': phone,
      'verified': verified,
      'access': access,
    };
  }
}
