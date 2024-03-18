let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = Array(repeating: 0, count: n)
var count = input[0]
var index = 0
var ans = "1 "
arr[0] = 1
while arr.contains(0) {
    while count != 0 {
        if count < 0 {
            if index > 0 {
                index -= 1
            } else if index == 0 {
                index = n-1
            }
            if arr[index] == 0 {
                count += 1
                if count == 0 {
                    arr[index] = 1
                    ans += "\(index+1) "
                    count = input[index]
                    break
                }
            }
            
        } else {
            if index < n-1 {
                index += 1
            } else if index == n-1{
                index = 0
            }
            if arr[index] == 0 {
                count -= 1
                if count == 0 {
                    arr[index] = 1
                    ans += "\(index+1) "
                    count = input[index]
                    break
                }
            }
        }
    }
}
ans.removeLast()
print(ans)