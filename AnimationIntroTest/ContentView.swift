//
//  ContentView.swift
//  AnimationIntroTest
//
//  Created by 최범수 on 2025-01-29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedItem: Item = items.first!
    @State private var introItems: [Item] = items
    var body: some View {
        VStack(spacing: 0) {
            Button {
                
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3.bold())
                    .foregroundStyle(.green.gradient)
                    .contentShape(.rect)    // 너는 뭐하는 친구니?
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(selectedItem.id != introItems.first?.id ? 1 : 0)
            
            
            ZStack {
                ForEach(introItems) { item in
                    AnimatedIconView(item)
                }
            }
            .frame(height: 250)
            .frame(maxHeight: .infinity)
            
            VStack(spacing: 6) {
                HStack(spacing: 4) {
                    ForEach(introItems) { item in
                        Capsule()
                            .fill(selectedItem.id == item.id ? Color.primary : .gray)
                            .frame(width: selectedItem.id == item.id ? 25 : 4, height: 4)
                    }
                }
                .padding(.bottom, 15)
                
                Text(selectedItem.title)
                    .font(.title.bold())
                    .contentTransition(.numericText()) // 이친구 무슨기능하는지 확은 해 봐야함
                Text("Lauren Ipsom is simply dummy text")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                
                Button {
                    
                } label: {
                    Text(selectedItem.id == introItems.last?.id ? "Continue" : "Next")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 250)
                        .padding(.vertical, 12)
                        .background(Color.green.gradient, in: .capsule)
                }
                .padding(.top, 25)
                
            }
            .multilineTextAlignment(.center) // 모든 정렬을 가운데로
            .frame(width: 300)
            .frame(maxHeight: .infinity)
        }
        
        @ViewBuilder
        func AnimatedIconView(_ item: Item) -> some View {
            let isSelected = selectedItem.id == item.id
            Image(systemName: item.image)
                .font(.system(size: 80))
                .foregroundStyle(.white.shadow(.drop(radius: 10)))
                .frame(width: 120, height: 120)
                .background(.green.gradient, in: .rect(cornerRadii: 35))
                .background {
                    RoundedRectangle(cornerRadius: 35)
                        .fill(.background)
                        .shadow(color: .primary.opacity(0.2), radius: 1, x: 1, y: 1)
                        .shadow(color: .primary.opacity(0.2), radius: 1, x: -1, y: -1)
                        .padding(-3)
                        .opacity(selectedItem.id == item.id ? 1 : 0)
                }
                .rotationEffect(.init(degrees: item.rotation))
                .scaleEffect(isSelected ? 1.1 : item.scale, anchor: item.anchor)
                .offset(x: item.offset)
                .rotationEffect(.init(degrees: item.rotation))
            
        }
        
    }
}

#Preview {
    ContentView()
}
