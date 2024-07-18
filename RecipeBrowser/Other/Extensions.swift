//
//  Extensions.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension Array where Element == String {
    func toJSONString() -> String {
        guard let data = try? JSONEncoder().encode(self) else {
            return "[]"
        }
        return String(data: data, encoding: .utf8) ?? "[]"
    }
    
    static func fromJSONString(_ jsonString: String) -> [String] {
        guard let data = jsonString.data(using: .utf8),
              let array = try? JSONDecoder().decode([String].self, from: data) else {
            return []
        }
        return array
    }
}
