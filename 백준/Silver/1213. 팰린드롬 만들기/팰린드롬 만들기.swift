var dic = [String:Int]()
let _ = readLine()!.map {
    if let val = dic[String($0)]{
        dic[String($0)] = 1 + val
    } else {
        dic[String($0)] = 1
    }
}
let filter = dic.filter{ $0.value % 2 == 1 }
if filter.count > 1 {
    print("I'm Sorry Hansoo")
} else {
    var front = ""
    var center = ""
    var back = ""
    if !filter.isEmpty{
        center = filter.first!.key
    }
    for i in dic.sorted(by: >) {
        for _ in 0..<i.value/2{
            front = "\(i.key)\(front)"
            back += i.key
        }
    }
    print("\(front)\(center)\(back)")
}