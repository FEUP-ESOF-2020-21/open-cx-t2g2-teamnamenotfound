import 'package:flutter_test/flutter_test.dart';
import 'package:safe_meetings/objects/conference.dart';
import 'package:safe_meetings/screens/home.dart';

void main() {
  ConferenceMock c = ConferenceMock(
      "Conferência de Teste",
      "Esta conferência serve única e exclusivamente para testes unitários",
      "2020-12-11", "17:00", "Android Studio",
      [1, 2],
      [4, 5],
      [3, 3],
      ["user1", "user2", "user3"],
      ["user2"],
      "testing",
      ["me"]
  );
  c.setKey("conferenceKey");

  test('Dados de Conferência', () {
    expect(c.getName(), "Conferência de Teste");
    expect(c.getDescription(), "Esta conferência serve única e exclusivamente para testes unitários");
    expect(c.getDate(), "2020-12-11");
    expect(c.getHour(), "17:00");
    expect(c.getLocal(), "Android Studio");
    expect(c.getHygien(), 2);
    expect(c.getInterest(), 5);
    expect(c.getSecurity(), 3);
    expect(c.getUsers().length, 3);
    expect(c.getVotedUsers().length, 1);
    expect(c.getCode(), "testing");
    expect(c.getOrganizers().length, 1);
    expect(c.isParticipant("user3"), true);
    expect(c.isParticipant("user4"), false);
    expect(c.isOrganizer("user1"), false);
    expect(c.isOrganizer("me"), true);
    expect(c.hasntVoted("user1"), true);
    expect(c.hasntVoted("user2"), false);
  });

  test('Avaliação de Conferência', () {
    c.setEvaluation(5, 1, 5);
    c.vote("user1");

    expect(c.hasntVoted("user1"), false);
    expect(c.getHygien(), 3);
    expect(c.getInterest(), 3);
    expect(c.getSecurity(), 4);
    expect(c.getUsers().length, 3);
    expect(c.getVotedUsers().length, 2);
  });

  test('Filtros de conferências', () {
    HomeMock H = HomeMock();

    H.conferences.add(ConferenceMock("Teste1", "", "2021-02-25", "12:00", "B001",
        [5], [3], [1],
        ["user1", "user2"], ["user1"], "code", ["user2"]));
    H.conferences.add(ConferenceMock("Teste2", "", "2021-03-01", "18:30", "B002",
        [1], [3], [5],
        ["user1", "user2"], ["user1"], "code", ["user2"]));
    H.conferences.add(ConferenceMock("Teste3", "", "2021-01-25", "17:00", "B003",
        [2], [4], [4],
        ["user1", "user2"], ["user1"], "code", ["user2"]));

    expect(H.showConfs().length, 3);

    H.changeFilters("Teste", "B", 0, 0, 0, "2021-01-01", "2021-12-31");
    // Teste é substring de Teste1, Teste2 e Teste3, tal como B é substring de B001, B002 e B003
    expect(H.showConfs().length, 3);

    H.changeFilters("", "", 0, 0, 0, "2021-02-23", "2021-03-02");
    // Esperadas as 2 primeiras conferências
    expect(H.showConfs().length, 2);

    H.changeFilters("", "", 0, 0, 4, "2021-01-01", "2021-12-31");
    // Esperadas as 2 últimas conferências
    expect(H.showConfs().length, 2);

    H.changeFilters("", "", 5, 5, 5, "2021-01-01", "2021-12-31");
    // Nenhuma conferência esperada
    expect(H.showConfs().length, 0);

    H.resetFilters();
    // Todas as 3 conferências esperadas
    expect(H.showConfs().length, 3);
  });
}