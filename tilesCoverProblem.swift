//
// create data structure to represent tile that can be 
// white, black or is devided into 4 smaller tiles (in fractal manner).
//
// write method to merge two tiles bearing in mind those rules:
// if part of a first tile is black and corresponding part of a second 
// tile is white then corresponding part of a tile after merge will be black:
// 1.(black + white = black)
// In the same way: 
// 2. (white + white = white)
// 3. (black + black = black)
//


import Foundation

enum NodeType {
    case white
    case black
    case tiles
}

class Node {
    var children: [Node]
    var type: NodeType
    
    class func merge(f: Node, s: Node) -> Node {
        
        switch (f.type, s.type) {
        case (.white, _):
            f.type = s.type
            f.children = s.children
        case (_, .white):
            break
        case (.black, _):
            break
        case (_, .black):
            f.type = .black
            f.children = []
        default:
            f.type = .tiles
            assert(f.children.count == 4 && s.children.count == 4)
            for index in f.children.indices {
                f.children[index] = add(f: f.children[index], s: s.children[index])
            }
            
            let firstType = f.children[0].type
            
            if f.children.allSatisfy({$0.type == firstType}) {
                f.type = firstType
                f.children = []
            }
        }
        
        return f
    }
    
    init(children: [Node], type: NodeType) {
        self.children = children
        self.type = type
    }
}
