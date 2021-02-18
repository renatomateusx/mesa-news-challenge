//
//  ContentView.swift
//  MesaNews
//
//  Created by Renato Mateus on 10/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if(UserDef.isAuthenticated()){
            DashView()
        }
        else{
            LoginView()
        }
    }
}

struct DashView: View{
    @State private var selectedTabIndex = 0
    @State var isOn:Bool = false
    func logout(){
        UserDef.setToken(token: "")
        self.isOn.toggle()
    }
    var body: some View {
        NavigationView {
            NavigationLink(destination: LoginView(), isActive: self.$isOn) {
                TabView(){
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                HeaderView()
                            }
                            .padding(.bottom, 10)
                            
                            VStack {
                                Text("HighLights")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 25.0, weight:.heavy))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 5)
                                HighLightView()
                            }
                            VStack{
                                Text("Today News")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 25.0, weight:.heavy))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 5)
                                
                               
                                MesaNewsListView()
                            }
                        }
                    }
                    .tag(0)
                    .tabItem {
                        VStack {
                            Image(systemName: "eyeglasses")
                                .font(.system(size:24.0))
                            Text("Mesa News")
                        }
                    }
                    
                    
                    VStack{
                        Button(action: logout) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Logout")
                                    .foregroundColor(.white).bold()
                                Spacer()
                            }
                        }.padding().background(Color.green).cornerRadius(4.0)
                            
                    }
                    .tag(1)
                    .tabItem {
                        VStack {
                            Image(systemName: "person.2")
                                .font(.system(size:24.0))
                            Text("Logout")
                        }
                    }
                }
                .accentColor(.pink)
                .navigationBarBackButtonHidden(true)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
