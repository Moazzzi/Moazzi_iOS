//
//  ViewController.swift
//  Moazzi
//
//  Created by 유준용 on 2023/05/30.
//

import UIKit

class OnboardViewController: UIViewController {

    @IBOutlet weak var questionLb: UILabel!
    @IBOutlet weak var descLb: UILabel!
    @IBOutlet weak var answerBox1: UIView!
    @IBOutlet weak var answerLb1: UILabel!
    @IBOutlet weak var answerBox2: UIView!
    @IBOutlet weak var answerLb2: UILabel!
    @IBOutlet weak var nextBtnView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        connectGestureUI()
    }

    private func configureUI(){
        questionLb.text = "성별이 어떻게\n되시나요?"
        
        descLb.text = "성별을 알려주세요!"
        descLb.textColor = UIColor(rgb: 0xA7A7A7)
        questionLb.attributedText = UIFont.chagePartOfTextColor(fullText: "성별이 어떻게\n되시나요?", partText: "성별", color: UIColor(rgb: 0x7082FF))
        
        answerBox1.backgroundColor = UIColor(rgb: 0x1BD689 )
        
        [nextBtnView, answerBox1, answerBox2].forEach {
            $0?.layer.cornerRadius = 8
        }
    }
    
    private func connectGestureUI(){
        self.answerBox1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerBoxDidTap(_:))))
        self.answerBox2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerBoxDidTap(_:))))
    }
    
    @objc func answerBoxDidTap(_ sender: UITapGestureRecognizer){
        print(sender.view)
//        sender.view?.nativeFeelingAnimation(duration: 0.5, xScale: 0.96, yScale: 0.96)
            
        
    }
}

