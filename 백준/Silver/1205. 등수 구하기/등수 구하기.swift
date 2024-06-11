let n = readLine()!.split(separator: " ").map{Int(String($0))!}
if n[0] == 0 {
    print(1)
} else {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var rank = (-1,-1)
    var stack = [Int]()
    for i in 0..<n[2] {
        if i == input.count { break }
        if n[1] > input[i] {
            break
        } else {
            stack.append(input[i])
        }
        if rank.0 != input[i] {
            rank.0 = input[i]
            rank.1 = stack.count
        }
        if stack.count >= n[2] {
            break
        }
    }
    if stack.count < n[2] {
        if !stack.isEmpty {
            if stack.last! == n[1] {
                print(rank.1)
            } else {
                print(stack.count+1)
            }
        } else {
            print(1)
        }
    } else {
        print(-1)
    }
}