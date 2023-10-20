//
//  DropDownView.swift
//  SwiftUIDropDown
//
//  Created by Shivaditya Kr on 19/10/23.
//

import SwiftUI


// A custom SwiftUI view called DropDownView that displays a dropdown menu.
struct DropDownView<Control, Dropdown>: View where Control: View, Dropdown: View {
    // Binding to control the visibility of the dropdown.
    @Binding var show: Bool
    // Closures representing the content of the dropdown control and the dropdown menu.
    let control: () -> Control
    let dropdown: () -> Dropdown
    
    // The body of the view containing UI elements and their behaviors.
    var body: some View {
        // Custom control view.
        control()
            // Set opacity based on dropdown visibility.
            .opacity(show ? 0.7 : 1.0)
            // Set Z index to control layering of views.
            .zIndex(1)
            // Add tap gesture to toggle dropdown visibility.
            .onTapGesture {
                show.toggle()
            }
            // Overlay to position dropdown relative to the bottom leading edge of the control.
            .overlay(alignment: .bottomLeading) {
                Group {
                    // Display dropdown if show is true.
                    if show {
                        dropdown()
                            .transition(.opacity)
                            .padding(.top, 1)
                    }
                }
                // Align dropdown with the bottom edge of the control.
                .alignmentGuide(.bottom) { $0[.top] }
            }
            // Apply animation to the dropdown appearance.
            .animation(.easeOut(duration: 0.2), value: show)
    }
}
