//
//  Rating.swift
//  Assignment
//
//  Created by Charan on 09/04/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
import UIKit

var minimumvalue = 0.0
 var maximumvalue = 9.0

struct Rating: View {
    
@State var tag:Int? = nil
@State var sliderValue = 0.0
@State var sliderValue_2 = 0.0
    let date = Date()

  
@GestureState var dragAmount = CGSize.zero
@EnvironmentObject var truth:SourceOfTruth
   @Environment(\.managedObjectContext) var managedObjectContext

     var body: some View {
        ZStack{
            
        LinearGradient(gradient: Gradient(colors:  [Color("aubergine_l"), Color("list_color")]), startPoint: .leading, endPoint:.trailing)
                     .edgesIgnoringSafeArea(.all)
            VStack (spacing:60){
                Text("Choose Rating").font(.system(size: 40))
             HStack {
                VStack{
                    Text("\(self.truth.min)")
                    .onAppear(){

                                      maximumvalue = Double(self.truth.max_n)
                                      minimumvalue = Double(self.truth.min_n)
                                           
                                   }
                                   
                    Image(systemName:"star")
                }
                VStack{
                Slider(value: Binding(get: {
                    self.sliderValue
                }, set: { (newVal) in
                    self.sliderValue = newVal
                    self.tag=1
                }), in: minimumvalue...maximumvalue,step:1)
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 2).foregroundColor(Color.black))
                    .accentColor(Color.green)
                    .onTapGesture(){self.tag=1}
                 Image(systemName:"star.lefthalf.fill")
                }
                VStack{
                    
                    Text("\(self.truth.max)")
                    Image(systemName:"star.fill")
                    
                }
            }
          
            
            if self.tag == 1{
                Text("Rating:\(Int(sliderValue))").font(.system(size: 25))
                
                }
            Button(action: {
                self.sliderValue_2 = self.sliderValue
                self.sliderValue = Double(self.truth.min_n)
                let historyview = History_view(context: self.managedObjectContext)
                                                historyview.id = UUID()
                                               historyview.rating = self.sliderValue_2
                                               historyview.dates = self.date
                                               
                                               do {
                                                   try self.managedObjectContext.save()
                                               } catch {
                                                   print(error)
                                               }
  
                
            }) {
                HStack(spacing:5){
                Image(systemName: "hand.thumbsup.fill").font(.system(size: 28)).foregroundColor(.black)
                Text("Submit").fontWeight(.regular).font(.system(size: 32))
                            .foregroundColor(.black)
                }
                            .padding()
                }
                
            }
        }
.navigationBarBackButtonHidden(true)
.navigationBarItems(leading: MyBackButton_3(label: "Back") {
               self.truth.viewtag = 4
           })
    }
    
}


struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating()
    }
}
struct MyBackButton_3: View {
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

