import Foundation

func solution(_ s:String) -> [Int] {
    var n = s
    var count = 0
    var zerocount = 0
    while n.count > 1{
        zerocount += n.filter {
            $0 == "0"
        }.count
        n.removeAll {
            $0 == "0"
        }
        var num = n.count
        var binary = ""
        while num > 0 {
            if num % 2 == 0 {
                binary += "0"
                num /= 2
            } else {
                binary += "1"
                num /= 2
            }
        }
        n = String(binary.reversed())
        count += 1
    }
    return [count, zerocount]
}
