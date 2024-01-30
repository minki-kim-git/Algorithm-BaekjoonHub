let n = Int(readLine()!)!
var verticalarr = Array(repeating: Array(repeating: "", count: 0), count: n)
var horizontalCount = 0
var verticalCount = 0
for _ in 0..<n{
    let input = readLine()!.map{String($0)}
    var count = 0
    for i in 0..<n{
        verticalarr[i].append(input[i])
        if input[i] == "."{
            count += 1
        } else {
            if count >= 2{
                horizontalCount += 1
            }
            count = 0
        }
    }
    if count >= 2 {
        horizontalCount += 1
    }
}
for i in 0..<n{
    var count = 0
    for j in 0..<n{
        if verticalarr[i][j] == "."{
            count += 1
        } else {
            if count >= 2 {
                verticalCount += 1
            }
            count = 0
        }
    }
    if count >= 2 {
        verticalCount += 1
    }
}
print(horizontalCount,verticalCount)