//
//  ReverseFunction.swift
//  ReverseWords
//
//  Created by Екатерина Токарева on 20/10/2022.
//

import Foundation

func reverseWords(_ s: String) -> String {
    var result = ""
    var string = s
    if string.contains(" ") == false {return String(s.reversed())}
    while string.contains(" ") == true {
        let i = string.firstIndex(of: " ")!
        let word = string.prefix(upTo: i)
        result += word.reversed()
        let a = string.startIndex
        string.removeSubrange(a...i)
        result += " "
    }
    result += string.reversed()
    return result
}
