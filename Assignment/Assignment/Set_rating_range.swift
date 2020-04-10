//
//  Set_rating_range.swift
//  Assignment
//
//  Created by Charan on 09/04/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.white
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
    }
}
struct Set_rating_range: View {

     @State private var showingAlert = false
    @State var mini: String = ""
    @State var maxi: String = ""
     @EnvironmentObject var truth:SourceOfTruth
    @State var tag:Int? = nil
    @State var text = ""
    
    var body: some View {
        
        let binding = Binding<String>(get:{self.mini},set:{self.mini = $0
              self.tag = 2
        })
        let binding2 = Binding<String>(get:{self.maxi
                  
        },set:{self.maxi = $0
            self.tag = 2
        })
              
       return Background{
       
            ZStack{
            

            
            LinearGradient(gradient: Gradient(colors:  [Color("aubergine_l"), Color("list_color")]), startPoint: .leading, endPoint:.trailing)
                             .edgesIgnoringSafeArea(.all)
                         
            VStack(alignment:.center,spacing:50){
                Text("Set your rating range").font(.largeTitle)
                  
            HStack{
                Text("Minimum Rating").font(.headline)
            
                TextField("0 to 8", text: binding)
                {
                                   self.endEditing()
                    } .onReceive(self.mini.publisher.collect()){
                                    self.mini = String($0.prefix(1))
                           } .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(maxWidth: 250) .keyboardType(.numberPad)
                
                }
       HStack{
        Text("Maximum Rating").font(.headline)
                     
        TextField("1 to 9", text: binding2)
            .onReceive(self.maxi.publisher.collect()){
                 self.maxi = String($0.prefix(1))
        }
            
            .textFieldStyle(RoundedBorderTextFieldStyle())
                 .frame(maxWidth: 250) .keyboardType(.numberPad)}
               
                
                Button(action: {self.tag = 1
                    self.endEditing()
                    self.truth.min = self.mini
                    self.truth.max = self.maxi
                    self.truth.max_n = Int(self.maxi) ?? 0
                    self.truth.min_n = Int(self.mini) ?? 0
                        if self.truth.min_n >= self.truth.max_n {
                                  self.showingAlert = true
                                    }
                    
                }) {
                                        HStack(spacing:10){
                                            Image(systemName: "checkmark.circle").font(.system(size:30)).foregroundColor(.black)
                                            Text("Set it")
                                             .fontWeight(.medium)
                                               .font(.system(size: 32))
                                             .foregroundColor(.black)
                                        }
                                     
                                       .padding()
                                        .cornerRadius(25.0)
                                        .frame(width:155.0, height: 50.0)
                                                         

                                                    
                }.alert(isPresented: self.$showingAlert) {
                        Alert(title: Text("Error"), message: Text("Minimum rating cannot be equal or more than maximum rating"), dismissButton: .default(Text("Got it!")))
                    }
                       
            
          
                if self.tag == 1{
                HStack(alignment:.center,spacing:55){

                    Text("Minimum Rating:\(self.mini)")
                        .font(.headline)
                    Text("Maximum Rating:\(self.maxi)")
                        .font(.headline)}

                
                }
                  
   
   
    }.frame(width: UIScreen.main.bounds.width)
        }
        
   
        
       
       }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: MyBackButton(label: "Back") {
                   self.truth.viewtag = 4
               })

        .onTapGesture {self.endEditing()}
        
     
    }
        private func endEditing() {
            UIApplication.shared.endEditing()
        }
    
}

struct Set_rating_range_Previews: PreviewProvider {
    static var previews: some View {
        Set_rating_range()
    }
}
struct MyBackButton: View {
    
    let label: String
    let closure: () -> ()

    var body: some View {
        
        Button(action: { self.closure() }) {
            HStack {
                Image(systemName: "chevron.left").foregroundColor(.black)
                Text(label).foregroundColor(.black)
            }
        }
    }
}
