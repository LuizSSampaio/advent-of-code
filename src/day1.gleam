import gleam/int
import gleam/list
import gleam/result
import gleam/string
import simplifile

/// Must receive an file containing dial move instructions and return the number of times that the dial reached 0
pub fn solve(input_path: String) -> #(Int, Int) {
  let assert Ok(content) = simplifile.read(from: input_path)
  content
  |> string.split("\n")
  |> list.map(parse_intruction)
  |> solve_instructions(50)
}

fn solve_instructions(instructions: List(Int), start: Int) -> #(Int, Int) {
  let #(acc, counter2) = {
    let first = list.first(instructions) |> result.unwrap(0)
    #(wrap(start + first), pass_zero(start, first))
  }
  let counter1 = case acc {
    0 -> 1
    _ -> 0
  }

  case list.length(instructions) > 1 {
    True -> {
      let res = {
        instructions |> list.drop(1) |> solve_instructions(acc)
      }
      #(res.0 + counter1, res.1 + counter2)
    }
    False -> #(counter1, counter2)
  }
}

fn parse_intruction(instruction: String) -> Int {
  case instruction {
    "R" <> val -> int.parse(val) |> result.unwrap(0)
    "L" <> val -> -1 * { int.parse(val) |> result.unwrap(0) }
    _ -> 0
  }
}

fn wrap(n: Int) -> Int {
  let reminder = n % 100
  case reminder < 0 {
    True -> reminder + 100
    False -> reminder
  }
}

fn pass_zero(start: Int, rotation: Int) -> Int {
  let rotation_magnitude = { rotation / 100 } |> int.absolute_value()
  let rotation_reduced = rotation % 100

  case start + rotation_reduced {
    x if x <= 0 && start != 0 -> 1
    x if x >= 100 -> 1
    _ -> 0
  }
  + rotation_magnitude
}
