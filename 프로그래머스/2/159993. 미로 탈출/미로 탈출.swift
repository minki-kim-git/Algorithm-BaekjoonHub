import Foundation

func bfs (queue: [(Int,Int)], endPoint: (Int,Int), arr: [[String]], vis: [[Int]]) -> Int? {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var index = 0
    var queue = queue
    var vis = vis
    while queue.count > index {
        for i in 0..<4 {
            let nx = dx[i] + queue[index].0
            let ny = dy[i] + queue[index].1
            if nx < 0 || ny < 0 || nx >= arr.count || ny >= arr[0].count { continue }
            if arr[nx][ny] == "X" || vis[nx][ny] != 0 { continue }
            vis[nx][ny] = vis[queue[index].0][queue[index].1] + 1
            queue.append((nx,ny))
            if (nx,ny) == endPoint {
                return vis[nx][ny]
            }
        }
        index += 1
    }
    return nil
}
func solution(_ maps:[String]) -> Int {
    var arr = Array(repeating: Array(repeating:"",count:maps[0].count),count:maps.count)
    var vis = Array(repeating: Array(repeating:0,count:maps[0].count),count:maps.count)
    var coordinate = Array(repeating:(0,0),count:3)
    for i in 0..<maps.count {
        let str = maps[i].map{String($0)}
        for j in 0..<maps[0].count {
            arr[i][j] = str[j]
            switch str[j] {
                case "S" :
                coordinate[0] = (i,j)
                case "L" :
                coordinate[1] = (i,j)
                case "E" :
                coordinate[2] = (i,j)
                default :
                break
            }
        }
    }
    
    if let L = bfs(queue: [coordinate[0]], endPoint: coordinate[1], arr: arr, vis: vis) {
        vis[coordinate[1].0][coordinate[1].1] = L
    } else {
         return -1
    }    
    if let E = bfs(queue: [coordinate[1]], endPoint: coordinate[2], arr: arr, vis: vis) {
        return E
    } else {
        return -1
    }
}