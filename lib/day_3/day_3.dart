import 'package:advent_of_code_2022/data.dart';

class Day3 {
  static void solve() {
    print("--- Day 3: Rucksack Reorganization ---");
    List<String> rucksackReorganization =
        PrepareData.getData(path: "lib/day_3/day_3.txt", pattern: "\n");

    part1(rucksackReorganization);
    part2(rucksackReorganization);
  }

  static List<String> get alphabetsUpperCase {
    List<String> result = [];
    for (int i = 65; i <= 90; i++) {
      result.add(String.fromCharCode(i));
    }
    return result;
  }

  static void part1(List<String> rucksackReorganization) {
    print("Part 1:");
    int sum = 0;
    for (String id in rucksackReorganization) {
      String part1 = id.substring(0, id.length ~/ 2);
      String part2 = id.substring(id.length ~/ 2);
      List<String> result = part1.split("");
      result.removeWhere((e) => !part2.contains(e));
      sum += calculateScore(result);
    }
    print("the sum of the priorities of those item types : $sum");
  }

  static int calculateScore(List<String> result) {
    String comparLetter = result.toSet().first;
    if (alphabetsUpperCase.contains(comparLetter)) {
      return alphabetsUpperCase.indexOf(comparLetter) +
          alphabetsUpperCase.length +
          1;
    } else {
      return (alphabetsUpperCase.indexOf(comparLetter.toUpperCase()) + 1);
    }
  }

  static part2(List<String> rucksackReorganization) {
    print("Part 2:");
    int sum = 0;
    List<String> copy = List.from(rucksackReorganization);
    for (var i = 0; i < rucksackReorganization.length / 3; i++) {
      List<String> group = copy.sublist(0, 3);
      List<String> splitId = group.last.split("");
      for (String id in group.sublist(0, 2)) {
        splitId.removeWhere((e) => !id.contains(e));
      }
      sum += calculateScore(splitId);
      copy.removeRange(0, 3);
    }
    print("the sum of the priorities of those item types : $sum");
  }
}
