import Foundation

var input = Int(readLine()!)!
var sort = String(input).map{Int(String($0))!}
sort = (sort.sorted()).reversed()
for i in 0..<sort.count{
    print(sort[i],terminator: "")
}