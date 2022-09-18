import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final String photo;
  final String price;

  const BookModel(this.id, this.title, this.author, this.price, this.photo);

  static const BookModel empty = BookModel('new', '', '', '', '');
  static BookModel test(String index) => BookModel(
      index,
      'Название ' + index,
      'Автор ' + index,
      Random().nextInt(300).toString(),
      'https://placeimg.com/640/480/any');
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);

  @override
  List<Object?> get props => [id, title, author, price, photo];
}
