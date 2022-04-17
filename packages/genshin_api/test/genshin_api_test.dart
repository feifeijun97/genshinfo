import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:genshin_api/genshin_api.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('GenshinApiClient', () {
    late http.Client httpClient;
    late GenshinApiClient genshinApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(GenshinApiClient(), isNotNull);
      });
    });

    group('character', () {
      group('getOne', () {
        test("Able to get one character and parsed it ", () {});
      });
    });
  });
}
