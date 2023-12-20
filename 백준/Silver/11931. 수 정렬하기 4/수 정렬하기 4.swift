let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n{
    let input = Int(readLine()!)!
    arr.append(input)
}
arr = arr.sorted(by: >)
let _ = arr.map{
    print($0)
}