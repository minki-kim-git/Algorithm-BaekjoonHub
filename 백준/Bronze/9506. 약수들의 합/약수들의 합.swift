import Foundation
while let input = readLine(){
    guard input != "-1" else { break }
    var arr = [Int]()
    for i in 1...Int(sqrt(Double(input)!)){
        if Int(input)! % i == 0 {
            arr.append(i)
            if i != Int(input)! / i {
                arr.append(Int(input)! / i)
            }
        }
    }
    if Int(input)! == arr.reduce(0,+) - Int(input)! {
        print("\(Int(input)!) =",terminator: "")
        arr = arr.sorted()
        arr.removeLast()
        for i in 0..<arr.count {
            if i < arr.count-1{
                print(" \(arr[i]) +",terminator: "")
            } else {
                print(" \(arr[i])")
            }
        }
    } else {
        print(Int(input)!,"is NOT perfect.")
    }
}