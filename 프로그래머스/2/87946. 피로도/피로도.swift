import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var maxCount = 0
    var arr = [Int]()
    for i in 0..<dungeons.count{
        arr.append(i)
    }
    let per = permute(arr,arr.count)
    for i in per{
        var temp = k
        var tempCount = 0
        for j in i {
            if temp >= dungeons[j][0] {
                temp -= dungeons[j][1]
                tempCount += 1
                if maxCount < tempCount {
                    maxCount = tempCount
                }
            }
        }
    }
    return maxCount
}

func permute(_ nums: [Int], _ targetNum: Int) -> [[Int]] {
    var result = [[Int]]()
    var visited = [Bool](repeating: false, count: nums.count)
    
    func permutation(_ nowPermute: [Int]) {
        if nowPermute.count == targetNum {
            result.append(nowPermute)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == true {
                continue
            }
            else {
                visited[i] = true
                permutation(nowPermute + [nums[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    
    return result
}