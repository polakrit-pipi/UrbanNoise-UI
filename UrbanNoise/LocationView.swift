//
//  LocationView.swift
//  UrbanNoise
//
//  Created by polakrit krajaisri on 22/10/2565 BE.
//

import SwiftUI
import MapKit

struct Carlocation: Identifiable{
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let carLocations = [Carlocation(latitude: 13.90141611944978, longitude: 100.39686678862239)]

struct LocationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.90141611944978, longitude: 100.39686678862239),span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    var body: some View {
        ZStack {
            Map(coordinateRegion: $location,annotationItems: carLocations,annotationContent: {location in MapAnnotation(coordinate: location.coordinate, content: {CarPin()})})
            
            CarLocationPanel()
            
            LinearGradient(gradient: Gradient(colors: [Color("DarkGray"), Color.clear,Color.clear]), startPoint: .top, endPoint: .bottom)
                .allowsHitTesting(false)
            
            
            VStack {
                HStack{
                    Button(action:{
                        presentationMode.wrappedValue.dismiss()
                    }){
                        
                        GeneralButton(icon: "chevron.left")
                    }
                    
                    Spacer()
                    Button(action:{}){
                        GeneralButton(icon: "speaker.wave.3.fill")
                    }
                    
                }
                .padding()
                Spacer()
            }
        
    
    }
    .frame(maxWidth: .infinity,maxHeight: .infinity)
    .background(Color("DarkGray"))
    .foregroundColor(Color.white)
    .navigationTitle("Person Location")
    .navigationBarHidden(true)
        }
    }
struct CarPin: View{
    var body: some View{
        VStack(alignment: .center, spacing: (4)){
            Image(systemName: "person.fill")
                .frame(width:36,height:36,alignment: .center)
                .background(Color.pink)
                .foregroundColor(Color.white)
                .clipShape(Circle())
            
            Text("Daughter")
                .padding(.horizontal,8)
                .padding(.vertical,4)
                .font(.footnote)
                .fontWeight(.medium)
                .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 8,style:.continuous))
                .overlay(RoundedRectangle(cornerRadius: 8,style: .continuous).stroke(Color.black.opacity(0.1),lineWidth: 1))
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct CarLocationPanel: View {
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading,spacing: 20){
                VStack(alignment: .leading,spacing: 10){
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                       
                    CustomDivider()
                    Label("20 W 34th Nonthaburi , TH  11000", systemImage: "location.fill")
                        .font(.footnote)
                        .opacity(0.5)
                }
                VStack(alignment: .leading,spacing: 10){
                    VStack(alignment: .leading,spacing: 5){
                        Text("Daughter")
                            .font(.headline)
                            .fontWeight(.semibold)
                           
                        Text("Press Go to Target for go to Daughter's location")
                            .opacity(0.5)
                            .font(.footnote)
                    }
                    CustomDivider()
                   FullButton(text: "Go to Target")
                    HStack{
                        FullButton(text:"Back",icon:"arrow.left")
                        FullButton(text:"Next",icon:"arrow.right")
                    }
                }

            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(Color.white)
        }
    }
}
