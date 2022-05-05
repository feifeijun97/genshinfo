import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genshin_api/genshin_api.dart';
import 'package:genshinfo/features/character_filter/views/character_filter_bottom_sheet.dart';
import 'package:genshinfo/features/character_list/models/character.dart'
    as model_character;
import 'package:genshinfo/features/character_detail/views/character_detail_view.dart';
import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:genshinfo/features/character_list/views/character_list_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockGenshinApiClient extends Mock implements GenshinApiClient {}

class MockHttpClient extends Mock implements http.Client {}

class MockCharacterListBloc
    extends MockBloc<CharacterListEvent, CharacterListState>
    implements CharacterListBloc {}

class CharacterListStateFake extends Fake implements CharacterListState {}

class CharacterListEventFake extends Fake implements CharacterListEvent {}

void main() {
  final character = Character('Albedo', Vision.geo, WeaponType.sword, 5,
      "Mondstat", "test constellation", "0000-12-12", "test", <Talent>[
    Talent(
        'test talent', "test unlock", "description", TalentType.elementBurst, 1)
  ], <Talent>[
    Talent('test passive talent', "test unlock", "description",
        TalentType.elementBurst, 1)
  ], <Constellation>[
    Constellation('test constellation', "test unlock", "description", 1)
  ]);

  final modelCharacter = model_character.Character(
    name: character.name,
    vision: character.vision,
    weapon: character.weapon,
    imageUrl: "https://api.genshin.dev/characters/${character.name}/portrait",
    detailImageUrl: "https://api.genshin.dev/characters/${character.name}/card",
    birthday: character.birthday,
    rarity: character.rarity,
    affiliation: character.affiliation,
    constellationName: character.constellationName,
    talents: character.talents,
    constellations: character.constellations,
    description: character.description,
    passiveTalents: character.passiveTalents,
  );

  final modelCharacterList = model_character.CharacterList(
      characterList: <model_character.Character>[modelCharacter]);

  group('character_list', () {
    late MockCharacterListBloc mockCharacterListBloc;
    final characterList = <Character>[character];

    setUp(() {
      mockCharacterListBloc = MockCharacterListBloc();
      registerFallbackValue(CharacterListStateFake());
      registerFallbackValue(CharacterListEventFake());
    });

    testWidgets('render character list page', (tester) async {
      when(() => mockCharacterListBloc.state).thenReturn(
        CharacterListState(), // the desired state
      );

      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
              home: BlocProvider<CharacterListBloc>(
                  create: (context) => mockCharacterListBloc,
                  child: const CharacterListPage()),
            );
          },
        ),
      );
      expect(find.byType(CharacterListPage), findsOneWidget);
    });

    testWidgets(
        'call RetrieveCharacterList event when character list page rendered',
        (tester) async {
      // whenListen(
      //     mockCharacterListBloc,
      //     Stream<CharacterListState>.fromIterable([
      //       CharacterListState(),
      //       CharacterListState(status: CharacterListStatus.loading),
      //       CharacterListState(
      //           status: CharacterListStatus.success,
      //           characterList: modelCharacterList),
      //     ]));
      when(() => mockCharacterListBloc.state)
          .thenReturn(CharacterListState(status: CharacterListStatus.loading));
      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
              home: BlocProvider<CharacterListBloc>(
                  create: (context) => mockCharacterListBloc,
                  child: const CharacterListPage()),
            );
          },
        ),
      );
      verify(() => mockCharacterListBloc.add(const RetrieveCharacterList()))
          .called(1);
      // expect(find.byType(CharacterListPage), findsOneWidget);
    });

    testWidgets('shimmer show when in loading state', (tester) async {
      when((() => mockCharacterListBloc.state))
          .thenReturn(CharacterListState(status: CharacterListStatus.loading));
      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
              home: BlocProvider<CharacterListBloc>(
                  create: (context) => mockCharacterListBloc,
                  child: const CharacterListPage()),
            );
          },
        ),
      );
      expect(find.byType(Shimmer), findsWidgets);
    });

    testWidgets('not showing filter bottom sheet when in loading state',
        (tester) async {
      when((() => mockCharacterListBloc.state))
          .thenReturn(CharacterListState(status: CharacterListStatus.loading));
      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
              home: BlocProvider<CharacterListBloc>(
                  create: (context) => mockCharacterListBloc,
                  child: const CharacterListPage()),
            );
          },
        ),
      );
      await tester.tap(find.byIcon(Icons.filter_alt));
      // await tester.pumpAndSettle(const Duration(minutes: 1));
      expect(find.byType(CharacterFilterBottomSheet), findsNothing);
    });

    testWidgets('show character card when in success state (inject Albedo)',
        (tester) async {
      when((() => mockCharacterListBloc.state)).thenReturn(CharacterListState(
          status: CharacterListStatus.success,
          characterList: modelCharacterList));
      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
              home: BlocProvider<CharacterListBloc>(
                  create: (context) => mockCharacterListBloc,
                  child: const CharacterListPage()),
            );
          },
        ),
      );
      expect(find.text('Albedo'), findsOneWidget);
    });

    testWidgets(
        'filter bottom sheet shown when filter icon button pressed and in success state',
        (tester) async {
      when((() => mockCharacterListBloc.state)).thenReturn(CharacterListState(
          status: CharacterListStatus.success,
          characterList: modelCharacterList));
      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
              home: BlocProvider<CharacterListBloc>(
                  create: (context) => mockCharacterListBloc,
                  child: const CharacterListPage()),
            );
          },
        ),
      );
      await tester.tap(find.byIcon(Icons.filter_alt));
      await tester.pumpAndSettle();
      expect(find.byType(CharacterFilterBottomSheet), findsOneWidget);
    });
  });

  group('character detail', () {
    testWidgets('render character detail page', (tester) async {
      await tester.pumpWidget(
        Sizer(
          builder: (context, orientation, DeviceType deviceType) {
            return MaterialApp(
                home: CharacterDetailPage(character: modelCharacter));
          },
        ),
      );
      expect(find.byType(CharacterDetailPage), findsOneWidget);
    });
  });
}
