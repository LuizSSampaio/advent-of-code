import gleam/int
import gleam/list
import gleam/result
import gleam/string
import simplifile

type Range(kind) {
  Range(min: kind, max: kind)
}

pub fn part1(input_path: String) -> Int {
  solve(input_path, id_is_valid_pt1)
}

pub fn part2(input_path: String) -> Int {
  solve(input_path, id_is_valid_pt2)
}

fn solve(input_path: String, id_validator: fn(String) -> Bool) -> Int {
  let assert Ok(content) = simplifile.read(from: input_path)
  content
  |> string.split(",")
  |> list.map(parse_range)
  |> list.fold(0, fn(acc, range) {
    let invalid_sum =
      list.range(range.min, range.max)
      |> list.filter(fn(x) {
        x
        |> int.to_string()
        |> string.length()
        |> int.is_even()
      })
      |> list.fold(0, fn(sum, id) {
        case id |> int.to_string() |> id_validator() {
          True -> sum
          False -> sum + id
        }
      })
    acc + invalid_sum
  })
}

fn parse_range(range: String) -> Range(Int) {
  let parts = range |> string.trim() |> string.split("-")
  list.each(parts, string.trim)
  let part0 =
    parts
    |> list.first()
    |> result.unwrap("0")
    |> int.parse()
    |> result.unwrap(0)
  let part1 =
    parts
    |> list.last()
    |> result.unwrap("0")
    |> int.parse()
    |> result.unwrap(0)
  Range(part0, part1)
}

fn id_is_valid_pt1(id: String) -> Bool {
  let len = string.length(id)
  string.slice(id, 0, len / 2) != string.slice(id, len / 2, len)
}

fn id_is_valid_pt2(id: String) -> Bool {
  let len = string.length(id)
  string.slice(id, 0, len / 2) != string.slice(id, len / 2, len)
}
