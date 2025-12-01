import day1
import gleam/int
import gleam/io

pub fn main() -> Nil {
  let d1_res = day1.solve("res/day1.txt")
  io.println(
    "Day 1: " <> int.to_string(d1_res.0) <> " | " <> int.to_string(d1_res.1),
  )
}
