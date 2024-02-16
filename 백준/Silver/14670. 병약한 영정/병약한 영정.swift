let n = Int(readLine()!)!
var dic = [String:String]()
for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{String($0)}
    dic[input[0]] = input[1]
}
let r = Int(readLine()!)!
for _ in 0..<r{
    let input = readLine()!.split(separator: " ").map{String($0)}
    var ans = ""
    for i in 0..<Int(input[0])! {
        guard let val = dic[input[i+1]] else {
            ans = ""
            break
        }
        if i+1 == Int(input[0])! {
            ans += "\(val)"
        } else {
            ans += "\(val) "
        }
    }
    if ans == "" {
        print("YOU DIED")
    } else {
        print(ans)
    }
}