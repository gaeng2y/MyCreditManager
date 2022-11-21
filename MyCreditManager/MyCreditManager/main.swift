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
        case .addOrUpdateGrade:
            addOrUpdateGrade()
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
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
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
    guard let name = readLine() else {
        printAbnormalError()
        return
    }
    
    let student = Student(name: name)
    
    if isExistStudent(name) {
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    } else {
        students.append(student)
        
        print("\(name) 학생을 추가했습니다.")
    }
}

private func deleteStudent() {
    guard let name = readLine() else {
        printAbnormalError()
        return
    }
    
    let student = Student(name: name)
    
    if isExistStudent(name) {
        students.removeAll { $0.name == name }
        
        print("\(name) 학생을 삭제했습니다.")
    } else {
        print("\(name) 학생을 찾기 못했습니다.")
    }
}

private func addOrUpdateGrade() {
    guard let input = readLine() else {
        printAbnormalError()
        return
    }
    
    let inputArray = input.components(separatedBy: " ")
    if inputArray.count != 3 {
        printAbnormalError()
        return
    }
    let name = inputArray[0]
    if !isExistStudent(name) {
        printAbnormalError()
        return
    }
    
    let grade = Grade(subject: inputArray[1],
                      score: Score(rawValue: inputArray[2]) ?? .fail)
    guard let index = students.firstIndex(where: { $0.name == name }) else { return }
    if students[index].existGrade(grade) {
        students[index].updateGrade(grade)
    } else {
        students[index].addGrade(grade)
    }
}

private func isExistStudent(_ name: String) -> Bool {
    return students.contains(where: { $0.name == name })
}

private func printAbnormalError() {
    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
}
