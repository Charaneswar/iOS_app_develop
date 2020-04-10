//
//  EditView.swift
//  Assignment
//
//  Created by Charan on 09/04/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
import CoreData

struct EditView: View {

//    @Environment(\.managedObjectContext) var managedObjectContext
//
//
//    @Environment(\.presentationMode) var presentationMode

    var history: History_view
    
//
//    @State var updatedRating: Double = 0.0
//    @State var updatedDate: Date
//
    var body: some View {
        EmptyView()
//        VStack {
//            VStack {
//                TextField("Rating", text: $updatedRating)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .onAppear {
//
//                        self.updatedRating = self.history.rating ?? ""
//                }
//
//                TextField("Date", text: $updatedDate)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .onAppear {
//                        self.updatedRating = self.history.date ?? ""
//                }
//            }
//
//            VStack {
//                Button(action: ({
//
//                    self.history.rating = self.updatedRating
//                    self.history.date = self.updatedDate
//
//                    do {
//                        try self.managedObjectContext.save()
//                    } catch {
//                        print(error)
//                    }
//
//                    self.presentationMode.wrappedValue.dismiss()
//                })) {
//                    Text("Save")
//                }
//            .padding()
//            }
//        }
    }
}
