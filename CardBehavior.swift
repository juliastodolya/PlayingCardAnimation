//
//  CardBehavior.swift
//  PlayingCard
//
//  Created by Юлия on 25.01.2021.
//

import UIKit

class CardBehavior: UIDynamicBehavior {
    lazy var collisionBehavior​: UICollisionBehavior = {
        let behavior = UICollisionBehavior()
        behavior.translatesReferenceBoundsIntoBoundary = true
        return behavior
    }()
    lazy var itemBehavior: UIDynamicItemBehavior = {
        let behavior = UIDynamicItemBehavior()
        behavior.allowsRotation = false
        behavior.elasticity = 1.0
        behavior.resistance = 0
        return behavior
    }()
    
    private func push(_ item: UIDynamicItem) {
        let push = UIPushBehavior(items: [item], mode: .instantaneous)
        push.angle = CGFloat(Int.random(in: 0..<2*Int(CGFloat.pi)))
        push.magnitude = CGFloat(Int.random(in: 1...2))
        push.action = { [unowned push, weak self] in
            self?.removeChildBehavior(push)
        }
        addChildBehavior(push)
    }
    
    func addItem( _ item: UIDynamicItem) {
        collisionBehavior​.addItem(item)
        itemBehavior.addItem(item)
        push(item)
    }

    func removeItem(_ item: UIDynamicItem) {
        collisionBehavior​.removeItem(item)
        itemBehavior.removeItem(item)
    }
    
    convenience init(in animator: UIDynamicAnimator) {
        self.init()
        animator.addBehavior(self)
    }
    
    override init() {
        super.init()
        addChildBehavior(collisionBehavior​)
        addChildBehavior(itemBehavior)
    }
}
