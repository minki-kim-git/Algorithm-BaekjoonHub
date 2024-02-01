let n = Int(readLine()!)!
var arr = [[String]]()
var count = 0
for _ in 0..<n{
    let input = readLine()!.map{String($0)}.sorted()
    if arr.firstIndex(of: input) == nil {
        arr.append(input)
        count += 1
    }
}
print(count)