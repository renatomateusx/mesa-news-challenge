//
//  LoginView.swift
//  MesaNews
//
//  Created by Renato Mateus on 16/02/21.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM = LoginVM()
    
    @State var Username:String = "john@doe.com"
    @State var Password:String = "123456"
    @State var isOn:Bool = false
    var body: some View {
        NavigationView{
            NavigationLink(destination: DashView(), isActive: self.$isOn){
                HStack {
                    VStack {
                        VStack(alignment: .trailing) {
                            Text("Mesa")
                                .font(.system(size: 45, weight: .heavy))
                            Text("News")
                                .font(.system(size: 25, weight: .heavy))
                                .foregroundColor(.gray)
                        }
                        
                        TextField("Username", text: $Username)
                            .padding()
                            .background(Color("flash-white"))
                            .cornerRadius(4.0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        
                        SecureField("Password", text: $Password)
                            .padding()
                            .background(Color("flash-white"))
                            .cornerRadius(4.0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        
                        Button(action: submit) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Sign In")
                                    .foregroundColor(.white).bold()
                                Spacer()
                            }
                        }.padding().background(Color.green).cornerRadius(4.0)
                        Button(action: submit) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("Sign Up")
                                    .foregroundColor(.white).bold()
                                Spacer()
                            }
                        }.padding().background(Color.blue).cornerRadius(4.0)
                        
                    }
                   
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
    func submit(){
        let login = Login(email: self.Username, password: self.Password)
        LoginVM().doLogin(login: login)
        self.isOn.toggle()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
