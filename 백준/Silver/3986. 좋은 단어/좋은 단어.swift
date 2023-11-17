let n = Int(readLine()!)!
var count = 0

for _ in 0..<n {
    let input = readLine()!.map{String($0)}
    var arr = [String]()
    
    for i in 0..<input.count{
        if arr.isEmpty{
            arr.append(input[i])
        } else {
            if arr.last == input[i] {
                arr.removeLast()
            } else {
                arr.append(input[i])
            }
        }
    }
    if arr.isEmpty{
        count += 1
    }
}
print(count)