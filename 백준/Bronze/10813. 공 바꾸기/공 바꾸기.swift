let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [Int]()
for i in 1...nm[0]{
    arr.append(i)
}
for _ in 0..<nm[1]{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.swapAt(input[0]-1, input[1]-1)
}
arr.map{print($0,terminator: " ")}
