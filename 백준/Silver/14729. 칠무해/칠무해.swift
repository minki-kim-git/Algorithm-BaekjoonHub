import Foundation
let n = Int(readLine()!)!
var arr = [Double]()
for _ in 0..<n{
    let input = Double(readLine()!)!
    arr.append(input)
}
let filter = arr.sorted()
for i in 0...6{
    print(String(format: "%.3f", filter[i]))
}