import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_filter_model.g.dart';

@JsonSerializable()
class BookFilterModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String filter;

  const BookFilterModel(this.id, this.name, this.description, this.filter);

  static const BookFilterModel ALL = BookFilterModel(
      'all', 'Все книги', 'Все книги в библиотеке', 'select * from books');

  static const BookFilterModel MY_LIBRARY = BookFilterModel(
      'my_library',
      'Моя библиотека',
      'Книги, которые я выбрал себе в библиотеку',
      'select * from user_books where user_id = 1'); //TODO: Заменить 1 на идентификатор пользователя

  static const BookFilterModel MY_FAVORITE = BookFilterModel(
      'my_favorite',
      'Мои любимык книги',
      'Книги, которые я отметил как любимые',
      'select * from user_books where user_id = 1 and like is true'); //TODO: Заменить 1 на идентификатор пользователя

  static const BookFilterModel MY_INTEREST = BookFilterModel(
      'my_interest',
      'Меня заинтересовали',
      'Книги, которые меня заинтересовали',
      'select * from user_books where user_id = 1 and intereset is true'); //TODO: Заменить 1 на идентификатор пользователя

  static const BookFilterModel POPULAR = BookFilterModel(
      'popular',
      'Популярные',
      'Самые популярные книги за сегодня',
      'select * from books where last_like_update = today and like_count>0 order like_count DESC limit 50'); //TODO: Заменить 1 на идентификатор пользователя

  static const BookFilterModel LIKE = BookFilterModel(
      'like',
      'Понравились',
      'Книги, которые понравились читателям',
      'select * from books where like_count>0 and last_like_updated>now-2week order like_count DESC limit 50'); //TODO: Заменить 1 на идентификатор пользователя

  static const BookFilterModel HOT = BookFilterModel(
      'hot',
      'Горячие новинки',
      'Популярные новинки за последние 2 недели',
      'select * from books where created>now-2week and like_count>0 order like_count DESC limit 50');

  static const BookFilterModel LAST_UPDATED = BookFilterModel(
      'last_updated',
      'Последние обновления',
      'Новые главы и фрагменты книг',
      'select * from books where updated>now-2week and like_count>0 order like_count DESC limit 50');

  static const BookFilterModel BEST_SALLERS = BookFilterModel(
      'bestsellers',
      'Бестцеллеры',
      'Книги на которые не жалко денег',
      'select * from books where last_buy_date>now-2week and buy_count>0 order like_count DESC limit 50');

  static const BookFilterModel NEW = BookFilterModel(
      'new',
      'Новые',
      'Новые публикации',
      'select * from books where published>now-2week limit 50');

  static const BookFilterModel READING = BookFilterModel(
      'Сейчас читают',
      'Книги, которые сейчас читают',
      'reading',
      'select * from books where reading is true limit 50');

  static const BookFilterModel SALES = BookFilterModel(
      'Распродажа',
      'Книги со скидками',
      'sales',
      'select * from books where sales is true limit 50');

  static const BookFilterModel RECOMMENDED = BookFilterModel(
      'Рекомендуемые',
      'Книги, рекомендованные к прочтению',
      'recommended',
      'select * from books where recommended is true limit 50');

  factory BookFilterModel.fromJson(Map<String, dynamic> json) =>
      _$BookFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookFilterModelToJson(this);

  @override
  List<Object?> get props => [id, name, description, filter];
}
