//
//  TagRemover.swift
//  TagRemoverCore
//
//  Created by koichi tanaka on 2019/08/14.
//

import Foundation
import SwiftSoup
import Files

public final class TagRemover {
    
    public static func removeTag(htmlOrPath: String) throws {
        var html = ""
        if let htmlFile = try? File(path: htmlOrPath) {
            html = try! htmlFile.readAsString()
        } else {
            html = htmlOrPath
        }
        
        do {
            let doc: Document = try SwiftSoup.parseBodyFragment(html)
            print(try doc.text())
        } catch Exception.Error(let type, let message) {
            print("error: \(type), \(message)")
        } catch {
            print("error")
        }
    }
}
