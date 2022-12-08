import 'package:advent_of_code_2022/data.dart';

class Day6 {
  static void solve() {
    print("--- Day 6: Tuning Trouble ---");
    List<String> message =
        PrepareData.getData(path: "lib/day_6/day_6.txt", pattern: "");
    part1(message);
    part2(message);
  }

  static int markerLen = 4;
  static int messageLen = 14;

  static void part1(List<String> message) {
    print("Part 1:");
    int result = getMarkerIndex(message, markerLen);
    print(
        "The characters need to be processed before the first start-of-packet marker is detected : $result");
  }

  static int getMarkerIndex(List<String> message, int key) {
    for (int i = 0; i < message.length - key; i++) {
      List<String> checkPart = message.sublist(i, key + i);
      bool isMarker = markerChecker(checkPart, key);
      if (isMarker) {
        return key + i;
      }
    }
    return 0;
  }

  static bool markerChecker(List<String> messagePart, int key) =>
      messagePart.toSet().length == key;

  static void part2(List<String> message) {
    print("Part 2:");
    int result = getMarkerIndex(message, messageLen);
    print(
        "The characters need to be processed before the first start-of-message marker is detected : $result");
  }
}
