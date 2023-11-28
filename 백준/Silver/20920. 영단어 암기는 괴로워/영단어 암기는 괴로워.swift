let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: Array(repeating: "", count: 0), count: 0)
var temparr = Array(repeating: Array(repeating: "", count: 0), count: 11)
var dic = [String:Int]()
for _ in 0..<n[0]{
    let input = readLine()!
    let count = input.count
    guard count >= n[1] else { continue }
    if let val = dic[input] {
        dic[input] = val + 1
    } else {
        dic[input] = 1
    }
}
var sortdic = dic.sorted {
    $0.value > $1.value
}
var index = sortdic.first!.value

for i in sortdic{
    if i.value == index {
        temparr[i.key.count].append(i.key)
    } else {
        for k in stride(from: 10, through: 0, by: -1){
              let ans = temparr[k].sorted()
              let _ = ans.map {
                  print($0)
              }
          }
        index = i.value
        temparr = Array(repeating: Array(repeating: "", count: 0), count: 11)
        temparr[i.key.count].append(i.key)
    }
}
if !temparr.isEmpty{
    for k in stride(from: 10, through: 0, by: -1){
          let ans = temparr[k].sorted()
          let _ = ans.map {
              print($0)
          }
      }
}