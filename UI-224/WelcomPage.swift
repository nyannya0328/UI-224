//
//  WelcomPage.swift
//  UI-224
//
//  Created by にゃんにゃん丸 on 2021/06/05.
//

import SwiftUI

struct WelcomPage: View {
    @State var current : Int = 1
    @State var small = UIScreen.main.bounds.height < 750
    var body: some View {
        VStack{
            
            TabView(selection:$current){
                
                let width = UIScreen.main.bounds.width
                
                ForEach(1...3,id:\.self){index in
                    
                    
                    GeometryReader{proxy -> AnyView in
                        
                        
                        
                        let minX = proxy.frame(in: .global).minX
                        
                        
                        let progress = minX / (width * 2)
                        
                        
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                        
                        scale = scale < 0.7 ? 0.7 : scale
                        
                        
                        return AnyView(
                            VStack {
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: .infinity)
                                    .padding()
                                    
                                
                                Text("Pet Adaption")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .kerning(2)
                                
                                Text("Pet is Life Partner\nI love pet")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(5)
                                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                                    .padding(.top,10)
                            }
                            .padding(small ? 10 : 15)
                            .frame(maxHeight: .infinity)
                            .scaleEffect(scale)
                        
                        
                        )
                        
                       
                        
                        
                    }
                    .tag(index)
                    
                   
                    
                    
                    
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            CustomIndicator(count: 3, current: $current)
                .padding(.vertical,small ? 10 : 15)
                .padding(.top)
            
            
            VStack{
                
                
               
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        
                        HStack{
                            
                            
                            Image(systemName: "applelogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                            
                            Text("Sign in with Apple    ")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                            
                        
                                
                            
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                        
                           RoundedRectangle(cornerRadius: 15)
                            .fill(Color.primary)
                            .overlay(
                            
                                RoundedRectangle(cornerRadius: 15)
                                 .stroke(Color.white,lineWidth: 1)
                            
                            
                            )
                                
                        
                        )
                        
                        
                    })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    
                    HStack{
                        
                        
                        Image("google-symbol")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                           
                        
                        Text("Sign in with Google")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        
                    
                            
                        
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                    
                       RoundedRectangle(cornerRadius: 15)
                        .fill(Color.purple.opacity(0.3))
                        .overlay(
                        
                            RoundedRectangle(cornerRadius: 15)
                             .stroke(Color.green,lineWidth: 3)
                        
                        
                        )
                            
                    
                    )
                    
                    
                })
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    
                    HStack{
                        
                        
                        Image("email")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                           
                        
                        Text("Sign in with Email   ")
                       
                            .frame(maxWidth: .infinity)
                        
                    
                            
                        
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                    
                       RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green)
                        .overlay(
                        
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.primary,lineWidth: 0.3)
                        
                        
                        )
                            
                    
                    )
                    
                    
                })
                    
                
                
            }
            .padding()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("c1").ignoresSafeArea())
    }
}

struct WelcomPage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomPage()
          
            
    }
}

struct CustomIndicator : View {
    var count : Int
    @Binding var current : Int
    
    var body: some View{
        
        
        HStack{
            
            
            ForEach(0..<count){index in
                
                ZStack{
                    
                    
                    if (current - 1) == index{
                        
                        Circle()
                            .fill(Color.green)
                           
                        
                        
                    }
                    
                    else{
                        
                        
                        Circle()
                            .fill(Color.white)
                            
                            .overlay(
                                Circle()
                                    .stroke(Color.red)
                                   
                            
                            
                            )
                    }
                    
                    
                    
                }
                .frame(width: 10, height: 10)
                
                
            }
            
        }
        
    }
}
