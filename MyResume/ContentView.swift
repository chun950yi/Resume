//
//  ContentView.swift
//  MyResume
//
//  Created by TBCASoft-Bennett on 2022/8/1.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    @State var isShowingContact = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30){
                cardView
                
                Text(me.bio).font(.title3).lineSpacing(10)
                
                Button {
                    isShowingContact = true
                    
                    
                } label: {
                    Text("Contact Me")
                        .foregroundColor(.white)
                        .font(.title2.weight(.bold))
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))
                }
                
                Text("Skills")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                skillView
                
                Text("Experience")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                experienceView
                
            }
            .padding()
            .overlay(
                Color.black.opacity(isShowingContact ? 0.5 : 0)
                .onTapGesture{ isShowingContact = false }
            )
            .overlay(alignment: .top) { contactView }
            .animation(.spring(), value: isShowingContact)
            
            
        }.background(Color(uiColor: .secondarySystemBackground))
    }
    
    var cardView: some View {
        HStack(){
            Image("avatar")
                .resizable().aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 180)
            
            VStack(spacing: 20){
                Text(me.name)
                    .font(.title2).bold()
                Text(me.title)
                Label(me.location, systemImage: "location.fill")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var skillView: some View {
        HStack{
            ForEach(me.skills, id: \.self) { skill in
                VStack{
                    Group{
                        Image(skill.lowercased())
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        Text(skill)
                            .font(.body)
                    }.frame(maxWidth: .infinity)
                }
            }
            
        }
    }
    
    var experienceView: some View {
        VStack(spacing: 0){
            ForEach(me.experiences.indices, id: \.self) { index in
                HStack {
                    
                    DotLineShape(lineWidth: 2, dotSize: 10, style:  index == 0 ? .topHalf : index == me.experiences.count - 1 ? .bottomHalf : .full)
                        .frame(width: 70)
                        .foregroundColor(.secondary)
                    
                    let exp = me.experiences[index]
                    VStack(spacing: 8){
                        Group{
                            Text(exp.start + "-" + exp.end)
                                .foregroundColor(.secondary)
                            Text(exp.title)
                                .bold()
                            Text(exp.company).padding(.bottom, 30)
                            
                        }.frame(maxWidth: .infinity, alignment: . leading)
                    }
                }
            }
        }
    }
    
    var contactView: some View {
        Group{
            if isShowingContact {
                ContactView(isShowing: $isShowingContact)
                    .offset(y: UIScreen.main.bounds.maxY * 0.32)
                    .transition(.slide)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
