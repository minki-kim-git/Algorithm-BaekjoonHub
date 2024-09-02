var rgb = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = 0
let minnum = rgb.min()!

for i in 0..<rgb.count {
    rgb[i] -= minnum
    ans += rgb[i] / 3
    if rgb[i] == 0 { continue }
    if rgb[i] % 3 == 1 {
        rgb[i] = 1
    } else if rgb[i] % 3 == 2{
        rgb[i] = 0
        ans += 1
    } else {
        rgb[i] = 0
    }
}

if rgb.filter({ $0 == 1 }).count >= 1 { ans += 1}
ans += minnum

print(ans)