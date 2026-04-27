
import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
//            ActivityIndicator()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                // increase the size of the spinner
                .scaleEffect(1.5)
        }
    }
    
}
