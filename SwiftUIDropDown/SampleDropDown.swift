//
//  SampleDropDownView.swift
//  SwiftUIDropDown
//
//  Created by Shivaditya Kr on 19/10/23.
//

import SwiftUI

// This struct defines a SwiftUI view called SampleDropDownView.
struct SampleDropDownView: View {
    // State variables to track input text, dropdown visibility, and selected option.
    @State private var inputText: String = ""
    @State private var isDropdownVisible = false
    @State private var selectedOption: String? = nil
    // Array of dropdown options.
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6"]
    
    // The body of the view containing UI elements and their behaviors.
    var body: some View {
        // Vertical stack containing UI elements aligned to the leading edge.
        VStack(alignment: .leading) {
            // Custom dropdown view with a selected option display and chevron icon.
            DropDownView(show: $isDropdownVisible) {
                // Custom stylized dropdown button.
                ZStack {
                    // Rounded rectangle border.
                    RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                    HStack {
                        // Display selected option text.
                        Text("\(selectedOption ?? "")")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .padding(.horizontal, 10)
                        Spacer()
                        // Chevron icon indicating dropdown state.
                        Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 12, height: 7)
                            .font(.headline)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                }
                .frame(height: 40)
                .padding(.horizontal, 60)
                
            } dropdown: {
                // Dropdown options displayed in a scrollable list.
                ZStack {
                    // Rounded rectangle border.
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                    // Scrollable list of options.
                    ScrollView {
                        VStack(alignment: .leading) {
                            // Iterate through options and create a button for each.
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    // Set selected option and toggle dropdown visibility.
                                    selectedOption = option
                                    isDropdownVisible.toggle()
                                }, label: {
                                    VStack {
                                        // Stylized option button with rounded rectangle background.
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 5)
                                                .foregroundColor((selectedOption ?? "") == option ? Color.appGrey : Color.white)
                                            Text(option)
                                                .foregroundColor(.gray)
                                        }
                                        // Separator line between options.
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(.gray.opacity(option != options.last ? 0.2 : 0))
                                            .padding(.horizontal, 30)
                                    }
                                    .frame(height: 40)
                                })
                            }
                        }
                    }
                    .frame(height: 200)
                }
                .background(Color.white)
                .padding(.horizontal, 60)
            }
            // Set default selected option on view appear.
            .onAppear {
                self.selectedOption = options[2]
            }
            // Set background color for the entire view.
            .background(Color.white)

            // Additional text below the dropdown.
            Text("Some text....")
        }
    }
}

// Preview for the SampleDropDownView.
#Preview {
    SampleDropDownView()
}
