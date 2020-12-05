//: [Previous](@previous)

import Foundation

// Parsing funcs

func readInput() -> String? {
    let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
    let content = try? String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    guard var input = content else { return nil }
    input.removeLast()
    return input
}

func processInput1(_ input: String) {
  // 1-3 a: abcde
  var validCount = 0
  let inputArr = input.components(separatedBy: "\n").forEach {
    let updated = $0.replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: ":", with: "")
    let lineArr = updated.components(separatedBy: " ")
    let min = Int(lineArr[0])!
    let max = Int(lineArr[1])!
    let letter = lineArr[2]
    let pass = lineArr[3]
    var count = 0
    pass.forEach { if String($0) == letter { count += 1} }
    if count >= min && count <= max { validCount += 1 }
  }
  print(validCount)
}

if let input = readInput() {
    processInput1(input)
}
