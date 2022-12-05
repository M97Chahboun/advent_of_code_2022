import 'package:advent_of_code_2022/data.dart';

class Day4 {
  static void solve() {
    print("--- Day 4: Camp Cleanup ---");
    List<String> assignments =
        PrepareData.getData(path: "lib/day_4/day_4.txt", pattern: "\n");
        
    part1(assignments);
  }

  static void part1(List<String> assignments) {
    print("Part 1:");
    int sum = 0;
    for (var assignment in assignments) {
      List<String> pairs = assignment.split(",");
      if (isContained(pairs[0], pairs[1]) || isContained(pairs[1], pairs[0])) {
        sum += 1;
      }
    }
    print("assignment pairs does one range fully contain the other : $sum");
  }

  static bool isContained(String pairS1, String pairS2) {
    List<int> pair1 = pairS1.split("-").map(int.parse).toList();
    List<int> pair2 = pairS2.split("-").map(int.parse).toList();
    return pair1[0] >= pair2[0] && pair1[1] <= pair2[1];
  }
}

// 487
// 849