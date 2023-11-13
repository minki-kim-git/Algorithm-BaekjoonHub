import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var arr = [Int]()
    var ans = [Int]()
    var index = 0
    var count = 0
    
    for i in 0..<progresses.count {
        if (100 - progresses[i]) % speeds[i] == 0 {
            arr.append((100 - progresses[i]) / speeds[i])
        } else {
           arr.append((100 - progresses[i]) / speeds[i] + 1)
        }   
    }
    
    for i in arr{
       if index == 0 {
           index = i
       }
        if index >= i {
            count += 1
        } else {
            ans.append(count)
            count = 1
            index = i
        }
    }
    
    if count != 0 {
        ans.append(count)
    }
    return ans
}