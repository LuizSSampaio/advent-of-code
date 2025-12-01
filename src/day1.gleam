import simplifile

/// Must receive an file containing dial move instructions and return the number of times that the dial reached 0
pub fn solve() -> Int {
  let assert Ok(content) = simplifile.read(from: "res/day1.txt")

  0
}

fn wrap(n: Int) -> Int {
  let reminder = n % 100
  case reminder < 0 {
    True -> reminder + 100
    False -> reminder
  }
}
