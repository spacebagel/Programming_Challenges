import gleam/io
import gleam/int
import gleam/string
import gleam/dict
import gleam/list
import input

pub fn main() -> Nil {
  let safe_symbols: dict.Dict(Int, String) = dict.from_list([
    #(0, "!"),
    #(1, "@"),
    #(2, "#"),
    #(3, "$"),
    #(4, "%"),
    #(5, "^"),
    #(6, "&"),
    #(7, "*"),
    #(8, "_"),
    #(9, "-"),
    #(10, "+"),
    #(11, "="),
  ])

let danger_symbols: dict.Dict(Int, String) = dict.from_list([
    #(0, "("),
    #(1, ")"),
    #(2, "["),
    #(3, "]"),
    #(4, "{"),
    #(5, "}"),
    #(6, "<"),
    #(7, ">"),
    #(8, "?"),
    #(9, "/"),
    #(10, "|"),
    #(11, "\\"),
    #(12, "~"),
    #(13, "`"),
    #(14, "."),
    #(15, ","),
    #(16, ":"),
    #(17, ";"),
    #(18, "'"),
    #(19, "\""),
 ])
  
  let assert Ok(password_length_input) = input.input("Password length: ")
  let assert Ok(password_length) = int.parse(password_length_input)

  let assert Ok(use_digits) = input.input("Use digits? Yes (Y/y), No (N/n): ")
  let assert Ok(use_low_letters) = input.input("Use a-z latters? Yes (Y/y), No (N/n): ")
  let assert Ok(use_up_letters) = input.input("Use A-Z latters? Yes (Y/y), No (N/n): ")
  let assert Ok(use_safe_symbols) = input.input("Use !@#$%^&*_-+=? Yes (Y/y), No (N/n): ")
  let assert Ok(use_danger_symbols) = input.input("Use other symbols? Yes (Y/y), No (N/n): ")
  
  let result_rule = use_digits <> use_low_letters <> use_up_letters <> use_safe_symbols <> use_danger_symbols
  let low_result_rule = string.lowercase(result_rule)

  let collection_list: dict.Dict(Int, Int) = case low_result_rule {
    "yyyyy" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 2), #(3, 3), #(4, 4)
    ])
    "yyyyn" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 2), #(3, 3)
    ])
    "yyyny" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 2), #(3, 4),
    ])
    "yyynn" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 2),
    ])
    "yynyy" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 3), #(3, 4),
    ])
    "yynyn" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 3),
    ])
    "yynny" -> dict.from_list([
      #(0, 0), #(1, 1), #(2, 4),
    ])
    "yynnn" -> dict.from_list([
      #(0, 0), #(1, 1),
    ])
    "ynyyy" -> dict.from_list([
      #(0, 0), #(1, 2), #(2, 3), #(3, 4),
    ])
    "ynyyn" -> dict.from_list([
      #(0, 0), #(1, 2), #(2, 3),
    ])
    "ynyny" -> dict.from_list([
      #(0, 0), #(1, 2), #(2, 4),
    ])
    "ynynn" -> dict.from_list([
      #(0, 0), #(1, 2),
    ])
    "ynnyy" -> dict.from_list([
      #(0, 0), #(1, 3), #(2, 4),
    ])
    "ynnyn" -> dict.from_list([
      #(0, 0), #(1, 3),
    ])
    "ynnny" -> dict.from_list([
      #(0, 0), #(1, 4),
    ])
    "ynnnn" -> dict.from_list([
      #(0, 0),
    ])
    "nyyyy" -> dict.from_list([
      #(0, 1), #(1, 2), #(2, 3), #(3, 4),
    ])
    "nyyyn" -> dict.from_list([
      #(0, 1), #(1, 2), #(2, 3),
    ])
    "nyynn" -> dict.from_list([
      #(0, 1), #(1, 2),
    ])
    "nynyy" -> dict.from_list([
      #(0, 1), #(1, 3), #(2, 4),
    ])
    "nynyn" -> dict.from_list([
      #(0, 1), #(1, 3),
    ])
    "nynny" -> dict.from_list([
      #(0, 1), #(1, 4),
    ])
    "nynnn" -> dict.from_list([
      #(0, 1),
    ])
    "nnyyy" -> dict.from_list([
      #(0, 2), #(1, 3), #(2, 4),
    ])
    "nnyny" -> dict.from_list([
      #(0, 2), #(1, 4),
    ])
    "nnynn" -> dict.from_list([
      #(0, 2),
    ])
    "nnnyy" -> dict.from_list([
      #(0, 3), #(1, 4)
    ])
    "nnnyn" -> dict.from_list([
      #(0, 3),
    ])
    "nnnny" -> dict.from_list([
      #(0, 4),
    ])
    _ -> dict.from_list([
      #(0, -1),
    ])
  }
 
  let password = list.range(1, password_length)
  |> list.map(fn(_) {
    let assert Ok(symbol_collection) = dict.get(collection_list, int.random(dict.size(collection_list)))
    let result_symbol = case symbol_collection {
      0 -> {
        let assert Ok(codepoint) = string.utf_codepoint(48 + int.random(58-48))
        string.from_utf_codepoints([codepoint])
      }
      1 -> {
        let assert Ok(codepoint) = string.utf_codepoint(97 + int.random(123-97))
        string.from_utf_codepoints([codepoint])
      }
      2 -> {
        let assert Ok(codepoint) = string.utf_codepoint(65 + int.random(91-65))
        string.from_utf_codepoints([codepoint])
      }
      3 -> {
        let assert Ok(symbol) = dict.get(safe_symbols, int.random(dict.size(safe_symbols)))
        symbol
      }
      4 -> {
        let assert Ok(symbol) = dict.get(danger_symbols, int.random(dict.size(danger_symbols)))
        symbol
      }
        _ -> "ERROR"
    }
        result_symbol
  }) |> string.join("")
  io.println("========")
  io.println("Generated password: " <> password)
}
