   
var zeroCount = Array(repeating:0,count:41)
zeroCount[0] = 1
zeroCount[1] = 0
var oneCount = Array(repeating:0,count:41)
oneCount[0] = 0
oneCount[1] = 1
for i in 2...40{
    zeroCount[i] = zeroCount[i-1] + zeroCount[i-2]
    oneCount[i] = oneCount[i-1] + oneCount[i-2]
}
for _ in 1...Int(readLine()!)!{
    let input = Int(readLine()!)!
    print(zeroCount[input],oneCount[input])

}
