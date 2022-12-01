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

  static solve() {
    List<int> sumCaloriesForEveryElf = caloriesForEveryElf.map<int>((calories) {
      List<int> caloriesOfElf =
          calories.split("\n").map<int>((e) => int.parse(e.trim())).toList();
      return caloriesOfElf.sum;
    }).toList();
    int mostCalories = sumCaloriesForEveryElf
        .reduce((current, next) => current > next ? current : next);
    int elfHaveMostCalories = sumCaloriesForEveryElf.indexOf(mostCalories) + 1;
    log("Elf $elfHaveMostCalories have most Calories : $mostCalories");
  }
}
