import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var count = 0
    var inputp = p
    var p = p.map{String($0)}
    var t = t.map{String($0)}
    for i in 0..<t.count{
        if t.count - p.count >= i {
        var num = ""
        for j in i..<i+p.count{
            num += t[j]
        }
           if Int(num)! <= Int(inputp)! {
               count += 1
           }
        }
    }
    return count
}