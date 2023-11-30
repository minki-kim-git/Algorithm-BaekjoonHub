let n = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let sort = input.sorted(by: >)
print(sort[n[1]-1])