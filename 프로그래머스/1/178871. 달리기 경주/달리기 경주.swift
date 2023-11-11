import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var arr = players
    var dic = [String:Int]()
    for i in 0..<players.count {
      dic[players[i]] = i
    }
    for i in callings {
        let index = dic[i]!
        let temp = arr[index - 1]
        arr[index - 1] = i
        arr[index] = temp
        dic[temp] = index
        dic[i] = index - 1
    }
    return arr
}