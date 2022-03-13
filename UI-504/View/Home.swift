//
//  Home.swift
//  UI-504
//
//  Created by nyannyan0328 on 2022/03/13.
//

import SwiftUI
import Lottie

struct Home: View {
   
    
    @State var offset : CGFloat = 0
    
    @GestureState var isDragging : Bool = false
    
    @State var currentSliderProgress : CGFloat = 0.5
    var body: some View {
        VStack{
            
            
            
            Text(getAttrbuted(string:"How was\nYour Food?"))
                .font(.system(size: 25, weight: .semibold))
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                LottieView(lottiFile: "Rating", progress: $currentSliderProgress)
                    .scaleEffect(0.8)
                    .frame(width: size.width, height: size.height)
            
            }
            
            ZStack{
                
                
            Rectangle()
                    .fill(.white)
                    .frame(height: 3)
                
                
                Group{
                    
                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                        .fill(.black)
                        .frame(width: 60, height: 60)
                    
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 15, height: 15)
                    
                    
                }
                .frame(maxWidth:.infinity)
                .padding()
                .contentShape(Rectangle())
                .offset(x: offset)
                .gesture(
                
                    DragGesture(minimumDistance: 0.05).updating($isDragging, body: { _, out, _ in
                        
                        
                        out = true
                    })
                    .onChanged({ value in
                        
                        let widht = UIScreen.main.bounds.width - 30
                        
                        var translation = value.location.x
                        
                        translation = (translation > 30 ? translation : 30)
                        
                        translation = (translation < (widht - 30) ? translation : (widht - 30))
                        
                        
                        translation = isDragging ? translation : 0
                        
                        offset = translation - (widht / 2)
                        
                        let progress = (translation - 30) / (widht - 55)
                        
                        
                        currentSliderProgress = progress
                        
                    })
                
                
                )
                
            }
            .padding()
           
            
            
                
            
            
            
            
            
        }
     
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .overlay(alignment: .topTrailing, content: {
            
            
            Button {
                
            } label: {
                
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .padding(20)
                    .background(.white,in: Circle())
                    .shadow(color: .black.opacity(0.03), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
            }
            .padding(.trailing,10)
            

            
        })
        .background{
            
            LinearGradient(colors: [
            
            
            
            Color("BG1"),
            Color("BG2"),
            Color("BG2"),
            Color("BG3"),
            Color("BG3"),
            
            
            
            
            ], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            
        }
        
    }
    
    func getAttrbuted(string : String)->AttributedString{
      
        var str = AttributedString(string)
        
        if let range = str.range(of: "Food?"){
            
            str[range].foregroundColor = .white
            str[range].font = .system(size: 30, weight: .semibold)
        }
        
        return str
        
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
