//
//  Flashcard.swift
//  FlashCards
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import Foundation

class FlashCard
{
    var question : String
    var options : [String]
    var correctAnswer : String
    
    init(question : String, options : [String])
    {
        self.question = question
        self.options = options
        self.correctAnswer = options[0]
    }
}
class CardCollection
{
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [FlashCard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : FlashCard {
        get { return cards[currentIndex]}
    }
    
    private init()
    {
        cards = [ FlashCard(question: "Test Question", options: ["True", "False"]),
                  FlashCard(question: "What is a synonym of happy", options: ["Sad", "Cheerful"]),
                  FlashCard(question: "What is your name", options: ["Bob", "Other"])
        ]
        currentIndex = 0
    }
    public func nextQuestion()
    {
        currentIndex += 1
        if (currentIndex >= cards.count)
        {
            currentIndex = 0
        }
    }
    public func checkAnswer(_ selectedAnswer : Int) -> Bool
    {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
