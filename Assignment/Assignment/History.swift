//
//  History.swift
//  Assignment
//
//  Created by Charan on 09/04/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI

struct History: View {
    
    @EnvironmentObject var truth:SourceOfTruth
     @Environment(\.managedObjectContext) var managedObjectContext
    static let taskDateFormat: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
           return formatter
       }()
    @FetchRequest(entity: History_view.entity(), sortDescriptors: []) var historyview: FetchedResults<History_view>
    var body: some View {
        NavigationView{
               ZStack{
                Color.init(red: 224/255, green: 80/255 , blue: 78/255)
                .edgesIgnoringSafeArea(.all)
                VStack( alignment:.center,spacing:10){
                    HStack(spacing:10){
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.lefthalf.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                    Text("Past Rating").font(.largeTitle)
                   List{
                    ForEach(historyview,id:\.id) { historY in
                            VStack(alignment:.leading) {
                                Text("Rating:\(Int(historY.rating))")
                                    .font(.headline)
                                Text("Date:\(historY.dates!, formatter: Self.taskDateFormat) ")
                                    .font(.subheadline)
                            }
                    }
                    .onDelete { (indexSet) in
                        let historyToDelete = self.historyview[indexSet.first!]
                        self.managedObjectContext.delete(historyToDelete)

                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }

                .font(.headline)
                    }.colorMultiply(Color(red: 224/255, green: 80/255 , blue: 78/255))
                }.frame(width: UIScreen.main.bounds.width)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: MyBackButton_2(label: "Back") {
               self.truth.viewtag = 4
           },trailing: EditButton())
  
        
    }
    
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
struct MyBackButton_2: View {
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

