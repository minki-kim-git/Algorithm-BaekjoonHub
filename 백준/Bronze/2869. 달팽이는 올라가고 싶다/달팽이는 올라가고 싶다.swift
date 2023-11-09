let input = readLine()!.split(separator: " ")
let num = input.map{Int($0)!}
if (num[2] - num[0]) % (num[0] - num[1]) == 0{
    print((num[2] - num[0]) / (num[0] - num[1]) + 1)
} else {
    print((num[2] - num[0]) / (num[0] - num[1]) + 2)
}