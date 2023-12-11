func solution(_ n:Int64) -> Int {
    var ans = ""
    var arr = Array(repeating:0,count:10)
    for i in String(n).map{Int(String($0))!} {
        arr[i] += 1
    }
    
    for i in stride(from:9,through:0,by:-1){
        for _ in 0..<arr[i]{   
            ans += "\(i)"
        }
    }             
    return Int(ans)!
}