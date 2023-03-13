class Users {
  int? id;
  String? name;
  String? surname;
  String? phone;
  String? profile;
  String? status;
  String? depositStatus;
  String? email;
  String? twoFactorConfirmedAt;
  String? currentTeamId;

  Users({
    required this.name,
    required this.email,
    required this.phone,
    required this.surname,
    required this.status,
    required this.depositStatus,
    required this.twoFactorConfirmedAt,
    required this.profile,
    required this.id,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
    id: json['id'],
    name : json['name'],
    surname : json['surname'],
    phone : json['phone'],
    profile : json['profile'],
    status : json['status'],
    depositStatus : json['deposit_status'],
    email : json['email'],
    twoFactorConfirmedAt : json['two_factor_confirmed_at'],
    );
  }
}