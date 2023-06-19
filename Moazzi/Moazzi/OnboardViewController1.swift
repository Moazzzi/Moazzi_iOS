//
//  ViewController.swift
//  Moazzi
//
//  Created by 유준용 on 2023/05/30.
//

import UIKit

class OnboardViewController1: UIViewController {

    //MARK: - Properties
    let SELECTED_COLOR      = UIColor(rgb: 0x1BD689)
    let SELECTED_FONT_COLOR = UIColor(rgb: 0xFFFFFF)
    let DEFAULT_COLOR       = UIColor(rgb: 0xEDEDED)
    let DEFAULT_FONT_COLOR  = UIColor(rgb: 0xA7A7A7)
    
    @IBOutlet weak var questionLb   : UILabel!
    @IBOutlet weak var descLb       : UILabel!
    @IBOutlet weak var answerBox1   : UIView!
    @IBOutlet weak var answerLb1    : UILabel!
    @IBOutlet weak var answerBox2   : UIView!
    @IBOutlet weak var answerLb2    : UILabel!
    @IBOutlet weak var nextBtnView  : UIView!
    
    
    
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
        [nextBtnView, answerBox1, answerBox2].forEach {
            $0?.layer.cornerRadius = 8
        }
    }
    
    private func selectButton(selectedView: UIView){
        [answerBox1, answerBox2].forEach {
            if $0 == selectedView{
                $0?.backgroundColor = self.SELECTED_COLOR
                if let label = $0?.subviews.first as? UILabel {
                    label.textColor = self.SELECTED_FONT_COLOR
                    label.font = UIFont.pretendard(weight: .f700, size: 18)
                }
            }else{
                $0?.backgroundColor = self.DEFAULT_COLOR
                if let label = $0?.subviews.first as? UILabel {
                    label.textColor = self.DEFAULT_FONT_COLOR
                    label.font = UIFont.pretendard(weight: .f500, size: 18)
                }
            }
        }
    }
    private func connectGestureUI(){
        [answerBox1, answerBox2].forEach {$0?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerBoxDidTap(_:))))
        }
    }
    
    @objc func answerBoxDidTap(_ sender: UITapGestureRecognizer){
        guard let selectedView = sender.view else{return}
        selectedView.nativeFeelingAnimation(duration: 0.1, xScale: 0.96, yScale: 0.96)
        selectButton(selectedView: selectedView)
    }
}

