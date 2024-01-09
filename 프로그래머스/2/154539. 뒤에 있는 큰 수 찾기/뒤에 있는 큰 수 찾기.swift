import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var ans = Array(repeating:-1,count:numbers.count)
    var arr = [[Int:Int]]()
    
    for i in 0..<numbers.count-1 {
        arr.append([i:numbers[i]])
        var index = arr.count-1
        while index >= 0 {
            if arr[index].values.first! < numbers[i+1]{
                ans[arr[index].keys.first!] = numbers[i+1]
                arr.removeLast()
            } else {
                break
            }
            index -= 1
        }
    }
    return ans
}