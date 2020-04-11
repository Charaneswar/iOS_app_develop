//
//  ContentView.swift
//  Assignment
//
//  Created by Charan on 09/04/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

extension HorizontalAlignment {
    private enum WeirdAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height
        }
    }
    
    static let weirdAlignment = HorizontalAlignment(WeirdAlignment.self)
}

struct ContentView: View {
    
    @State private var color = Color.white
    @State var tag:Int? = nil
    @EnvironmentObject var truth:SourceOfTruth
    
    var body: some View {
        NavigationView{
        ZStack {
            

            NavigationLink(destination: Rating(),tag: 1, selection: $truth.viewtag){
                        EmptyView()
            }
                
                 
                 
            NavigationLink(destination: Set_rating_range(),tag: 2, selection: $truth.viewtag){
                        EmptyView()
                 }
                 
            NavigationLink(destination: History(),tag: 3, selection: $truth.viewtag){
                    EmptyView()
                     
            }
     LinearGradient(gradient: Gradient(colors:  [Color("aubergine_l"), Color("list_color")]), startPoint: .topLeading, endPoint:.bottomTrailing)
                  .edgesIgnoringSafeArea(.all)
              
        
        VStack(alignment:.center,spacing:60)
        {  VStack(alignment:.weirdAlignment,spacing:20){
            HStack{
                Image(systemName: "person.circle")  .font(.system(size: 80))
                   
            Text("User Rating")
                .font(.system(size:55))
                .fontWeight(.regular)
                .foregroundColor(Color.black) }
            HStack(alignment:.top){
                Image(systemName: "star").font(.subheadline)
                Image(systemName: "star").font(.subheadline)
                Image(systemName: "star").font(.subheadline)}
            .alignmentGuide(.weirdAlignment, computeValue: { d in 55})
            }
            Divider()
            Button(action: {self.truth.viewtag = 3}) {
                HStack(spacing:15){
                Image(systemName: "clock")
                Text("Rating records")
                .fontWeight(.medium)
                 .font(.system(size: 26))
                }
                .foregroundColor(.black)
                .padding()
                  .overlay(
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 2)
                                  )
            }
            Button(action: {self.truth.viewtag = 1}) {
                HStack(spacing:10){
                Image(systemName: "star.lefthalf.fill")
                    Text("Rating \(self.truth.min) - \(self.truth.max)")
                    .fontWeight(.medium)
                    .font(.system(size: 26))}
              .foregroundColor(.black)
              .padding()
               .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
          
            }
            Button(action: {self.truth.viewtag = 2}) {
                    HStack(spacing:10){
                    Image(systemName: "pencil")
                    Text("Rating Range")
                    .fontWeight(.medium)
                     .font(.system(size: 26))}
                    .foregroundColor(.black)
                    .padding()
                  .overlay(
                                      RoundedRectangle(cornerRadius: 20)
                                          .stroke(Color.black, lineWidth: 2)
                                  )
            }

            }.frame(width: UIScreen.main.bounds.width)
        .padding()
        }
        
    }.onAppear(){
    self.tag = 4
    }.navigationViewStyle(StackNavigationViewStyle())
  }
   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    ContentView()
    }
}

