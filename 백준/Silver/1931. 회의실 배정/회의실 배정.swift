import Foundation
var room = Array(repeating:Array(repeating:0,count:0),count:8388608)
var a = -1
var count = 0
for _ in 1...Int(readLine()!)!{
    let input = readLine()!.split(separator:" ").map{Int(String($0))!}
    room[input[1]].append(input[0]) //끝 시간을 기준으로 비교
}
for i in 0...8388607{
    room[i].sort()
    if !room[i].isEmpty{
        if a == -1 {
            a = i
            count += 1
        }
        
        else if a <= room[i][0] {
            a = i
            count += 1
        }
        
        //똑같은 경우 처리
        if room[i].count >= 2{
            for k in 1..<room[i].count{
                if a <= room[i][k] {
                    a = i
                    count += 1
                }
            }
        }
    }
}
print(count)