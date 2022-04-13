//
//  ContentView.swift
//  CICD-Front
//
//  Created by Sam DuBois on 4/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text(message)
            Spacer()
            Button(action: {
                Task {
                        let (data, _) = try await URLSession.shared.data(from: URL(string:"http://localhost:8000/")!)
                        let decodedResponse = try? JSONDecoder().decode(Message.self, from: data)
                        message = decodedResponse?.msg ?? ""
                    }
            }) {
                HStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                        Text("Contact Server")
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
