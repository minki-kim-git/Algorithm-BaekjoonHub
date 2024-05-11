import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var count = 0
    var zcount = 0
    let arr = [0,6,5,4,3,2,1]
    for i in 0..<lottos.count {
       if win_nums.contains(lottos[i]) {
           count += 1
        } 
        if lottos[i] == 0{
            zcount += 1
        }
    }
    var good = arr[count+zcount]
     switch count+zcount{
        case 6:
        good = 1
        case 5:
         good = 2
        case 4:
         good = 3
        case 3:
         good = 4
        case 2:
         good = 5
        default:
         good = 6
    }
    var bad = arr[count]
    switch count{
        case 6:
        bad = 1
        case 5:
         bad = 2
        case 4:
         bad = 3
        case 3:
         bad = 4
        case 2:
         bad = 5
        default:
         bad = 6
    }
    return [good,bad]
}