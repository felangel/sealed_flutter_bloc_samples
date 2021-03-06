import 'package:equatable/equatable.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'package:sealed_flutter_infinite_list/models/models.dart';

class PostState extends Union3Impl<Initial, Success, Failure> {
  static final unions = const Triplet<Initial, Success, Failure>();

  PostState._(Union3<Initial, Success, Failure> union) : super(union);

  factory PostState.initial() => PostState._(unions.first(Initial()));

  factory PostState.success({List<Post> posts, bool hasReachedMax}) =>
      PostState._(
        unions.second(Success(posts: posts, hasReachedMax: hasReachedMax)),
      );

  factory PostState.failure() => PostState._(unions.third(Failure()));
}

class Initial extends Equatable {
  @override
  List<Object> get props => [];
}

class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class Success extends Equatable {
  final List<Post> posts;
  final bool hasReachedMax;

  const Success({
    this.posts,
    this.hasReachedMax,
  });

  @override
  List<Object> get props => [posts, hasReachedMax];
}
