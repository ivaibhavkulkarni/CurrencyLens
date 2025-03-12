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
                // Show Camera Preview when in Scan Mode
                if isConvertMode {
                    Text("Converter Container")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                } else {
                    CameraView()
                        .frame(height: 500)
                        .cornerRadius(50)
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 2)
                                .padding(.horizontal)
                        )
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
                            .frame(height: 5)
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
