//
//  LottieView.swift
//  UI-504
//
//  Created by nyannyan0328 on 2022/03/13.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var lottiFile : String
    @Binding var progress : CGFloat
    
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        addAnimatonView(to: view)
        
        return view
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
        uiView.subviews.forEach { view in
            
            if view.tag == 1009{
                
                view.removeFromSuperview()
            }
            
            addAnimatonView(to: uiView)
        }
        
    }
    
    func addAnimatonView(to rootView : UIView){
        
        
        let animationView = AnimationView(name: lottiFile, bundle: .main)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundColor = .clear
        animationView.currentProgress = 0.49 + (progress / 2)
        animationView.tag = 1009
        
        let contains = [
        
        
            animationView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: rootView.heightAnchor),
        
        
        ]
        
        rootView.addSubview(animationView)
        rootView.addConstraints(contains)
        
        
        
    }
}

