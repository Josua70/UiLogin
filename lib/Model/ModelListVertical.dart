class ModelListVertical {
  List<Search>? search;
  String? error;

  ModelListVertical({this.search, this.error});


  ModelListVertical.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <Search>[];
      json['Search'].forEach((v) {
        search!.add(new Search.fromJson(v));
      });
    }
  }
  factory ModelListVertical.withError(String error) => ModelListVertical(error: error);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['Search'] = this.search!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Search {
  String? imdbID;
  String? Title;
  String? Year;
  String? Poster;

  Search({this.imdbID, this.Title, this.Year, this.Poster,});

  Search.fromJson(Map<String, dynamic> json) {
    imdbID = json['imdbID'];
    Title = json['Title'];
    Year = json['Year'];
    Poster = json['Poster'];

  }

  Map<String, dynamic> toJson()
      {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['imdbID'] = this.imdbID;
        data['Title'] = this.Title;
        data['Year'] = this.Year;
        data['Poster'] = this.Poster;
        return data;

  }
}