import Foundation
let digit: Double = pow(10, 4)
var dic = [String:Int]()
var count = 0
while let input = readLine(){
    if let val = dic[input]{
        dic[input] = val + 1
    } else {
        dic[input] = 1
    }
    count += 1
}
for i in dic.sorted(by: { $0.key < $1.key }){
    print(i.key,String(format: "%.4f", round(Double(i.value) / Double(count) * 100 * digit) / digit))
}