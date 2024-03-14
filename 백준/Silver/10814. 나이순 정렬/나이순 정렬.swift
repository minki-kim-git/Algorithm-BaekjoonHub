import Foundation
var name =  Array(repeating:Array(repeating:"",count:0), count: 201)
for _ in 0..<Int(readLine()!)!{
    let input = readLine()!.split(separator:" ").map{String($0)}
    name[Int(input[0])!].append(input[1])
}
for i in 1..<name.count{
    for j in 0..<name[i].count{
        if name[i][j] != ""{
            print(i,name[i][j])
        }
    }
}