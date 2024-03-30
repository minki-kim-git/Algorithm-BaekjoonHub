import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var count = 0
    var arr = [Int]()
    for i in ingredient {
        arr.append(i)
        if arr.count >= 4 && arr[arr.count - 4] == 1 && arr[arr.count - 3] == 2 && arr[arr.count - 2] == 3 &&  arr[arr.count - 1] == 1 {
            count += 1
            arr.removeLast(4)
        }
    }
    return count
}
