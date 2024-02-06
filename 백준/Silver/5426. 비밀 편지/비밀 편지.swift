import Foundation
let n = Int(readLine()!)!
for _ in 0..<n{
    let input = readLine()!
    let num = Int(sqrt(Double(input.count)))
    var count = 0
    var index = 0
    var arr = Array(repeating: Array(repeating: "", count: 0), count: num)
    for i in input{
        count += 1
        arr[index].append(String(i))
        if count == num {
            count = 0
            index += 1
        }
    }
    index = num - 1
    for _ in 0..<num{
        for j in 0..<num{
            print(arr[j][index],terminator: "")
        }
        index -= 1
    }
    print()
}