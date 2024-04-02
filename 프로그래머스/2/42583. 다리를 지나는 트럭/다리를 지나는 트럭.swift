import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var arr = [Int]()
    var ans = 0
    var w = 0
    for i in truck_weights {
        while true {
            if arr.count == bridge_length {
                w -= arr.first!
                arr.removeFirst()
            }
            if w + i <= weight {
                arr.append(i)
                w += i
                ans += 1
                break
            } else {
                arr.append(0)
                ans += 1
            }
        }
    }
    ans += bridge_length
    return ans
}