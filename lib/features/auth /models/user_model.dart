class UserModel{
  final String? id ;
  final String? email;

  UserModel({required this.id , required this.email});

  UserModel empty() => UserModel(id: '', email: '');

  Map<String,dynamic> toJson(UserModel user){
    return{
      'id' : user.id,
      'email' : user.email,
    };
  }

  UserModel? fromJson(Map<String,dynamic> json){
    return UserModel(
        id: json['id'],
        email: json['email']
    );
  }
}