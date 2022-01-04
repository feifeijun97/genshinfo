part of 'character_list_bloc.dart';

enum ListStatus { initial, success, failure }

@immutable
abstract class CharacterListState extends Equatable {
  const CharacterListState();
}

class CharacterListInitial extends CharacterListState {
  @override
  List<Object> get props => [];
}

class CharacterListLoading extends CharacterListState {
  @override
  List<Object> get props => [];
}

class CharacterListResult extends CharacterListState {
  const CharacterListResult(
      {this.status = ListStatus.initial,
      this.lists = const <CharacterList>[],
      this.hasReachedMax = false});

  final ListStatus status;
  final List<CharacterList> lists;
  final bool hasReachedMax;

  @override
  List<Object> get props => [hasReachedMax];
}
