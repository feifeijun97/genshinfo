import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genshin_api/genshin_api.dart';
import 'package:genshinfo/features/character_list/models/character.dart'
    as model_character;
import 'package:genshinfo/features/character_detail/views/character_detail_view.dart';
import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:genshinfo/features/character_list/views/character_list_page.dart';
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
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

@GenerateMocks([http.Client])
void main() {
  group('character_list', () {
    late MockHttpClient mockHttpClient;
    late MockCharacterListBloc mockCharacterListBloc;
    late MockGenshinApiClient mockGenshinApiClient;
    final character = Character('Albedo', Vision.geo, WeaponType.sword, 5,
        "Mondstat", "test constellation", "0000-12-12", "test", <Talent>[
      Talent('test talent', "test unlock", "description",
          TalentType.elementBurst, 1)
    ], <Talent>[
      Talent('test passive talent', "test unlock", "description",
          TalentType.elementBurst, 1)
    ], <Constellation>[
      Constellation('test constellation', "test unlock", "description", 1)
    ]);
    final characterList = <Character>[character];

    final modelCharacter = model_character.Character(
      name: character.name,
      vision: character.vision,
      weapon: character.weapon,
      imageUrl: "https://api.genshin.dev/characters/${character.name}/portrait",
      detailImageUrl:
          "https://api.genshin.dev/characters/${character.name}/card",
      birthday: character.birthday,
      rarity: character.rarity,
      affiliation: character.affiliation,
      constellationName: character.constellationName,
      talents: character.talents,
      constellations: character.constellations,
      description: character.description,
      passiveTalents: character.passiveTalents,
    );

    setUp(() {
      mockHttpClient = MockHttpClient();
      mockGenshinApiClient = MockGenshinApiClient();
      mockCharacterListBloc = MockCharacterListBloc();
      registerFallbackValue(CharacterListStateFake());
      registerFallbackValue(CharacterListEventFake());
    });

    testWidgets('render character list page', (tester) async {
      // when(genshinApiClient.getAllCharacters())
      //     .thenAnswer((_) async => characterList);
      // final httpClient = MockClient();
      // when(httpClient.get(Uri.parse("https://api.genshin.dev/characters/all")))
      //     .thenAnswer((_) async => http.Response(
      //         '[{"name":"Albedo","vision":"Geo","weapon":"Sword","nation":"Mondstadt","affiliation":"Knights of Favonius","rarity":5,"constellation":"Princeps Cretaceus","birthday":"0000-09-13","description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius.","skillTalents":[{"name":"Favonius Bladework - Weiss","unlock":"Normal Attack","description":"Normal Attack\nPerform up to 5 rapid strikes.\nCharged Attack\nConsumes a certain amount of Stamina to unleash 2 rapid sword strikes.\nPlunging Attack\nPlunges from mid-air to strike the ground below, damaging opponents along the path and dealing AoE DMG upon impact.","type":"NORMAL_ATTACK"},{"name":"Abiogenesis: Solar Isotoma","unlock":"Elemental Skill","description":"Albedo creates a Solar Isotoma using alchemy, which deals AoE Geo DMG on appearance.\nSolar Isotoma\n\nWhen enemies within the Solar Isotoma zone are hit, the Solar Isotoma will generate Transient Blossoms which deal AoE Geo DMG. DMG dealt scales off Albedos DEF.\nTransient Blossoms can only be generated once every 2s.\nWhen a character is located at the locus of the Solar Isotoma, the Solar Isotoma will accumulate Geo power to form a crystallized platform that lifts the character up to a certain height. Only one crystallized platform can exist at a time.\nSolar Isotoma is considered a Geo construct.\n\nHold to designate the location of the skill.","type":"ELEMENTAL_SKILL"},{"name":"Rite of Progeniture: Tectonic Tide","unlock":"Elemental Burst","description":"Under Albedos command, Geo crystals surge and burst forth, dealing AoE Geo DMG in front of him.\nIf a Solar Isotoma created by Albedo himself is on the field, 7 Fatal Blossoms will be generated in the Solar Isotoma field, bursting violently into bloom and dealing AoE Geo DMG\nTecotonic Tide DMG and Fatal Blossom DMG will not generate Transient Blossoms.","type":"ELEMENTAL_BURST"}],"passiveTalents":[{"name":"Calcite Might","unlock":"Unlocked at Ascension 1","description":"Transient Blossoms generated by Abiogenesis: Solar Isotoma deal 25% more DMG to enemies whose HP is below 50%.","level":1},{"name":"Homuncular Nature","unlock":"Unlocked at Ascension 4","description":"Using Rite of Progeniture: Tectonic Tide increases the Elemental Mastery of nearby party members by 125 for 10s.","level":4},{"name":"Flash of Genius","unlock":"Unlocked Automatically","description":"When Albedo crafts Weapon Ascension Materials, he has a 10% chance to receive double the product."}],"constellations":[{"name":"Flower of Eden","unlock":"Constellation Lv. 1","description":"Transient Blossoms generated by Albedos Abiogenesis: Solar Isotoma regenerate 1.2 Energy for Albedo.","level":1},{"name":"Opening of Phanerozoic","unlock":"Constellation Lv. 2","description":"Transient Blossoms generated by Abiogenesis: Solar Isotoma grant Albedo Fatal Reckoning for 30s:\n\nEach stack of Fatal Reckoning increases DMG by of Albedos DEF.\nThe effect stacks up to 4 times.\n\nUnleashing Rite of Progeniture: Tectonic Tide consumes all stacks of Fatal Reckoning, increasing the DMG dealt by the Tectonic Tide and Fatal Blossoms based on the number of stacks consumed.","level":2},{"name":"Grace of Helios","unlock":"Constellation Lv. 3","description":"Increases the level of Abiogenesis: Solar Isotoma by 3.\nMaximum upgrade level is 15.","level":3},{"name":"Descent of Divinity","unlock":"Constellation Lv. 4","description":"Solar Isotoma increases Plunging Attack DMG by 30% for active party members within the AoE.","level":4},{"name":"Tide of Hadaen","unlock":"Constellation Lv. 5","description":"Increases the level of Rite of Progeniture: Tectonic Tide by 3.\nMaximum upgrade level is 15.","level":5},{"name":"Dust of Purification","unlock":"Constellation Lv. 6","description":"If active party members within the AoE are protected by a shield created by Crystallize, Solar Isotoma increases their DMG by 17%.","level":6}],"vision_key":"GEO","weapon_type":"SWORD"}]',
      //         200));
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
