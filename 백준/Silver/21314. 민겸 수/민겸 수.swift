import Foundation
let input = readLine()!.map{String($0)}


func maxValue(_ str: [String]) -> String {
    var ans = ""
    var dic = ["M":0]
    
    for i in str {
        if i == "M" {
            dic["M"] = dic["M"]! + 1
        } else {
            ans += "5"
            for _ in 0..<dic["M"]! {
                ans += "0"
            }
            dic["M"] = 0
        }
    }
    
    for _ in 0..<dic["M"]! {
        ans += "1"
    }
    
    return ans
}

func minVale(_ str: [String]) -> String {
    var ans = ""
    var dic = ["M":0]
    
    for i in str {
        if i == "M" {
            dic["M"] = dic["M"]! + 1
        } else {
//
//                ans += "\(pow(10, dic["M"]! - 1))"
//            }
           
            if dic["M"] != 0 {
                ans += "1"
                for _ in 1..<dic["M"]! {
                    ans += "0"
                }
            }
            ans += "5"
            dic["M"] = 0
        }
    }
    
    if dic["M"] != 0 {
        ans += "1"
        for _ in 1..<dic["M"]! {
            ans += "0"
        }
//        ans += "\(pow(10, dic["M"]! - 1))"
    }
    
    return ans
}

print(maxValue(input))
print(minVale(input))