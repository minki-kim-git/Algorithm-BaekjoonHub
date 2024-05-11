import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var count = 0
    var zcount = 0
    let arr = [6,6,5,4,3,2,1]
    for i in 0..<lottos.count {
       if win_nums.contains(lottos[i]) {
           count += 1
        } 
        if lottos[i] == 0{
            zcount += 1
        }
    }
    return [arr[count+zcount],arr[count]]
}