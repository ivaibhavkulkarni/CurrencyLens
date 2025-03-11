//
//  ContentView.swift
//  MoneyLens
//
//  Created by Vaibhav kulkarni on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isConvertMode = false
    @State var showAppInfo = false
    
    var body: some View {
        ZStack {
            VStack {
                Text(isConvertMode ? "Convert the Currency" : "Scan the Currency")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Image(systemName: isConvertMode ? "repeat" : "scanner")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)
                
                Spacer()
                
                // Main Container
                if isConvertMode {
                    Text("Converter Container")
                } else {
                    Text("Scanner Container")
                }
                
                Spacer()
                
                // Container for Horizontal images (Buttons)
                HStack(spacing: 30) {
                    Button(action: { isConvertMode = false }) {
                        Image(systemName: "scanner")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(isConvertMode ? .gray : .black)
                    }
                    
                    Rectangle()
                        .frame(width: 5, height: 50)
                        .foregroundColor(.black)
                    
                    Button(action: { isConvertMode = true }) {
                        Image(systemName: "repeat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(isConvertMode ? .black : .gray)
                    }
                }
                .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    Button {
                        showAppInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing)
                }
                .sheet(isPresented: $showAppInfo) { AppInfo() }
            }
        }
    }
}

#Preview {
    ContentView()
}
