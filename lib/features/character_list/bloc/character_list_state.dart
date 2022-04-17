part of 'character_list_bloc.dart';

enum CharacterListStatus { initial, loading, success, failure }

extension CharacterListStatusX on CharacterListStatus {
  bool get isInitial => this == CharacterListStatus.initial;
  bool get isLoading => this == CharacterListStatus.loading;
  bool get isSuccess => this == CharacterListStatus.success;
  bool get isFailure => this == CharacterListStatus.failure;
}

class CharacterListState extends Equatable {
  CharacterListState(
      {this.status = CharacterListStatus.initial, CharacterList? characterList})
      : characterList = characterList ??
            CharacterList(characterList: List<Character>.empty());

  final CharacterListStatus status;
  final CharacterList characterList;

  CharacterListState copyWith({
    CharacterListStatus? status,
    CharacterList? characterList,
  }) {
    return CharacterListState(
      status: status ?? this.status,
      characterList: characterList ?? this.characterList,
    );
  }

  @override
  List<Object?> get props => [status, characterList];
}
