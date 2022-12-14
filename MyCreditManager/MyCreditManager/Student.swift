//
//  Student.swift
//  MyCreditManager
//
//  Created by gaeng on 2022/11/21.
//

import Foundation

struct Students {
    private var items: [Student] = []
    
}

struct Student {
    let name: String
    var grades: [Grade] = []
    
    func existGrade(_ grade: Grade) -> Bool {
        return grades.contains(where: { $0.subject == grade.subject })
    }
    
    mutating func addGrade(_ grade: Grade) {
        grades.append(grade)
        
        print("\(name) 학생의 \(grade.subject) 과목이 \(grade.score.rawValue)로 추가(변경)되었습니다.")
    }
    
    mutating func updateGrade(_ grade: Grade) {
        guard let existedGradeIndex = grades.firstIndex(where: { $0.subject == grade.subject }) else {
            return
        }
        grades[existedGradeIndex] = grade
        
        print("\(name) 학생의 \(grade.subject) 과목이 \(grade.score.rawValue)로 추가(변경)되었습니다.")
    }
    
    mutating func deleteGrade(_ subject: String) {
        guard let existedGradeIndex = grades.firstIndex(where: { $0.subject == subject }) else {
            return
        }
        grades.remove(at: existedGradeIndex)
        
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
}
