import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stack = [Int]()
    var ans = 0
    var board = board
    for i in moves {
        for j in 0..<board.count {
            if board[j][i-1] == 0 { continue }
            if stack.last ?? 0 == board[j][i-1] {
                stack.removeLast()
                ans += 2
            } else {
                stack.append(board[j][i-1])
            }
            board[j][i-1] = 0
            break
        }
    }
    return ans
}
