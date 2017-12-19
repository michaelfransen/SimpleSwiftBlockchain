import Foundation

var blocks: [Int] = []

struct Block: Hashable {
    let date: Date
    let data: String
    let previousHash: Int
    let index: Int
    
    var hashValue: Int {
        return date.hashValue ^ data.hashValue ^ previousHash.hashValue ^ index.hashValue
    }
    
    static func == (lhs: Block, rhs: Block) -> Bool {
        return lhs.date == rhs.date &&
        lhs.data == rhs.data &&
        lhs.previousHash == rhs.previousHash &&
        lhs.index == rhs.index
    }
}

func addData(value: String) {
   let block = Block(date: Date(), data: value, previousHash: blocks.last ?? 0, index: blocks.count)
    blocks.append(block.hashValue)
}

addData(value: "My first Block")
addData(value: "My second Block")
addData(value: "My Third Block")

print(blocks)
