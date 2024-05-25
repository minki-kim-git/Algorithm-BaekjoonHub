import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var ans = [50,50,0,0]
    for i in 0..<wallpaper.count {
        let str = wallpaper[i].map{String($0)}
        for j in 0..<str.count{
            if str[j] == "#" {
                ans[0] = min(ans[0],i)
                ans[1] = min(ans[1],j)
                ans[2] = max(ans[2],i+1)
                ans[3] = max(ans[3],j+1)
            } 
        }
    }
    return ans
}