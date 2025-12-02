import gleam/float
import gleam/int
import gleam/list
import gleam/result
import gleam/string
import gleam_community/maths
import simplifile

type Range(kind) {
  Range(min: kind, max: kind)
}

pub fn solve(input_path: String) -> #(Int, Int) {
  let assert Ok(content) = simplifile.read(from: input_path)
  content
  |> string.split(",")
  |> list.map(parse_range)
  |> list.fold(#(0, 0), fn(acc, range) {
    list.range(
      range.min |> int.parse() |> result.unwrap(0),
      range.max |> int.parse() |> result.unwrap(0),
    )
    |> list.filter(fn(x) {
      x
      |> int.to_float()
      |> maths.logarithm_10()
      |> result.unwrap(1.0)
      |> float.truncate()
      |> int.is_even()
    })
    #(acc.0, acc.1)
  })
}

fn parse_range(range: String) -> Range(String) {
  let parts = string.split(range, "-")
  let part0 =
    parts
    |> list.first()
    |> result.unwrap("0")
  let part1 =
    parts
    |> list.last()
    |> result.unwrap("0")
  Range(part0, part1)
}
