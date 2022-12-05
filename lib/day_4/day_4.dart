import 'package:advent_of_code_2022/data.dart';

class Day4 {
  static void solve() {
    print("--- Day 4: Camp Cleanup ---");
    List<String> assignments =
        PrepareData.getData(path: "lib/day_4/day_4.txt", pattern: "\n");

    part1(assignments);
    part2(assignments);
  }

  static void part1(List<String> assignments) {
    print("Part 1:");
    int sum = 0;
    for (var assignment in assignments) {
      List<String> pairs = assignment.split(",");
      if (isContainedOrOverlap(pairs[0], pairs[1]) ||
          isContainedOrOverlap(pairs[1], pairs[0])) {
        sum += 1;
      }
    }
    print("assignment pairs does one range fully contain the other : $sum");
  }

  static bool isContainedOrOverlap(String pairS1, String pairS2,
      {bool isOverlap = false}) {
    List<int> pair1 = pairS1.split("-").map(int.parse).toList();
    List<int> pair2 = pairS2.split("-").map(int.parse).toList();
    if (isOverlap) {
      return !((pair1[1] < pair2[0]) || (pair1[0] > pair2[1]));
    }
    return pair1[0] >= pair2[0] && pair1[1] <= pair2[1];
  }

  static part2(List<String> assignments) {
    print("Part 2:");
    int sum = 0;
    for (var assignment in assignments) {
      List<String> pairs = assignment.split(",");
      if (isContainedOrOverlap(pairs[0], pairs[1], isOverlap: true) ||
          isContainedOrOverlap(pairs[1], pairs[0], isOverlap: true)) {
        sum += 1;
      }
    }
    print("assignment pairs do the ranges overlap : $sum");
  }
}

// 487
// 849