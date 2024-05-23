import Foundation

func moveRobot(direction: Int, num: Int, park: [[String]], ans: [Int]) -> [Int] {
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var result = ans
    for _ in 0..<num {
        let nx = result[0]+dx[direction]
        let ny = result[1]+dy[direction]
        if nx >= park.count || ny >= park[0].count || nx < 0 || ny < 0 {
            return ans
        }
        if park[nx][ny] == "X" {
            return ans
        }
        result[0] = nx
        result[1] = ny
    }
    return result
}
func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var arr = Array(repeating: Array(repeating: "", count: 0), count: park.count)
    var ans = [0,0]
    for i in 0..<park.count {
        let str = park[i].map{String($0)}
        for j in 0..<str.count {
            arr[i].append(str[j])
            if str[j] == "S" {
                ans[0] = i
                ans[1] = j
            }
        }
    }
    for i in routes {
        let str = i.split(separator: " ").map{String($0)}
        switch str[0] {
        case "N" :
            ans = moveRobot(direction: 0, num: Int(str[1])!, park: arr, ans: ans)
        case "S" :
            ans = moveRobot(direction: 1, num: Int(str[1])!, park: arr, ans: ans)
        case "W" :
            ans = moveRobot(direction: 2, num: Int(str[1])!, park: arr, ans: ans)
        case "E" :
            ans = moveRobot(direction: 3, num: Int(str[1])!, park: arr, ans: ans)
        default :
            break
        }
    }
    return ans
}
