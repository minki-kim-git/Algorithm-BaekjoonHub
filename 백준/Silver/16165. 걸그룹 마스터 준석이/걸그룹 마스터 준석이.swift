let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic = [String:[String]]()
for _ in 0..<n[0]{
    let input = readLine()!
    let num = Int(readLine()!)!
    var arr = [String]()
    for _ in 0..<num{
        let input = readLine()!
        arr.append(input)
    }
    dic[input] = arr.sorted()
}
for _ in 0..<n[1]{
    let quiz = readLine()!
    let num = Int(readLine()!)!
    switch num {
    case 0:
        _ = dic[quiz].map {
            $0.map {
                print($0)
            }
        }
    case 1:
        for i in dic{
            if i.value.contains(quiz){
                print(i.key)
            }
        }
    default:
        break
    }
}