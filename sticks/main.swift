//
//  main.swift
//  sticks
//
//  Created by Pavel Grigorev on 20.09.2022.
//

import Foundation

let sadCat = """

　　　　　／＞ 　  フ
　　　　　| 　_　 _|
　 　　　／`ミ _x 彡
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)_)
　＼二つ
"""

var sticks: [Character] = []
var count: UInt8 = 0
var player = true
var win = false

print("Введите количество палочек от 5 до \(UInt8.max)")
count = UInt8(readLine()!) ?? 0

guard count>4 && count<=255 else {
    print("Вы ввели неверное число")
    exit(1)
}
sticks = Array(repeating: "|", count: Int(count))
print("\n\(sticks)\n")

func removing() {
    switch player {
    case true: print("\nИГРОК 1")
    case false: print("\nИГРОК 2")
    }
//    if sticks.count == 1 { loosing() }
    print("Вытащите от 1 до 3 палочек")
    let remove = Int(readLine()!) ?? 0
    guard remove>0 && remove<=3 else {
        print("\nВы ввели неверное число")
        exit(2)
    }
    if remove < sticks.count {
        sticks.removeLast(remove)
        print("\n\(sticks)")
        player.toggle()
    } else { loosing() }

}

while sticks.count > 0 {
    removing()
}

func loosing() {
    print("\n\n\n\n\n\n\n\n\n\n        YOU LOOSE!")
    print(sadCat)
    print(player ? "         ИГРОК 1\n\n" : "         ИГРОК 2\n\n")
    exit(4)
}
