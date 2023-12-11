func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var ans = Array(repeating:Array(repeating:0,count:arr1[0].count),count:arr2.count)
    for i in 0..<arr1.count{
        for j in 0..<arr1[i].count{
            ans[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return ans
}