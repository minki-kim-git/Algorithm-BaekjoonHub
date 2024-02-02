import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var countDictionary = [Int: Int]()
    for number in tangerine {
        if let count = countDictionary[number] {
            countDictionary[number] = count + 1
        } else {
            countDictionary[number] = 1
        }
    }
    var count = 0
    var ans = 0
    for i in countDictionary.sorted { $0.value > $1.value } {
        count += i.value
        ans += 1
        if count >= k {
            break
        }
    }
    return ans
}