//: [Previous](@previous)

import Foundation

func readInput() -> String? {
    let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
    let content = try? String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
    guard var input = content else { return nil }
    input.removeLast()
    return input
}

func processInput1(_ input: String) {
    let inputArr = input.components(separatedBy: "\n")
    var twoCount = 0
    var threeCount = 0
    inputArr.forEach {
        var letterCount = [Character: Int]()
        $0.forEach {  letterCount[$0, default: 0] += 1 }
        if (letterCount.filter { $0.value == 2 }).count > 0 { twoCount += 1 }
        if (letterCount.filter { $0.value == 3 }).count > 0 { threeCount += 1 }
    }
    print(twoCount * threeCount)
}

func processInput2(_ input: String) {
    let inputArr = input.components(separatedBy: "\n")
    for i in 0..<inputArr.count {
        for j in i + 1..<inputArr.count {
            if (zip(inputArr[i], inputArr[j]).filter{ $0 != $1 }).count == 1 {
                print("\(inputArr[i]) : \(inputArr[j])")
                print(zip(inputArr[i], inputArr[j])
                    .filter{ $0 == $1 }
                    .map { String($0.0) }
                    .joined())
                return
            }
        }
    }
}

if let input = readInput() {
    processInput2(input)
}
