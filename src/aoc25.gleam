import day1
import day2
import gleam/int
import gleam/io

pub fn main() -> Nil {
  let d1_res = day1.solve("res/day1.txt")
  io.println(
    "Day 1: " <> int.to_string(d1_res.0) <> " | " <> int.to_string(d1_res.1),
  )

  io.println("Day 2: ")
  io.println("Part 1: " <> day2.part1("res/day2.txt") |> int.to_string())
  io.println("Part 2: " <> day2.part2("res/day2.txt") |> int.to_string())
}
