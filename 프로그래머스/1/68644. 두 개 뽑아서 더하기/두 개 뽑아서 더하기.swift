import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var arr = [Int]()
    var set = Set<Int>()
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            set.insert(numbers[i]+numbers[j])
        }
    }
    arr = Array(set)
    return arr.sorted()
}