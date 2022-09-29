//
//  TestView.swift
//  MyApp
//
//  Created by Максим Боталов on 30.09.2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        GeometryReader { proxy in
            let safeArea = proxy.safeAreaInsets
            
            VStack {
                HStack {
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(.top, 10 + safeArea.top)
                }
                .ignoresSafeArea(.all)
                Text("\(safeArea.top)")
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
