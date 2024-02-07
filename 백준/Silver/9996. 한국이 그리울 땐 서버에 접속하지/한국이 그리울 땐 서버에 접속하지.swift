let n = Int(readLine()!)!
let pattern = readLine()!.split(separator: "*")
for _ in 0..<n{
    var input = readLine()!
    guard input.count > pattern[0].count && pattern[0] == input.prefix(pattern[0].count) else {
        print("NE")
        continue
    }
    input.removeFirst(pattern[0].count)
    guard input.count >= pattern[1].count && pattern[1] == input.suffix(pattern[1].count)else {
        print("NE")
        continue
    }
    print("DA")
}