//
//  ContentView.swift
//  TodoApplication
//
//  Created by student-2 on 21/08/24.
//

import SwiftUI


struct TodoTask: Hashable {
    var title: String
    var isComplete: Int = 0
    var category: String
    var date: Foundation.Date = Date.now
    var persons: [String]
    
    init(title: String, isComplete: Int = 0, category: String, date: Foundation.Date = Date.now, persons: [String]) {
        self.title = title
        self.isComplete = isComplete
        self.category = category
        self.date = date
        self.persons = persons
    }
}


struct ContentView: View {
    
    @State var count: Int64 = 4
    @State var isNavbarShowing: Bool = false
    
    var ColorShemes: [Color] = [Color("Powder"), Color("Skin"), Color("Grass"), Color("Lips"), Color("Sea")]
    @State var todos: [TodoTask] = [
        TodoTask(title: "Admin Dashboard", category: "all", persons: ["Me"]),
        TodoTask(title: "Going Bank", category: "all", persons: ["Me", "Uddeshya", "Tushar"]),
        TodoTask(title: "Plan Wedding", category: "all", persons: ["Utsav", "Makie"]),
        TodoTask(title: "Buying Milk", category: "all", persons: ["Me", "Soham"]),
        
    ]
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "pencil.slash")
                            .imageScale(.large)
                            .scaleEffect(1.1)
                            .padding(11.5)
                            .overlay(
                                Circle()
                                    .stroke()
                            )
                        Spacer()
                        Image(systemName: "person")
                            .imageScale(.medium)
                            .padding()
                            .background(.black)
                            .foregroundStyle(.white)
                            .cornerRadius(30)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    isNavbarShowing.toggle()
                                }
                            }
                    }
                    .padding(25)
                    
                    
                    // this is the hero heading section
                    Section() {
                        Text("Hello, Uddeshya")
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.gray)
                        Text("Your")
                            .font(.system(size: 50, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(
                                EdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
                            )
                        HStack(spacing: 10) {
                            Text("Projects")
                                .font(.system(size: 50, weight: .bold))
                                .padding(
                                    EdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
                                )
                            
                            Text("\(count)")
                                .font(.system(size: 40, weight: .bold))
                                .padding(
                                    EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                                )
                                .background(.black)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(
                        EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                    )
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(todos, id: \.self) {
                                todo in
                                VStack {
                                    HStack {
                                        Image(systemName: "bookmark")
                                            .imageScale(.large)
                                            .padding(5)
                                            .background(.black)
                                            .foregroundStyle(.white)
                                            .cornerRadius(50)
                                        Spacer()
                                        Image(systemName: "arrow.right")
                                            .imageScale(.large)
                                            .rotationEffect(Angle(degrees: -30))
                                            .padding(7)
                                            .overlay(Circle().stroke())
                                    }
                                    Spacer()
                                    Text("\(todo.title.split(separator: " ")[0])\n\(todo.title.split(separator: " ")[1])")
                                        .font(.system(size: 35, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    HStack {
                                        HStack {
                                            ForEach(0..<todo.persons.count) {
                                                index in
                                                if index == 0 {
                                                   Image(systemName: "person.fill")
                                                        .imageScale(.medium)
                                                        .padding(5)
                                                        .background(.white.opacity(0.5))
                                                        .cornerRadius(50)
                                                } else {
                                                    Image(systemName: "person.fill")
                                                        .imageScale(.medium)
                                                        .padding(5)
                                                        .background(.white.opacity(0.5))
                                                        .cornerRadius(50)
                                                        .offset(x: -20)
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding(
                                        EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                                    )
                                }
                                .frame(minWidth: 250, maxHeight: 250)
                                .padding()
                                .background(ColorShemes.randomElement())
                                .cornerRadius(40)
                            }
                        }
                        .padding(
                            EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
                        )
                    }
                    
                    Spacer()
                }
                .background(.white)
                .cornerRadius(isNavbarShowing ? 40 : 0)
                .padding(
                    EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0)
                )
                .offset(y: isNavbarShowing ? 200 : 0)
            }
            .background(isNavbarShowing ? .black : .white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
