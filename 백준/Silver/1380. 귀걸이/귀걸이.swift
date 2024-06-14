var count = 1
while let input = readLine(){
    guard input != "0" else { break }
    var name = [String]()
    var arr = Array(repeating: 0, count: Int(input)!)
    for _ in 0..<Int(input)! {
        name.append(readLine()!)
    }
    for _ in 0..<(2*Int(input)!)-1 {
        let num = readLine()!.split(separator: " ").map{String($0)}
        arr[Int(num[0])!-1] = arr[Int(num[0])!-1] + 1
    }
    for i in arr.enumerated() {
        if i.element == 1 {
            print(count,name[i.offset])
            break
        }
    }
    count += 1
}