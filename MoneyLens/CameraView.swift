//
//  CameraView.swift
//  MoneyLens
//
//  Created by Vaibhav kulkarni on 12/03/25.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
    
    class CameraViewController: UIViewController {
        var captureSession: AVCaptureSession!
        var previewLayer: AVCaptureVideoPreviewLayer!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupCamera()
        }
        
        func setupCamera() {
            captureSession = AVCaptureSession()
            captureSession.sessionPreset = .high
            
            guard let videoCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
                print("No camera found")
                return
            }
            
            do {
                let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
                if captureSession.canAddInput(videoInput) {
                    captureSession.addInput(videoInput)
                }
            } catch {
                print("Error setting up camera input: \(error)")
                return
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.frame = view.layer.bounds
            view.layer.addSublayer(previewLayer)
            
            DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.async {
                    self.captureSession.startRunning()
                }
            }
        }
    }
}
