//
//  VStackView.swift
//  Aspasia
//
//  Created by 이동근 on 2021/06/18.
//

import UIKit

class VStackView: UIView {
    var alignment: UIView.ContentMode = .center
    
    var stack: [Stackable] = []
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: frame.width, height: 0)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var height: CGFloat = 0
        
        for node in stack {
            if node.view.frame.width > 0 {
                alignmentLayout(node, minY: height)
            } else {
                fillLayout(node, minY: height)
            }
            
            height += node.spacing + node.view.frame.height
        }
        
        frame.size = CGSize(width: frame.size.width, height: height)
    }
    
    /// VStackView에 view를 추가한다.
    /// - parameter stack : 추가할 view
    /// - parameter spacing : 앞서 추가한 view와의 공백
    /// - parameter offset : 수직축에 대한 offset
    func push(_ child: UIView, spacing: CGFloat = 0, offset: CGFloat = 0) {
        child.sizeToFit()
        
        let node = Stackable(view: child, spacing: spacing, offset: offset)
        
        // layout
        if child.frame.width > 0 {
            alignmentLayout(node, minY: frame.height)
        } else {
            fillLayout(node, minY: frame.height)
        }
        
        // add
        addSubview(child)
        
        // append stack
        stack.append(node)
    }
    
    func playCascade() {
        var playing: Int = 0
        
        for node in stack {
            node.view.transform = CGAffineTransform(translationX: 0, y: -20)
            node.view.alpha = 0
            
            UIView.animate(withDuration: 0.1, delay: 0.05 * Double(playing), animations: {
                node.view.alpha = 1
                node.view.transform = .identity
            })
            
            playing += 1
        }
    }
    
    private func alignmentLayout(_ node: Stackable, minY: CGFloat) {
        // default center
        var origin = CGPoint(x: frame.width / 2 - node.view.frame.width / 2, y: minY + node.spacing)
        
        switch alignment {
        case .left:
            origin.x = node.offset
            
        case .right:
            origin.x = frame.width - node.view.frame.width + node.offset
            
        default:
            break
        }
        
        node.view.frame.origin = origin
    }
    
    private func fillLayout(_ node: Stackable, minY: CGFloat) {
        node.view.frame = CGRect(x: node.offset, y: minY + node.spacing, width: frame.width, height: node.view.frame.height)
    }
}
