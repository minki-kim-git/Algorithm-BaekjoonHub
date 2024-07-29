let t = Int(readLine()!)!
for _ in 0..<t {
    let n = readLine()!.split(separator: " ").map{Int(String($0))!}
    var arr = [Int]()
    for _ in 0..<n[1] {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr.append(input[0]*input[1])
    }
    arr = arr.sorted(by: >)
    var sum = 0
    var ans = 0
    for i in arr {
        sum += i
        ans += 1
        if sum >= n[0] {
            break
        }
    }
    print(ans)
}