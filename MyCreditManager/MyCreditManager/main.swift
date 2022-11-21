//
//  main.swift
//  MyCreditManager
//
//  Created by gaeng on 2022/11/21.
//

import Foundation

var students = [Student]()

start()

func start() {
    while true {
        print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        let menu = getInput()
        switch menu {
        case .addStudent:
            addStudent()
        case .deleteStudent:
            deleteStudent()
        case .exit:
            break
        default:
            continue
        }
    }
}

private func getInput() -> Menu?{
    guard let input = readLine() else {
        printAbnormalError()
        return nil
    }
    
    return selectMenu(input)
}

private func selectMenu(_ input: String) -> Menu? {
    let inputMenu = Menu(rawValue: input)
    switch inputMenu {
    case .addStudent:
        print("추가할 학생의 이름을 입력해주세요")
    case .deleteStudent:
        print("삭제할 학생의 이름을 입력해주세요")
    case .addOrUpdateGrade:
        print("성적추가(변경)")
    case .deleteGrade:
        print("성적삭제")
    case .showAverage:
        print("평점보기")
    case .exit:
        print("프로그램을 종료합니다...")
    default:
        printAbnormalError()
    }
    
    return inputMenu
}

private func addStudent() {
    guard let input = readLine() else {
        printAbnormalError()
        return
    }
    
    let student = Student(name: input)
    
    if isExistStudent(student) {
        print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        students.append(student)
        
        print("\(input) 학생을 추가했습니다.")
    }
}

private func deleteStudent() {
    guard let input = readLine() else {
        printAbnormalError()
        return
    }
    
    let student = Student(name: input)
    
    if isExistStudent(student) {
        students.removeAll { $0.name == student.name }
        
        print("\(input) 학생을 삭제했습니다.")
    } else {
        print("\(input) 학생을 찾기 못했습니다.")
    }
}

private func isExistStudent(_ student: Student) -> Bool {
    return students.contains(where: { $0.name == student.name })
}

private func printAbnormalError() {
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}
