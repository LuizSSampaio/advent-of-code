import day1
import day2
import gleam/int
import gleam/io

pub fn main() -> Nil {
  let d1_res = day1.solve("res/day1.txt")
  io.println(
    "Day 1: " <> int.to_string(d1_res.0) <> " | " <> int.to_string(d1_res.1),
  )

  let d2_res = day2.solve("res/day2.txt")
  io.println(
    "Day 2: " <> int.to_string(d2_res.0) <> " | " <> int.to_string(d2_res.1),
  )
}
