//
//  VIHome_VolunteerHome.swift
//  DearFriend
//
//  Created by Tony Nguyen on 25/11/24.
//

import SwiftUI

struct StartView_VIMainSelection: View {
    @State var isShowStartView: Bool = true
    
    var body: some View {
        if (isShowStartView) {
            StartView(isShowStartView: $isShowStartView)
        } else {
            VIMainSelectionView(isShowStartView: $isShowStartView)
        }
    }
}

#Preview {
    StartView_VIMainSelection()
}
