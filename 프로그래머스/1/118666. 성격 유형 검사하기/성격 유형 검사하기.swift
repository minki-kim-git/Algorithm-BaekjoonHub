import Foundation

func calculateScore( _ str: [String], _ num: [Int]) -> String {
    if num[0] >= num[1] {
        return str[0]
    }
    return str[1]
}
func solution(_ survey:[String], _ choices:[Int]) -> String {
    var score = [0,3,2,1,0,1,2,3]
    var dic = ["R":0,"T":0,"C":0,"F":0,"J":0,"M":0,"A":0,"N":0]
    var ans = ""
    for i in 0..<survey.count {
        let str = survey[i].map{String($0)}
        if choices[i] < 4 {
            if let val = dic[str[0]] {
                dic[str[0]] = score[choices[i]] + val
            }
        } else {
            if let val = dic[str[1]] {
                dic[str[1]] = score[choices[i]] + val
            }
        }
    }
    ans += calculateScore(["R","T"] ,[dic["R"]!,dic["T"]!] )
    ans += calculateScore(["C","F"] ,[dic["C"]!,dic["F"]!] )
    ans += calculateScore(["J","M"] ,[dic["J"]!,dic["M"]!] )
    ans += calculateScore(["A","N"] ,[dic["A"]!,dic["N"]!] )
    return ans
}