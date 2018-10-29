import 'package:cine_reel/bloc/person_bloc.dart';
import 'package:cine_reel/ui/person_details/person_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/common_mocks.dart';
import '../../fixtures/person_fixtures.dart';

const LoadingState = TypeMatcher<PersonLoading>();
const PopulatedState = TypeMatcher<PersonPopulated>();
const FailedState = TypeMatcher<PersonFailed>();

void main() {
  MockTMDBApi mockTMDBApi;
  PersonBloc personBloc;

  setUp(() {
    mockTMDBApi = MockTMDBApi();
    personBloc = PersonBloc(tmdbApi: mockTMDBApi, personId: 0);
  });

  test('emits loading and populated state in order', () {
    when(mockTMDBApi.getPerson(personId: anyNamed("personId")))
        .thenAnswer((_) async => populatedPerson);

    expect(personBloc.stream, emitsInOrder([LoadingState, PopulatedState]));
  });

	test('emits loading and failed state in order', () {
		when(mockTMDBApi.getPerson(personId: anyNamed("personId")))
				.thenAnswer((_) async => emptyPerson);

		expect(personBloc.stream, emitsInOrder([LoadingState, FailedState]));
	});

	test('emits loading and failed state because of exception in order', () {
		when(mockTMDBApi.getPerson(personId: anyNamed("personId")))
				.thenAnswer((_) async => Future.error(Exception("error")));

		expect(personBloc.stream, emitsInOrder([LoadingState, FailedState]));
	});
}
