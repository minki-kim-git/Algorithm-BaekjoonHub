let testCase = Int(readLine()!)!
for _ in 0..<testCase {
    var dequeueDic = [[Int:Int]]()
    var enqueueDic = [[Int:Int]]()
    var index = 0
    var ans = 0
    let n = readLine()!.split(separator: " ").map{Int(String($0))!}
    let _ = readLine()!.split(separator: " ").map{
        enqueueDic.append([Int(String($0))!:index])
        index += 1
    }
    enqueueDic = enqueueDic.reversed()
    var maxNum = enqueueDic.max { $0.first!.key < $1.first!.key }!.first!.key
    while true {
        if enqueueDic.last!.first!.key == maxNum {
            if enqueueDic.last!.first!.value == n[1] {
                ans += 1
                break
            }
            enqueueDic.removeLast()
            maxNum = max(enqueueDic.max { $0.first!.key < $1.first!.key }?.first?.key ?? 0, dequeueDic.max { $0.first!.key < $1.first!.key }?.first?.key ?? 0)
            
            ans += 1
        } else {
            dequeueDic.append(enqueueDic.popLast()!)
        }
        if enqueueDic.isEmpty {
            enqueueDic = dequeueDic.reversed()
            dequeueDic.removeAll()
            maxNum = enqueueDic.max { $0.first!.key < $1.first!.key }!.first!.key
        }
    }
    print(ans)
}