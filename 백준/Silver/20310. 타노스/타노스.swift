let s = readLine()!.map{String($0)}

var onecount = s.filter{$0 == "1"}.count / 2
var zerocount = (s.count - (onecount * 2)) / 2
var ans = ""

for i in s {
    if i == "1" && onecount >= 1 {
        onecount -= 1
    } else {
        ans += i
    }
}

var str = String(ans.reversed())
ans = ""

for i in str {
    if i == "0" && zerocount >= 1 {
        zerocount -= 1
    } else {
        ans += String(i)
    }
}

print(String(ans.reversed()))