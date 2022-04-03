class ListModel{
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  String? error;

  ListModel(
  {
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.error,
  }
  );

  ListModel.FromJson(Map<String, dynamic> json){
    page = json['page'];
    perPage = json ['per_Page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
  factory ListModel.withError(String error) => ListModel(error: error);
  Map<String, dynamic> toJson(){
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['page'] = this.page;
  data['per_Page'] = this.perPage;
  data['total'] = this.total;
  data['total_pages'] = this.totalPages;
  if (this.data != null){
    data['data'] = this.data!.map((v) => v.toJson()).toList();
}
  return data;
  }
}
class Data{
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['lastName'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}
