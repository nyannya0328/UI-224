//
//  ContentView.swift
//  UI-224
//
//  Created by にゃんにゃん丸 on 2021/06/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    
    @State var contentHieght : CGFloat = 0
    var body: some View {
        NavigationView{
            
            VStack{
                
                AutoRisizingTF(hint: "Enter", text: $text, contentHieght: $contentHieght, onEnd: {
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                    
                })
                
                    .padding(.horizontal)
                    .frame(height: contentHieght <= 120 ? contentHieght : 120)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                  
                
                
            }
             
            .navigationBarTitle("In put Accessory View", displayMode: .inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.primary.opacity(0.03).ignoresSafeArea())
            
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AutoRisizingTF : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return AutoRisizingTF.Coordinator(parent: self)
    }
    
    
    var hint : String
    @Binding var text : String
    @Binding var contentHieght : CGFloat
    
    
    var onEnd : ()->()
   
    func makeUIView(context: Context) -> UITextView {
        
        let view = UITextView()
        
        view.text = hint
        view.textColor = .gray
        view.font = .systemFont(ofSize: 30, weight: .bold)
        view.delegate = context.coordinator
        
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        
        toolBar.barStyle = .default
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(context.coordinator.coloseKeyBoard))
        
        toolBar.items = [spacer,doneButton]
        
        toolBar.sizeToFit()
        
        view.inputAccessoryView = toolBar
        
        
        
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        DispatchQueue.main.async {
            if contentHieght == 0{
                
                contentHieght = uiView.contentSize.height
                
                
            }
        }
        
    }
    
    class Coordinator : NSObject,UITextViewDelegate{
        
        var parent : AutoRisizingTF
        
        init(parent : AutoRisizingTF) {
            self.parent = parent
        }
        
        @objc func coloseKeyBoard(){
            
            parent.onEnd()
            
            
            
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            parent.contentHieght = textView.contentSize.height
            
            
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            if textView.text == parent.hint{
                
                textView.text = ""
                textView.textColor = UIColor.gray
                
                
            }
            
            
            
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            
            if textView.text == ""{
                
                textView.text = parent.text
                
                textView.textColor = .gray
                
                
            }
            
        }
        
    }
}
