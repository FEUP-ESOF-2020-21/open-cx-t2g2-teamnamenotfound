import 'package:flutter_test/flutter_test.dart';
import 'package:safe_meetings/objects/conference.dart';

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
  });
}