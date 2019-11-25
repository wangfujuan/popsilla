class ListData {
  final String shortname;
  final String playlink;
  final double rating;
  final String catename;
  final int id;

  ListData({
    this.shortname,
    this.playlink,
    this.rating,
    this.catename,
    this.id
  });

  factory ListData.fromJson(Map<String, dynamic> json) {
    return ListData(
      shortname: json['short_name'] as String,  
      playlink: json['play_link'] as String, 
      rating: json['rating'] as double,
      catename: json['cate_name'] as String,
      id: json['id'] as int,
    );
  }
} 