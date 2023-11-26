let n = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic = [String:Int]()
var arr = [String]()
for i in 1...n[0]{
    let input = readLine()!
    dic[input] = i
    arr.append(input)
}

for _ in 0..<n[1]{
    let input = readLine()!
    if let num = Int(input) {
        print(arr[num-1])
    } else {
        print(dic[input]!)
    }
}
