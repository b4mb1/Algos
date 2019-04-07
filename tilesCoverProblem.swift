import Foundation

enum NodeType {
    case white
    case black
    case tiles
}

class Node {
    var children: [Node]
    var type: NodeType
    
    class func add(f: Node, s: Node) -> Node {
        
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
