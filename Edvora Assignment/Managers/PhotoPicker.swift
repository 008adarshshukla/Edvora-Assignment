//
//  PhotoPicker.swift
//  Edvora Assignment
//
//  Created by Adarsh Shukla on 02/09/22.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var profileImage: UIImage
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.profileImage = image
            }
            picker.dismiss(animated: true)
        }
    }
}
