let _ = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
print(Double((input.reduce(0, +) - input.max()!)) / 2.0 + Double(input.max()!))