//
//  ContentView.swift
//  gggggggg
//
//  Created by Ghada Al on 16/01/1445 AH.
//
import SwiftUI



struct ContentView: View {
    @State  var email = ""
    @State  var password = ""
    @State  var isEmailValid = true
    @State  var isPasswordValid = true
    @State  var showAlert = false

   var platform = [
    Platform(name: "xbox", imageName:"xbox.logo", color: .green), Platform(name: "Playstation", imageName:"Playstation.logo", color: .indigo) , Platform(name: "pc", imageName:"pc", color: .pink), Platform(name: "Mobile", imageName:"iphone", color: .mint)
   ]
    
    var body: some View {
        NavigationView {
            Form{
            List{
             ForEach(platform) { platform in
                 Section(header: Text(platform.name)){
                NavigationLink(destination: DetailView(platform: platform)) {
                    Text(platform.name)
                }
                  
                }
            }
            .navigationTitle("Platforms")
        }
            
                
                List{
                    TextField("Email", text: $email)
                        .onChange(of: email) { newValue in
                            isEmailValid = isValidEmail(newValue)}
                    
                    TextField("Password", text: $password)
            
                    
                    Button(action: {
                                  
                                    if isEmailValid && isPasswordValid {
                                       
                                    } else {
                                        showAlert = true
                                    }
                                })
                
                                 {
                                Text("Login")
                                  }
                    
                }
             
                    }
            
    }
        .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid Input"),
                        message: Text("Please enter a valid email and password.")
                    )
                }
    
}
    func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        
        func isValidPassword(_ password: String)  {
            if password.count < 4 {
                showAlert = true
            }
            else {
                showAlert = false
            }
        }
    
}

struct DetailView: View {
    let platform: Platform
    
    var body: some View {
        Text("Detail view for \(platform.name)")
            .navigationTitle(platform.name)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabView{
                ContentView()
                
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Home Screen")

                    }
                ContentView()
                
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("profile")
                    }
                ContentView()
                
                    .tabItem {
                        Image(systemName: "tray.and.arrow.down.fill")
                        Text("3")
                    }
                
                
            
        ContentView()
    }
        }
        
    }
}

struct Platform: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let color: Color
    }
