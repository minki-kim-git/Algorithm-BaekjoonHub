import Foundation

func solution(_ dirs:String) -> Int {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var coordinate = (0,0)
    var dic = [String:Bool]()
    var ans = 0
    for i in dirs{
        var nx = 0
        var ny = 0
        switch i {
        case "U":
            nx = dx[0] + coordinate.0
            ny = dy[0] + coordinate.1
        case "D":
            nx = dx[1] + coordinate.0
            ny = dy[1] + coordinate.1
        case "R":
            nx = dx[2] + coordinate.0
            ny = dy[2] + coordinate.1
        case "L":
            nx = dx[3] + coordinate.0
            ny = dy[3] + coordinate.1
        default: break
        }
        if nx < -5 || ny < -5 || nx > 5 || ny > 5 { continue
        }
        if dic["\([coordinate,(nx,ny)].sorted(by: >))"] == nil {
            dic["\([coordinate,(nx,ny)].sorted(by: >))"] = true
            ans += 1
        }
        coordinate = (nx,ny)
    }
    return ans
}