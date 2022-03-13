//
//  TripView.swift
//  UI-504
//
//  Created by nyannyan0328 on 2022/03/13.
//

import SwiftUI

struct TripView: View {
    @State var selectedTab : Trip = trips[0]
    
    @StateObject var model = HomeViewModel()
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    
                 
                
            }
            
            
            VStack(spacing:10){
                
                Text("Lets Go With")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("Proco Trip")
                    .font(.title)
                    .foregroundColor(.white)
                
                
                VStack{
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        
                        TabView(selection: $selectedTab) {
                            
                            
                            ForEach(trips){trip in
                                
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .tag(trip)
                                    .cornerRadius(10)
                            }
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        
                    }
                    .frame(height:UIScreen.main.bounds.height / 2.2)
                    
                    
                    Text(selectedTab.title)
                        .font(.title.bold())
                        .foregroundColor(.black)
                        .padding(.top,20)
                        .padding(.bottom,50)
                    
                    pageController(maxPage: trips.count, currentPage: getIndex())
                    
                    
                }
                .padding(.top,20)
                .padding(.horizontal)
                .background(Color.white.clipShape(CustomShape()))
             
                
                
                
            
                    
                    Button {
                        
                    
                        
                       
                        
                    } label: {
                        
                        Text("Gets Started")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .frame(maxWidth:.infinity)
                            .background(Color("blue"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    
           

                
              
                
                
                
            }
            .padding()
            
            
         

            
          
        }
        .ignoresSafeArea()
    
      
       
    }
    
    func getIndex()->Int{
        
        return trips.firstIndex { currentTrip in
            
            selectedTab.id == currentTrip.id
        } ?? 0
        
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct pageController : UIViewRepresentable{
    
    var maxPage : Int
    var currentPage : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let page = UIPageControl()
        page.currentPage = currentPage
        page.numberOfPages = maxPage
        
        return page
        
        
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentPage
        
    }
}

struct CustomShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            let midWidth = rect.width / 2
            
            
            path.addLine(to: CGPoint(x: midWidth - 80, y: rect.height))
            path.addLine(to: CGPoint(x: midWidth - 70, y: rect.height - 25))
            path.addLine(to: CGPoint(x: midWidth + 70, y: rect.height - 25))
            
            
            path.addLine(to: CGPoint(x: midWidth + 80, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
            
        }
    }
}
