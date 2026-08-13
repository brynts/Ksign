//
//  AboutNyaView.swift
//  Sileo
//
//  Created by Nagata Asami on 23/5/25.
//

import SwiftUI
import NimbleViews
import NimbleJSON

// MARK: - View
struct AboutNyaView: View {
	private let _dataService = NBFetchService()
	
	// MARK: Body
	var body: some View {
		NBList(.localized("About")) {
            Section {
                VStack {
                    Image(uiImage: (UIImage(named: Bundle.main.iconFileName ?? ""))! )
                        .appIconStyle(size: 72)
                    
                    Text("Sileo")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.accent)
                    
                    HStack(spacing: 4) {
                        Text("Version")
                        Text(Bundle.main.version)
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity)
            .listRowBackground(EmptyView())
			
			NBSection(.localized("Credits")) {
				HStack(spacing: 9) {
					Image("BryntsAvatar")
						.appIconStyle()
					
					NBTitleWithSubtitleView(
						title: "brynts",
						subtitle: "Developer",
						linelimit: 0
					)
					
					Spacer()
					Image(systemName: "arrow.up.right")
						.foregroundStyle(.secondary)
				}
				.onTapGesture {
					if let url = URL(string: "https://github.com/brynts") {
						UIApplication.shared.open(url)
					}
				}
			}
			
			NBSection("Special thanks!") {
				Group {
					Text(.localized("This couldn't have been done without the original Feather & KSign devs!"))
						.foregroundStyle(.secondary)
						.padding(.vertical, 2)
				}
				.transition(.slide)
			}
            
            NBSection("Acknowledgements") {
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Text("About the original Feather")
                        Spacer()
                    }
                }
            } footer: {
                Text(Bundle.main.bundleIdentifier ?? "")
            }
		}
	}
}
