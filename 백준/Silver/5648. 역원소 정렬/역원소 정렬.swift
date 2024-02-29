var arr = [Int]()
var n = readLine()!.split(separator:" ")
n.removeFirst()
_ = n.map {
    arr.append(Int(String(Array($0.reversed())))!)
}
while let input = readLine() {
    var num = input.split(separator:" ")
    _ = num.map {
        arr.append(Int(String(Array($0.reversed())))!)
    }
}
_ = arr.sorted().map{
    print($0)
}