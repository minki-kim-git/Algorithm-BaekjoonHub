import Foundation

let testCase = Int(readLine()!)!
for _ in 0..<testCase{
    var input = readLine()!.split(separator: " ")
    input[1].remove(at: input[1].index(input[1].startIndex, offsetBy: Int(input[0])!-1))
    print(input[1])
}