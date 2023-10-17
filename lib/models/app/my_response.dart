class MyResponse{
  int statusCode;
  String message;
  bool success;

  MyResponse({this.message="",this.statusCode=1,this.success=false});

  factory MyResponse.fromJson(Map<String, dynamic> data,{int statusCode=1,bool success=false})=>MyResponse(
    message: data['message']??"",success:success,statusCode: statusCode,
  );
}