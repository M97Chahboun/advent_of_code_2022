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
      String comparLetter = result.toSet().first;
      if (alphabetsUpperCase.contains(comparLetter)) {
        sum += alphabetsUpperCase.indexOf(comparLetter) +
            alphabetsUpperCase.length +
            1;
      } else {
        sum += (alphabetsUpperCase.indexOf(comparLetter.toUpperCase()) + 1);
      }
    }
    print("the sum of the priorities of those item types : $sum");
  }

  static part2(List<String> rucksackReorganization) {
    print("Part 2:");
  }
}
