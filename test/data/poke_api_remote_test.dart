import 'package:dio/dio.dart';
import 'package:flutter_pokeapi/data/remote/poke_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements Dio {}

class MockResponse extends Mock implements Response<Map<String, dynamic>> {}

void main() {
  group('PokeApiRemote Test', () {
    late Dio dioHttpClient;
    late PokeApiRemote pokeApiRemote;

    setUp(() {
      dioHttpClient = MockHttpClient();
      pokeApiRemote = PokeApiRemote(dio: dioHttpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(pokeApiRemote, isNotNull);
      });
    });

    final response = MockResponse();
    group('getListPaging', () {
      const url = 'https://pokeapi.co/api/v2/pokemon/?limit=20&offset=0';
      test('makes correct http request', () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn({});
        when(() => dioHttpClient.get<Map<String, dynamic>>(any()))
            .thenAnswer((_) async => response);
        try {
          await pokeApiRemote.getListPaging();
        } catch (_) {}
        verify(
          () => dioHttpClient.get<Map<String, dynamic>>(url),
        ).called(1);
      });

      test('return empty list if response data null', () async {
        when(() => response.data).thenReturn(null);
        when(() => dioHttpClient.get<Map<String, dynamic>>(any()))
            .thenAnswer((_) async => response);
        final apiCall = await pokeApiRemote.getListPaging();
        expect(
          apiCall,
          equals([]),
        );
      });
    });

    group('getDetail', () {
      const mockName = 'bulbasor';
      const url = 'https://pokeapi.co/api/v2/pokemon/$mockName';
      test('makes correct http request', () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn({});
        when(() => dioHttpClient.get<Map<String, dynamic>>(any()))
            .thenAnswer((_) async => response);
        try {
          await pokeApiRemote.getDetail(mockName);
        } catch (_) {}
        verify(
          () => dioHttpClient.get<Map<String, dynamic>>(url),
        ).called(1);
      });

      test('return exception if response data null', () async {
        final exception = Exception('Poke Not Found');
        when(() => response.data).thenReturn(null);
        when(() => dioHttpClient.get<Map<String, dynamic>>(any()))
            .thenThrow(exception);
        expect(
          () async => pokeApiRemote.getDetail(mockName),
          throwsA(exception),
        );
      });
    });
  });
}
