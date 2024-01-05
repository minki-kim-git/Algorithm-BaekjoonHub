let n = Int(readLine()!)!
for _ in 0..<n{
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    input = input.sorted().reversed()
    print(input[2])
}
