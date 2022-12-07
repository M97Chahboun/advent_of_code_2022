import 'package:advent_of_code_2022/data.dart';

class Day5 {
  static void solve() {
    print("--- Day 5: Supply Stacks ---");
    List<String> stacksAndSteps =
        PrepareData.getData(path: "lib/day_5/day_5.txt", pattern: "\n\n");
    List<String> stacks = stacksAndSteps.first.split("\n");
    List<String> steps = stacksAndSteps.last.split("\n");
    stacks.removeLast();
    part1(stacks, steps);
  }

  static void part1(List<String> stacks, List<String> steps) {
    print("Part 1:");
    Map<int, List<String>> cratesById =
        rearrangement(stacks, steps, isCrateMover9000: true);
    String result = prepareResult(cratesById);
    print("The crate ends up on top of each stack with CrateMover9000 $result");
  }

  static String prepareResult(Map<int, List<String>> cratesById) {
    String result = "";
    for (var key in cratesById.keys) {
      result += cratesById[key]!.first;
    }
    result = result.replaceAll("[", "");
    return result.replaceAll("]", "");
  }

  static Map<int, List<String>> rearrangement(
      List<String> stacks, List<String> steps,
      {required bool isCrateMover9000}) {
    Map<int, List<String>> cratesById = loadCratesById(stacks);
    for (var step in steps) {
      List<String> stepSplited = step.split(" ");
      int count = int.parse(stepSplited[1]);
      int from = int.parse(stepSplited[3]);
      int to = int.parse(stepSplited.last);
      List<String> crates = cratesById[from]!.take(count).toList();
      cratesById[from]!.removeRange(0, count);
      if (isCrateMover9000) {
        cratesById[to]!.insertAll(0, crates.reversed);
      } else {
        cratesById[to]!.insertAll(0, crates);
      }
    }
    return cratesById;
  }

  static Map<int, List<String>> loadCratesById(List<String> stacks) {
    Map<int, List<String>> result = {};
    List<List<String>> cratesListed = [];
    for (var stack in stacks) {
      List<String> crates = stack.split("    ");
      crates = crates.map((e) {
        if (e.isNotEmpty) {
          return e.split(" ").join(",");
        } else {
          return e;
        }
      }).toList();
      crates = crates.join(",").split(",");
      cratesListed.add(crates);
    }
    for (List<String> crates in cratesListed) {
      for (var i = 0; i < crates.length; i++) {
        result[i + 1] ??= [];
        if (crates[i].isNotEmpty) {
          result[i + 1]!.add(crates[i]);
        }
        if (crates.length == i) {
          result[i + 1] = result[i + 1]!.reversed.toList();
        }
      }
    }
    return result;
  }
}
