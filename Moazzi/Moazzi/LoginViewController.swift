//
//  LoginViewController.swift
//  Moazzi
//
//  Created by 유준용 on 2023/06/19.
//

import Foundation
import UIKit
import AuthenticationServices
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    let appleLoginManager = AppleLoginManager()
    
    @IBOutlet weak var appleBtnView: UIView!
    @IBOutlet weak var kakaoBtnView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    private func configureUI(){
        [kakaoBtnView, appleBtnView].forEach{$0.layer.cornerRadius = 20}
        appleBtnView.layer.borderColor = UIColor.black.cgColor
        appleBtnView.layer.borderWidth = 1.0
        
        kakaoBtnView.addGestureRecognizer(UIGestureRecognizer)
    }
    @objc func kakaoLoginAction(_ sender: Any) {
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    @objc func appleLoginAction(_ sender: Any) {
        appleLoginManager.performAppleLogin { [weak self] result in
            switch result {
            case .success(let userIdentifier):
                // 로그인 성공
                print("Apple 로그인 성공: \(userIdentifier)")
                
                // TODO: 로그인 성공 후 필요한 처리를 수행합니다.
                
            case .failure(let error):
                // 로그인 실패
                print("Apple 로그인 실패: \(error.localizedDescription)")
                
                // TODO: 로그인 실패 처리를 수행합니다.
            }
        }
        
    }

}

class AppleLoginManager: NSObject, ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    
    
    var onCompletion: ((Result<String, Error>) -> Void)?
    
    func performAppleLogin(completion: @escaping (Result<String, Error>) -> Void) {
        onCompletion = completion
        
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    // ASAuthorizationControllerDelegate 메서드
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Apple 로그인이 성공적으로 완료됨
            let userIdentifier = appleIDCredential.user
            onCompletion?(.success(userIdentifier))
        } else {
            // Apple 로그인이 실패함
            let error = NSError(domain: "com.yourdomain.applelogin", code: 0, userInfo: [NSLocalizedDescriptionKey: "Apple 로그인에 실패했습니다."])
            onCompletion?(.failure(error))
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Apple 로그인 중 에러 발생
        onCompletion?(.failure(error))
    }
    
    // ASAuthorizationControllerPresentationContextProviding 메서드
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // 로그인 화면이 표시될 윈도우를 반환합니다.
        // 보통은 현재 뷰 컨트롤러의 view.window를 반환합니다.
        return UIApplication.shared.windows.first!
    }
}
