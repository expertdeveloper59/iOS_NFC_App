//
//  SignupBG.swift
//  Statis
//
//  Created by Fateh Khan on 31/01/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct ACurve: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color("AppGreen")
//            Circle().fill(Color.white)
//                .position(CGPoint(x: screenSize.width*1.4, y: -1*(screenSize.height/3.2)))
//                .frame(width: 1300, height: 700, alignment: .center)
        }
        .background(Color("AppGreen"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ACurve_Previews: PreviewProvider {
    static var previews: some View {
        ACurve()
    }
}
