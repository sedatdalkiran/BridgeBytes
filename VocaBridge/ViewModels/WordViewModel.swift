//
//  WordViewModel.swift
//  VocaBridge
//
//  Created by Sedat Dalkıran on 3.09.2023.
//

import SwiftUI
import Foundation

extension String {
    static let levelProgress = "levelProgress"
}

class WordViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var words: [Word] = []
    @Published var allLevels: [WordLevel] = []
    @Published var progress: [Int: Bool] {
        didSet {
            saveProgressToUserDefaults()
        }
    }
    @Published var allLevelGroups: [WordLevelGroup] = []

    // MARK: - Initializers
    init() {
        self.words = []
        self.allLevels = []
        self.progress = [:]
        self.allLevelGroups = []
        fetchWords()
        loadProgress()
    }
    
    // MARK: - Methods
    func fetchWords() {
        if let url = Bundle.main.url(forResource: "1000EssentialWords", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let wordList = try JSONDecoder().decode([String: [Word]].self, from: data)
                if let fetchedWords = wordList["words"] {
                    self.words = fetchedWords
                    groupWordsIntoLevels()
                    groupLevelsIntoGroups()
                }
            } catch {
                print("Error:", error)
            }
        }
    }
    
    func groupWordsIntoLevels() {
        let wordsPerLevel = 10
        let totalLevels = words.count / wordsPerLevel
        
        for level in 0..<totalLevels {
            let startIndex = level * wordsPerLevel
            let endIndex = startIndex + wordsPerLevel
            let levelWords = Array(words[startIndex..<endIndex])
            allLevels.append(WordLevel(id: level + 1, words: levelWords))
        }
    }

    func groupLevelsIntoGroups() {
        let levelsPerGroup = 10
        
        for group in stride(from: 0, to: allLevels.count, by: levelsPerGroup) {
            let groupLevels = Array(allLevels[group..<min(group + levelsPerGroup, allLevels.count)])
            allLevelGroups.append(WordLevelGroup(id: group/levelsPerGroup + 1, levels: groupLevels))
        }
    }

    func completedLevelsForGroup(_ groupId: Int) -> Double {
        let startIndex = (groupId - 1) * 10 + 1
        let endIndex = startIndex + 9
        return Double(progress.filter { $0.key >= startIndex && $0.key <= endIndex && $0.value }.count)
    }
    
    func toggleProgress(for level: Int) {
        progress[level] = !(progress[level] ?? false)
    }
    
    private func saveProgressToUserDefaults() {
        let data = try? JSONEncoder().encode(progress)
        UserDefaults.standard.setValue(data, forKey: .levelProgress)
    }
    
    private func loadProgress() {
        if let data = UserDefaults.standard.data(forKey: .levelProgress),
           let storedProgress = try? JSONDecoder().decode([Int: Bool].self, from: data) {
            self.progress = storedProgress
        }
    }
}
