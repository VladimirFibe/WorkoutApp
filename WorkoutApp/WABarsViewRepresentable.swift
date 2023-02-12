//
//  WABarsViewRepresentable.swift
//  WorkoutApp
//
//  Created by Vladimir Fibe on 1/31/23.
//

import SwiftUI

struct WABarsViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> WABarsView {
        WABarsView()
        
    }
    
    func updateUIView(_ uiView: WABarsView, context: Context) {
        
    }
}

struct WABarsViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        WABarsViewRepresentable()
    }
}
