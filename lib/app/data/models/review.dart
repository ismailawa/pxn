class Review {
  String id;
  int rating;
  String message;
  String user;

  Review({
    this.id,
    this.rating,
    this.message,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json['_id'],
        rating: json['rating'],
        message: json['message'],
        user: json['user'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'rating': rating,
        'message': message,
        'user': user,
      };
}
