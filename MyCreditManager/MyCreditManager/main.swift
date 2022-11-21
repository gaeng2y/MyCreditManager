//
//  main.swift
//  MyCreditManager
//
//  Created by gaeng on 2022/11/21.
//

import Foundation

enum Menu: String {
    case addStudent = "1"
    case deleteStudent = "2"
    case addOrUpdateGrade = "3"
    case deleteGrade = "4"
    case showAverage = "5"
    case exit = "X"
}

start()

func start() {
    print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    getInput()
}

private func getInput() {
    guard let input = readLine() else {
        printAbnormalError()
        return
    }
    
    selectMenu(input)
}

private func selectMenu(_ input: String) {
    let inputMenu = Menu(rawValue: input)
    switch inputMenu {
    case .addStudent:
        print("학생추가")
    case .deleteStudent:
        print("학생삭제")
    case .addOrUpdateGrade:
        print("성적추가(변경)")
    case .deleteGrade:
        print("성적삭제")
    case .showAverage:
        print("평점보기")
    case .exit:
        print("종료")
    default:
        printAbnormalError()
    }
}

private func printAbnormalError() {
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}
