let n = Int(readLine()!)!
var ans = 0
var st = 1
var sum = 0

if n > 2 {
    for i in 1...(n/2)+1 {
        var num = sum + i
        if num == n {
            ans += 1
        } else if num > n {
            while num > n {
                num -= st
                st += 1
            }
            if num == n {
                ans += 1
            }
        }
        sum = num
    }
    print(ans+1)
} else {
    print(1)
}