import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var x = Array(repeating:0,count:10)
    var y = Array(repeating:0,count:10)
    X.map{ x[Int(String($0))!] += 1 } 
    Y.map{ y[Int(String($0))!] += 1 }
    var ans = ""
    for i in stride(from:9,through:0,by:-1){
        var index = min(x[i],y[i])
        if i == 0 && ans == "" && index != 0 {
            ans = "0"
        } else {
        for j in 0..<index{
            ans += String(i)
        }
    }
    }

    return ans == "" ? "-1" : ans
}