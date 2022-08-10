//
//  main.swift
//  baseball
//
//  Created by 천승희 on 2022/08/10.
//

import Foundation

var numbers: [Int] = []
var checkNumber:[Int] = []
var chance: Int = 9

func makeRandomNumber() {
    while checkNumber.count < 3 {
        let number = Int.random(in: 1...9)
        if checkNumber.contains(number) {
            continue
        } else {
            checkNumber.append(number)
        }
    }
}

func strikeBallCheck() {
    var strike = 0
    var ball = 0
    
    for i in 0...2 {
        if numbers[i] == checkNumber[i] {
            strike += 1
        } else if numbers.contains(checkNumber[i]) {
            ball += 1
        }
    }
    
    print("\(strike) 스트라이크 \(ball) 볼")
    chance -= 1
    numbers.removeAll()
}

func gameStart() {
    makeRandomNumber()
    
    while chance != 0 {
        while numbers.count < 3 {
            let number = Int.random(in: 1...9)
            if numbers.contains(number) {
                continue
            } else {
                numbers.append(number)
            }
        }
        
        print("임의의 수 : ", terminator: " ")
        for number in numbers {
            print(number, terminator: " ")
        }
        print()
        
        strikeBallCheck()
    }
    checkNumber.removeAll()
    chance = 9
    gameMenu()
}

func gameMenu() {
    print("1. 게임시작")
    print("2. 게임종료")
    print("원하는 기능을 선택해주세요 : ", terminator: "")
    let menu = Int(readLine()!)!
    
    if menu == 1 {
        gameStart()
    } else if menu == 2 {
        print("게임 종료")
    } else {
        gameMenu()
    }
}

gameMenu()
