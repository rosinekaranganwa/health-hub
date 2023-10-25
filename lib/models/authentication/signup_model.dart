class SignUpModel{
  String phone_number;
  String? email;
  String password;
  String confirm_password;

  SignUpModel({
    required this.phone_number,
    this.email,
    required this.password,
    required this.confirm_password,
  });

  toJson(){
    Map<String,String?> d={
      "phone_number": phone_number,
      "password": password,
      "confirm_password": confirm_password,
    };
    if(email!=null){
      d['email']=email;
    }

    return d;
  }
}
