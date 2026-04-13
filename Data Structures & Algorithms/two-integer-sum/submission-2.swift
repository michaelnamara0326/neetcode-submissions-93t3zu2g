class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numDict: [Int: Int] = [:] // 每個index所需要找到的值
        for (index, num) in nums.enumerated() {
            if let pairIndex = numDict[num] {
                return [pairIndex, index]
            }
            let findNum = target - num
            numDict[findNum] = index
        }
        return []
    }
}
