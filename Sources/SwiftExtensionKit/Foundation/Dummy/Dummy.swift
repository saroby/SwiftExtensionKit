import Foundation


public extension String {
    
    class Dummy {
        static func alphaNumeric(length: Int) -> String {
            let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            let allowedCharsCount = UInt32(allowedChars.count)
            var randomString = ""
            
            for _ in 0 ..< length {
                let randomNum = Int(arc4random_uniform(allowedCharsCount))
                let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
                let newCharacter = allowedChars[randomIndex]
                randomString += String(newCharacter)
            }
            
            return randomString
        }
        
        static func nickname() -> String {
            let adjectives = ["Swift", "Brave", "Clever", "Witty", "Bold", "Epic", "Fierce"]
            let nouns = ["Coder", "Developer", "Ninja", "Warrior", "Hero", "Samurai", "Wizard"]
            
            guard let randomAdjective = adjectives.randomElement(),
                  let randomNoun = nouns.randomElement() else {
                return "Anonymous"
            }
            
            return "\(randomAdjective)\(randomNoun)"
        }
        
        static func sentence() -> String {
            let subjects = ["The cat", "A dog", "The programmer", "An artist", "The scientist"]
            let verbs = ["jumps over", "runs to", "codes with", "paints", "analyzes"]
            let objects = ["the wall", "the park", "the computer", "a beautiful picture", "the data"]
            
            guard let randomSubject = subjects.randomElement(),
                  let randomVerb = verbs.randomElement(),
                  let randomObject = objects.randomElement() else {
                return "Something went wrong."
            }
            
            return "\(randomSubject) \(randomVerb) \(randomObject)."
        }
        
        static func paragraph(_ numberOfSentences: Int) -> String {
            assert(numberOfSentences > 0)
            
            var sentences = [String]()
            for _ in 0..<numberOfSentences {
                sentences.append(Self.sentence())
            }
            return sentences.joined(separator: " ")
        }
    }
}


public extension URL {
    
    class Dummy {
        public static func image(size: Int) -> URL {
            return URL(string: "https://picsum.photos/\(size)?random=\(Int.random(in: 1...Int.max))")!
        }
        
        public static func audio() -> URL {
            return .init(string: "https://file-examples.com/storage/fe6e60472c657f757a0e725/2017/11/file_example_MP3_700KB.mp3")!
        }
    }
}
