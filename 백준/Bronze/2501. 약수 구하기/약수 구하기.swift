import Foundation
let input = readLine()!.split(separator: " " ).map{Int(String($0))!}
var arr = [Int]()
for i in 1...Int(sqrt(Double(input[0]))){
    if input[0] % i == 0 {
        arr.append(i)
        if i != input[0] / i {
            arr.append(input[0] / i)
        }
    }
}
arr = arr.sorted()
if arr.count < input[1] {
    print(0)
} else {
    print(arr[input[1]-1])
}