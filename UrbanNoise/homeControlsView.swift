//
//  CarControlsView.swift
//  UrbanNoise
//
//  Created by polakrit krajaisri on 22/10/2565 BE.
//

import SwiftUI

let carControls: [ActionItem] = [ActionItem(icon: "lightbulb", text: "Light"),ActionItem(icon: "music.note", text: "Media"),ActionItem(icon:"curtains.closed" , text: "Curtain"),ActionItem(icon: "fanblades.fill", text: "Fan On"),ActionItem(icon: "person.fill.viewfinder", text: "Add Face"),ActionItem(icon: "person.fill.viewfinder", text: "Add Face"),ActionItem(icon: "person.fill.viewfinder", text: "Add Face"),ActionItem(icon: "waveform.slash", text: "Active Noise Cancelling")]
struct CarControlsView: View {
    
    
    
    
    @State private var openMedia = false
    @State private var openCharging = false
    @State private var actionText = ""
    @State private var actionIcon = ""
    @State private var openAction = false
    @State private var openActiveNoiseCancelling = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var toggleValet:Bool = false
    
    var body: some View {
  
      
                
                ScrollView{
                    VStack(spacing: 20){
                        VStack(alignment: .leading,spacing: 10) {
                            HStack{
                                Button(action:{
                                    presentationMode.wrappedValue.dismiss()
                                }){
                                    
                                    GeneralButton(icon: "chevron.left")
                                }
                                Spacer()
                            }
                            Text("Home Contorls").font(.title2).fontWeight(.semibold)
                        }
                        CustomDivider()
                        CarLockButton()
                        CustomDivider()
                        CarControlActions(openCharging: $openCharging,openMedia: $openMedia,openActiveNoiseCancelling: $openActiveNoiseCancelling)
                        CustomDivider()
                        HStack{
                            
                            Text("Auto Adjust Mode").fontWeight(.medium)
                            Spacer()
                            Toggle("" ,isOn: $toggleValet)
                        }
                   
                    }
                    .padding()
           
                    if (openCharging || openMedia || openActiveNoiseCancelling){
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .transition(.opacity)
                            .onTapGesture {
                                withAnimation{
                                    openCharging = false
                                    openMedia = false
                                    openActiveNoiseCancelling = false
                                }
                            }
                    }
                    
            
            
                    if openCharging {
                        ChargingView()
                            .zIndex(1)
                            .transition(.move(edge: .bottom
                                             ))
                        }
                    
                    if openActiveNoiseCancelling {
                        NoiseCancellingView()
                            .zIndex(1)
                            .transition(.move(edge: .bottom
                                             ))
                        }
                    if openMedia{
                        MediaPlayer()
                            .zIndex(1)
                            .transition(.move(edge: .bottom))
                    }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(Color.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
    }
    
}

struct CarControlsView_Previews: PreviewProvider {
    static var previews: some View {
        CarControlsView()
    }
}

struct CarLockButton: View {
    var body: some View {
        Button(action: {}){
            FullButton(text: "Lock This Preset",icon: "lock.fill")
        }
    }
}

struct CarControlActions: View {
    
    @Binding var openCharging: Bool
    @Binding var openMedia: Bool
    @Binding var openActiveNoiseCancelling: Bool
    var body: some View {
        VStack(spacing: 20) {
            
            
            HStack{
                Spacer()
                Button(action: {
                    withAnimation{
                        openCharging = true
                    }
                }){
                    ActionButton(item: carControls[0])
                }
                Spacer()
                Button(action: {
                    withAnimation{
                        openMedia = true
                    }
                    
                }){
                    ActionButton(item: carControls[1])
                }
                Spacer()
                Button(action: {
                    
                }){
                    ActionButton(item: carControls[2])
                }
                Spacer()
                
                
            }
            HStack{
                Spacer()
                Button(action: {
                    
                }){
                    ActionButton(item: carControls[3])
                }
                Spacer()
                Button(action: {
                    
                }){
                    ActionButton(item: carControls[4])
                }
                Spacer()
                Button(action: {
                    withAnimation{
                        openActiveNoiseCancelling = true
                    }
                }){
                    ActionButton(item: carControls[7])
                }
                Spacer()
            }
        }
        .padding()
    }
}
