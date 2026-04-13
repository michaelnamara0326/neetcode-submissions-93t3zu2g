class Solution {
    // 格式: 5#hello2#!!
    func encode(_ strs: [String]) -> String {
        var result = ""
        for s in strs {
            result += "\(s.count)#\(s)"
        }
        return result
    }

    func decode(_ s: String) -> [String] {
        var result = [String]()
        var i = s.startIndex
        
        while i < s.endIndex {
            // 1. 找到分隔符 #
            guard let hashIndex = s[i...].firstIndex(of: "#") else { break }
            
            // 2. 取得長度
            let lengthStr = s[i..<hashIndex]
            guard let length = Int(lengthStr) else { break }
            
            // 3. 根據長度取得字串內容
            let start = s.index(after: hashIndex)
            let end = s.index(start, offsetBy: length)
            let content = String(s[start..<end])
            
            result.append(content)
            
            // 4. 更新指針
            i = end
        }
        
        return result
    }
}