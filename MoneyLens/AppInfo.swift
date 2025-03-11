//
//  AppInfo.swift
//  MoneyLens
//
//  Created by Vaibhav kulkarni on 25/02/25.
//

import SwiftUI

struct AppInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 40) {
            InfoSection(icon: "scanner", text: "Here, you can scan a currency note, and the system will provide the result through audio. This feature helps in easily identifying different currencies without any manual effort.")
            
            InfoSection(icon: "repeat", text: "You can also check real-time currency exchange details, such as the conversion rate of 1 Indian Rupee to US Dollar and other global currencies. Stay updated with the latest exchange rates at your convenience.")
            
            Button("Done") {
                dismiss()
            }
            .font(.title3)
            .frame(width: 140, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(25)
            .padding(.top, 10)
        }
        .padding()
    }
}

struct InfoSection: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.black)
            
            Text(text)
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.black)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

#Preview {
    AppInfo()
}
