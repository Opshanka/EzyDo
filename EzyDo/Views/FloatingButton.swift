//
//  FloatingButton.swift
//  EzyDo
//
//  Created by Opshanka Prabath on 1/3/24.
//

import SwiftUI

struct FloatingButton: View 
{
    @EnvironmentObject var dateHolder: DateHolder

  
    var body: some View {
        Spacer()
        HStack{
            NavigationLink(destination: TaskEditView(passedTaskItem: nil, initialDate: Date()).environmentObject(dateHolder)){
                Text("+ New Task").font(.headline)
            }
        }.padding(15).foregroundColor(.white).background(Color.accentColor).cornerRadius(30).padding(30).shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius: 3, x:3 )
    }
}

#Preview {
    FloatingButton()
}
