import gleam/int
import gleam/list
import gleam/order
import gleam/string
import utils/parse_utils

pub fn parse(input: String) -> List(String) {
  input |> parse_utils.lines()
}

pub fn pt_1(banks: List(String)) {
  use acc, bank <- list.fold(banks, 0)
  let batery_count = string.length(bank)
  let selection =
    string.to_graphemes(bank)
    |> list.map(parse_utils.unsafe_int_parse)
    |> list.fold(#(0, 0, 0), fn(selected, volts) {
      let #(batery1, batery2, pos) = selected
      case int.compare(volts, batery1), int.compare(volts, batery2) {
        order.Gt, _ if pos < batery_count - 1 -> #(volts, 0, pos + 1)
        _, order.Gt -> #(batery1, volts, pos + 1)
        _, _ -> #(batery1, batery2, pos + 1)
      }
    })
  int.multiply(selection.0, 10) |> int.add(selection.1) |> int.add(acc)
}

pub fn pt_2(banks: List(String)) {
  todo as "part 2 not implemented"
}
