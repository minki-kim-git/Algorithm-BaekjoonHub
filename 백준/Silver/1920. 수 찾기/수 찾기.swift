var dic = [String:Bool]()
let _ = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map {
    dic[String($0)] = true
}
let _ = Int(readLine()!)!
let _ = readLine()!.split(separator: " ").map {
    if dic[String($0)] != nil {
        print(1)
    } else {
        print(0)
    }
}
