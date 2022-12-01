import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';

class Day1 {
  static List get caloriesForEveryElf {
    File file = File("lib/day_1/day_1.txt");
    String caloriesData = file.readAsStringSync();
    List caloriesForEveryElf = caloriesData.split("\n\n");
    return caloriesForEveryElf;
  }

  static void solve() {
    List<int> sumCaloriesForEveryElf = caloriesForEveryElf.map<int>((calories) {
      List<int> caloriesOfElf =
          calories.split("\n").map<int>((e) => int.parse(e.trim())).toList();
      return caloriesOfElf.sum;
    }).toList();
    part1(sumCaloriesForEveryElf);
    part2(sumCaloriesForEveryElf);
  }

  static void part1(List<int> sumCaloriesForEveryElf) {
    int mostCalories = sumCaloriesForEveryElf
        .reduce((current, next) => current > next ? current : next);
    int elfHaveMostCalories = sumCaloriesForEveryElf.indexOf(mostCalories) + 1;
    log("Part1:\nElf $elfHaveMostCalories have most Calories : $mostCalories");
  }

  static part2(List<int> sumCaloriesForEveryElf) {
    log("Part2:");
    int totalTopThreeElves = 0;
    for (var i = 0; i < 3; i++) {
      int mostCalories = sumCaloriesForEveryElf
          .reduce((current, next) => current > next ? current : next);
      int elfHaveMostCalories =
          sumCaloriesForEveryElf.indexOf(mostCalories) + 1;
      sumCaloriesForEveryElf.remove(mostCalories);
      log("Elf $elfHaveMostCalories have most Calories : $mostCalories");
      totalTopThreeElves += mostCalories;
    }
    log("Total of Top Three Elves : $totalTopThreeElves");
  }
}
