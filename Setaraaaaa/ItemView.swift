//
//  ItemView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI

struct ItemView: View {
    
    @State var checkState: Bool = false
    @State private var isToggle: Bool = false
    @State private var optionCategory = ["Food", "Taxi", "Other"]
    @State private var nameItem: String = ""
    @State private var basePrice: String = ""
    @State private var showingAlert = false
    @State var participant: String
    
    var body: some View {
        
        var nameParticipant: String = "Me"
        
        VStack {
            NavigationView() {
                VStack {
                    List {
                        ForEach(0..<3) {i in
                            HStack {
                                
                                Text("Mie Tarempa")
                                    .fontWeight(.regular)
                                    .font(.system(size: 16))
                                    .padding(.trailing, 120)
                                
                                
                                Text("IDR 35.000")
                                    .fontWeight(.light)
                                    .font(.system(size: 16))
                                    .padding(.leading, 50)
                                
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "trash")
                                } .tint(.red)
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "pencil")
                                } .tint(.gray)
                                
                            })
                        }
                        
                        
                        
                        .listRowSeparator(.hidden)
                        
                        
                    }
                    VStack(alignment: .center) {
                        
                        Text("Add Item")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                        HStack {
                            
                            Text("Category")
                                .padding(.trailing, 200)
                                .padding(.bottom,5)
                            
                            
                            Picker("Test", selection: $optionCategory) {
                                ForEach(optionCategory, id: \.self)  { category in
                                    Text(category)
                                }
                            }.padding(.leading, 10)
                        }
                        
                        HStack {
                            Text("Name")
                                .padding(.leading, 15)
                                
                            TextField("Item", text: $nameItem)
                                .padding(.leading, 40)
                                .frame(maxWidth: .infinity)
                                .lineLimit(2)
                                
                        }
                        
                        HStack {
                            Text("Base Price")
                                .padding(.leading, 15)
                                
                            
                            TextField("Enter the number", text: $basePrice)
                                .padding(.leading, 5)
                                                                
                        }.padding(.top,5)
                        
                        
                        HStack() {
                            
                            Text("Disc")
                                .padding(.leading, 5)
                            
                            Toggle (isOn: $isToggle)  {
                                
                            }
                            .padding(.trailing,135)
                            
                            
                            
                            HStack {
                                
                                Button("%") {
                                    
                                }
                                .buttonStyle(.bordered)
                                .foregroundColor(.black)
                                .background(.white)
                                .padding(.trailing,15)
                                
                                .alert(Text("Discount"), isPresented: $showingAlert) {
                                    
                                    TextField("Enter your", text: $nameItem)
                                    
                                }
                                
                              
                                
                                
                                Button("IDR") {
                                    
                                }
                                .buttonStyle(.bordered)
                                .alert(Text("Discount"), isPresented: $showingAlert) {
                                    
                                    TextField("Enter your", text: $nameItem)
                                    
                                }
                            }
                            .padding(.trailing,10)
                            .background(.gray)
                            .cornerRadius(3)
                            
                            
                            
                        }
                        .padding(.leading, 10)
                        .padding(.top,60)
                        
                        HStack {
                            Text("Tax")
                            
                            Toggle (isOn: $isToggle) {
                                
                            }
                            
                        }.padding(.leading, 14)
                            .padding(.trailing,260)
                        
                        HStack {
                            Text("Fee")
                                .padding(.leading, 15)
                            
                            Toggle(isOn: $isToggle) {
                                
                            }
                            .padding(.trailing,260)
                        }
                        
                        Button{}
                    label: {
                        Text("Add")
                    }
                    .frame(width: 200)
                    .frame(height: 30)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(.bottom, 100)
                    .padding(.top, 20)
                        
                    }
                    .padding(.bottom, 20)
                    
                    
                    
                } .listStyle(.plain)
                    .navigationTitle("Sutedjo")
                    .toolbar() {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                                
                                Button{}
                            label: {
                                Text("Back")
                            } .padding(.trailing, 200)
                                
                                Button{}
                            label: {
                                Text("Edit")
                            }.padding(.leading, 80)
                                    .padding(.trailing,20)
                                
                            }
                        }
                    }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView( participant: "")
    }
}
