class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // k must greater than 0,  nums empty, k is one of the element of nums
        guard !nums.isEmpty else { return [] }
        

        // 1. calculate frequent of each element
        let dict = nums.reduce(into: [Int: Int]()) { result, next in
            result[next, default: 0] += 1
        }

        // 2. create bucket
        var bucket = Array(repeating: [Int](), count: nums.count + 1)
        dict.forEach { num, count in
            bucket[count].append(num)
        }

        // 3. find the most k frequent of element from bucket
        var result: [Int] = []
        for i in stride(from: nums.count, through: 0, by: -1) {
            result.append(contentsOf: bucket[i])
            if result.count >= k { // if already reach the require k, then early return
                return result
            }
        }

        return result
    }
}