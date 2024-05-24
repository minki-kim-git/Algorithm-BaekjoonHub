import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var vis = Array(repeating:0,count:y+1)
    var queue = [x]
    var index = 0
    guard x != y else { return 0 }
    while queue.count > index {
        for i in 0..<3 {
            var nx = 0
            switch i {
            case 0:
                nx = queue[index] * 3
            case 1:
                 nx = queue[index] * 2
            default:
                 nx = queue[index] + n
            }
            if nx > y || vis[nx] != 0 { continue }
            if nx == y { return vis[queue[index]] + 1 }
            vis[nx] = vis[queue[index]] + 1
            queue.append(nx)
        }
        index += 1
    }
    return -1
}