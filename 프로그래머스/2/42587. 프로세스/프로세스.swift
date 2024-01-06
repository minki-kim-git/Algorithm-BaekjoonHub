import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var arr = Array(0...priorities.count-1)
    var pri = priorities
    var max = pri.max()!
    var ans = 0
    while pri.count > 0 {
        if pri[0] == max {
            ans += 1
            pri.reverse()
            pri.removeLast()
            pri.reverse()
            if arr[0] == location {
                break
            }
            arr.reverse()
            arr.removeLast()
            arr.reverse()
            max = pri.max()!
        } else {
            let pritemp = pri[0]
            pri.reverse()
            pri.removeLast()
            pri.reverse()
            pri.append(pritemp)
            let arrtemp = arr[0]
            arr.reverse()
            arr.removeLast()
            arr.reverse()
            arr.append(arrtemp)
        }   
    }
    return ans
}

