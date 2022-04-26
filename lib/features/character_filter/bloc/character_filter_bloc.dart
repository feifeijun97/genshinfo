import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genshin_api/genshin_api.dart' show Vision, WeaponType;

part 'character_filter_event.dart';
part 'character_filter_state.dart';

class CharacterFilterBloc
    extends Bloc<CharacterFilterEvent, CharacterFilterState> {
  CharacterFilterBloc(
      {List<Vision>? visions, List<WeaponType>? weaponTypes, int? rarity})
      : super(CharacterFilterState(
          status: CharacterFilterStatus.initial,
          visions: visions ?? [],
          weaponTypes: weaponTypes ?? [],
          rarity: rarity ?? 0,
        )) {
    on<CharacterFilterEvent>((event, emit) {});
    on<VisionSelected>(_onVisionSelected);
    on<WeaponTypeSelected>(_onWeaponTypeSelected);
    on<RaritySelected>(_onRaritySelected);
  }

  Future<void> _onVisionSelected(
      VisionSelected event, Emitter<CharacterFilterState> emit) async {
    try {
      var visions = state.visions;
      //remove if user selected before, add into list otherwise
      if (visions.contains(event.vision)) {
        visions = state.visions.where((e) => e != event.vision).toList();
      } else {
        visions = state.visions + [event.vision];
      }
      emit(state.copyWith(
        status: CharacterFilterStatus.success,
        visions: visions,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: CharacterFilterStatus.failure));
    }
  }

  Future<void> _onWeaponTypeSelected(
      WeaponTypeSelected event, Emitter<CharacterFilterState> emit) async {
    try {
      List<WeaponType> weaponTypes = state.weaponTypes;
      //remove if user selected before, add into list otherwise
      if (weaponTypes.contains(event.weaponType)) {
        weaponTypes =
            state.weaponTypes.where((e) => e != event.weaponType).toList();
      } else {
        weaponTypes = state.weaponTypes + [event.weaponType];
      }
      emit(state.copyWith(
        status: CharacterFilterStatus.success,
        weaponTypes: weaponTypes,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: CharacterFilterStatus.failure));
    }
  }

  Future<void> _onRaritySelected(
      RaritySelected event, Emitter<CharacterFilterState> emit) async {
    try {
      emit(state.copyWith(
        status: CharacterFilterStatus.success,
        rarity: event.rarity,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: CharacterFilterStatus.failure));
    }
  }
}
