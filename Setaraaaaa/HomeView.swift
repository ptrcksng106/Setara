//
//  HomeView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var checkState: [Bool] = [false, false]
    @State private var btnActive: Bool = true
    @State var checkCount: Int = 0
    @State var nameParticipant: [String] = ["Me", "test"]
    @State private var navigated = false
    @State var listName: [ListName] = [ListName(name: "Me", isChecked: false), ListName(name: "test", isChecked: false)]
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                VStack() {
                    List {
                        
                        ForEach(0..<nameParticipant.count, id:\.self) { index in
                            HStack {
                                Button(action:
                                        {
                                    
                                    
                                    //1. Save state
                                    self.checkState[index] = !self.checkState[index]
                                    
                                    self.listName[index].isChecked = !self.listName[index].isChecked
                                    
                                    print("State : \(self.checkState)")
                                    
                                    if(checkState[index] == true) {
                                        checkCount += 1
                                        
                                    } else {
                                        checkCount -= 1
                                    }
                                    
                                    if checkCount < 2 {
                                        self.btnActive = true
                                    }else  {
                                                                                                                        
                                        self.btnActive = false
                                    }
                                    
                                    
                                })
                                {
                                    HStack( spacing: 10) {
                                        
                                        
                                        Text("\(nameParticipant[index])")
                                        
                                            .lineLimit(1)
                                            .frame(width: 200, alignment: .leading)
                                        
                                        
                                        Rectangle()
                                            .fill(self.checkState[index] ? Color.orange : Color.gray)
                                            .frame(width:20, height:20, alignment: .center)
                                            .cornerRadius(5)
                                            .padding(.leading, 120)
                                        
                                        
                                        
                                        
                                    }
                                }
                                .foregroundColor(Color.black)
                                
                                
                                
                            }
                        }
                    }
                    
                    Button{
                        
                        alertTF(title: "Add Participants Name", message: "Enter the names of the person in your group", hintText: "Name", primaryTitle: "Cancel", secondaryTitle: "Add") { text in
                            
                            nameParticipant.append(text)
                            checkState.append(false)
                            
                            listName.append(ListName(name: text, isChecked: false))
                            
                            
                        } secondaryAction: {
                            print("Cancelled")
                        }
                    }
                    
                    
                label: {
                    Text("Add Person")
                        .fontWeight(.bold)
                        .font(.system(.title2, design: .rounded))
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.bottom, 100)
                .frame(height: 200)
                    
                }
                
                .listStyle(.plain)
                .navigationTitle("Participants")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink(destination: TablePlateView(listNameTable: listName), isActive: $navigated) {
                            Button(
                                action: {
                                    
                                    navigated = true
                                    
                                }, label: {
                                    Text("Next")
                                }
                            )
                            .disabled(btnActive)
                        }
                        
                        
                    }
                }
            }
        }
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension View {
    func alertTF(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primaryAction: @escaping (String)->(), secondaryAction: @escaping ()->()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        alert.addAction(.init(title: primaryTitle, style: .cancel, handler: { _ in secondaryAction()}))
        
        alert.addAction(.init(title: secondaryTitle, style: .default, handler: { _ in
            
            if let text = alert.textFields?[0].text {
                primaryAction(text)
            }
            else {
                primaryAction("")
            }
            
        }))
        
        rootController().present(alert, animated: true, completion: nil)
    }
    
    func rootController()->UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return.init()
        }
        
        return root
    }
    
}
