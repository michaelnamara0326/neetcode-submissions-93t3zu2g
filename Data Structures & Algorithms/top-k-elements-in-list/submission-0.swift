class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // k must greater than 0,  nums empty, k is one of the element of nums
        guard !nums.isEmpty else { return [] }
        
        let dict = nums.reduce(into: [Int: Int]()) { result, next in
            result[next, default: 0] += 1
        }
        
        // result sort desc and filter first k element in dict key
        let sortedDict = dict.sorted(by: { $0.value > $1.value }) // 大到小
        let frequentElem = sortedDict.dropLast(dict.count - k).map(\.key)
        return frequentElem
    }
}