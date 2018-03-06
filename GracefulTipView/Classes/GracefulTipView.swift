//
//  GracefulTipView.swift
//  GracefulTipView
//
//  Created by Spring on 2018/3/5.
//

import UIKit

public class GracefulTipView: UIView {

    public var tipText: String {
        
        set {
            
            self.titleLabel?.text = newValue
            
        }
        
        get {
            
            return self.titleLabel?.text ?? ""
            
        }
        
    }
    
    var titleLabel: UILabel?
    
    var floatAbove = false
    var relatedView: UIView?
    
    var arrowView: UIImageView?
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.backgroundColor = UIColor(red:1.00, green:0.83, blue:0.34, alpha:1.0)
        titleLabel.layer.cornerRadius = 5
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        self.addSubview(titleLabel)
        
        self.titleLabel = titleLabel
        
        let arrowView = UIImageView(frame: CGRect.zero)
        // 30 9
        self.addSubview(arrowView)
        self.arrowView = arrowView
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    public override func layoutSubviews() {
        
        super.layoutSubviews()
        
        
    }
    
    public func floatAboveOf(view: UIView) {
        
        floatAbove = true
        self.relatedView = view
        self.relatedView?.addObserver(self, forKeyPath: "frame", options: .new, context: nil)
        self.relatedView?.addObserver(self, forKeyPath: "center", options: .new, context: nil)
        self.arrowView?.image = ImageLoader.image(named: "arrow-above")
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
     
        if let relatedFrame = self.relatedView?.frame {
            
            self.frame = CGRect(x: relatedFrame.origin.x, y: relatedFrame.origin.y - 40, width: 120, height: 45)
            
            self.center = CGPoint(x: relatedFrame.origin.x + relatedFrame.size.width / 2, y: relatedFrame.origin.y - 20)
            self.arrowView?.frame = CGRect(x: 0, y: 0, width: 20, height: 9)
            
            if floatAbove {
                self.titleLabel?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height - self.arrowView!.frame.size.height)
                
                self.arrowView?.center = CGPoint(x: self.titleLabel!.frame.origin.x + self.titleLabel!.frame.size.width / 2,
                                                 y: self.titleLabel!.frame.origin.y + self.titleLabel!.frame.size.height + self.arrowView!.frame.size.height / 2)
                
                
            }
            
        }
        
    }
    
    
}
