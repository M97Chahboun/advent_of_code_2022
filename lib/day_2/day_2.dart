import 'package:advent_of_code_2022/data.dart';

class Day2 {
  static void solve() {
    List<String> rockPaperScissors =
        PrepareData.getData(path: "lib/day_2/day_2.txt", pattern: "\n");
    part1(rockPaperScissors);
  }

  static List<String> wonCases = ["A Y", "B Z", "C X"];
  static Map<String, int> rockPaperScissorsScores = {"Y": 2, "X": 1, "Z": 3};
  static Map<String, String> here = {"A": "X", "B": "Y", "C": "Z"};
  static void part1(List<String> rockPaperScissors) {
    print("Part 1:");
    int score = 0;
    List<String> wonCases = ["A Y", "B Z", "C X"];
    int wasDraw = 3;
    int won = 6;
    for (String round in rockPaperScissors) {
      String opponent = round.split(" ")[0];
      String you = round.split(" ")[1];

      // Was draw
      if (here[opponent] == you) {
        score += wasDraw;
      }

      // You wan
      if (wonCases.contains(round)) {
        score += won;
      }

      // Points based on how you play
      score += rockPaperScissorsScores[you]!;
    }
    print("My total score : $score");
  }
}


// A X = Rock
// B Y = Paper
// C Z = Scissors

// Probabilities
// Paper vs Rock = Paper
// Rock vs Scissors = Rock
// Scissors vs Paper = Scissors

