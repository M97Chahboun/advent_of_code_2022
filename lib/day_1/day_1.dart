import 'package:advent_of_code_2022/data.dart';
import 'package:collection/collection.dart';

class Day1 {
  static void solve() {
    print("--- Day 1: Calorie Counting ---");
    List<dynamic> caloriesForEveryElf =
        PrepareData.getData(path: "lib/day_1/day_1.txt", pattern: "\n\n");
    List<int> sumCaloriesForEveryElf = caloriesForEveryElf.map<int>((calories) {
      List<int> caloriesOfElf =
          calories.split("\n").map<int>((e) => int.parse(e.trim())).toList();
      return caloriesOfElf.sum;
    }).toList();
    part1(sumCaloriesForEveryElf);
    part2(sumCaloriesForEveryElf);
  }

  static void part1(List<int> sumCaloriesForEveryElf) {
    print("Part 1:");
    int mostCalories = sumCaloriesForEveryElf
        .reduce((current, next) => current > next ? current : next);
    int elfHaveMostCalories = sumCaloriesForEveryElf.indexOf(mostCalories) + 1;
    print("Elf $elfHaveMostCalories have most Calories : $mostCalories");
  }

  static part2(List<int> sumCaloriesForEveryElf) {
    print("Part 2:");
    int totalTopThreeElves = 0;
    for (var i = 0; i < 3; i++) {
      int mostCalories = sumCaloriesForEveryElf
          .reduce((current, next) => current > next ? current : next);
      int elfHaveMostCalories =
          sumCaloriesForEveryElf.indexOf(mostCalories) + 1;
      sumCaloriesForEveryElf.remove(mostCalories);
      print("Elf $elfHaveMostCalories have most Calories : $mostCalories");
      totalTopThreeElves += mostCalories;
    }
    print("Total of Top Three Elves : $totalTopThreeElves");
  }
}
