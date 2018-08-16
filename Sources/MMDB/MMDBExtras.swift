import Foundation

extension MMDB {
    public func lookupResult(_ ip: String) throws -> MaxMindDBResult? {
        guard let dictionary = lookup(ip: ip) else {
            return nil
        }
        var formattedDictionary: [String:Dictionary<AnyHashable,Any>] = [:]
        for (key, value) in dictionary {
            guard let data = (key as? NSString)?.data(using: String.Encoding.utf8.rawValue), let key = String(data: data, encoding: .utf8) else {
                continue
            }
            guard let value = value as? Dictionary<AnyHashable,Any>, !value.isEmpty else {
                continue
            }
            formattedDictionary[key] = value
        }

        let data = try JSONSerialization.data(withJSONObject: formattedDictionary)
        let result = try JSONDecoder().decode(MaxMindDBResult.self, from: data)

        return result
    }
}

