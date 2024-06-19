let n = Int(readLine()!)!
let m = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
var set = Set<Int>()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[input[0]].append(input[1])
    arr[input[1]].append(input[0])
}

for i in arr[1] {
    set.insert(i)
    for j in arr[i] {
        set.insert(j)
    }
}

set.count > 0 ? print(set.count-1) : print(0)