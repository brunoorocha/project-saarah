//
//  BarcodeViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

protocol BarcodeDisplayLogic: class {
	func displaySomething(viewModel: Barcode.Something.ViewModel)
}

class BarcodeViewController: UIViewController, BarcodeDisplayLogic {
	// MARK: Architeture Property
	var interactor: BarcodeBusinessLogic?
	var router: (NSObjectProtocol & BarcodeRoutingLogic & BarcodeDataPassing)?

	// MARK: Controller Property
	private var contentView = BarcodeView()
    var requests: [VNRequest] = []
    let session = AVCaptureSession()
    var device: AVCaptureDevice!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
		doSomething()

        startLiveVideo()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.flashAction))
        self.view.addGestureRecognizer(tap)
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        BarcodeBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.landscapeRight)

        startBarcodeDetection()
        session.startRunning()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.all)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        session.stopRunning()
    }

    override func viewDidLayoutSubviews() {
        videoPreviewLayer.frame = view.bounds
    }

	func setupContentView() {
		title = "Barcode"
		view = contentView
	}

	// MARK: Do something
	func doSomething() {
		let request = Barcode.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Barcode.Something.ViewModel) {
	}

    // MARK: Camera settings
    private func startLiveVideo() {
        session.sessionPreset = AVCaptureSession.Preset.high

        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard let deviceInput = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        device = captureDevice
        let deviceOutput = AVCaptureVideoDataOutput()
        deviceOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))

        session.addInput(deviceInput)
        session.addOutput(deviceOutput)
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
        videoPreviewLayer.connection?.videoOrientation = .landscapeRight
        contentView.imageView.layer.addSublayer(videoPreviewLayer)

        session.startRunning()
    }

    func startBarcodeDetection() {
        let barcodeDetectRequest = VNDetectBarcodesRequest(completionHandler: handleDetectedBarcode)
        barcodeDetectRequest.symbologies = [.Aztec, .EAN13]
        requests = [barcodeDetectRequest]
    }

    func handleDetectedBarcode(request: VNRequest, error: Error?) {
        if let nsError = error as NSError? {
            print(nsError.localizedDescription)
            return
        }

        DispatchQueue.main.async {
            if !self.session.isRunning { return }
            guard let results = request.results as? [VNBarcodeObservation] else { return }
            if let result = results.first {
                print(result.payloadStringValue ?? "")
                self.contentView.presentUndefinedProductViews()
            }
        }
    }

    @objc func flashAction() {
        if (device.hasTorch) {
            session.beginConfiguration()
            flashEnabled(!device.isTorchActive)
            self.session.commitConfiguration()
        }
    }

    private func flashEnabled(_ enabled: Bool) {
        do {
            if (device.hasTorch) {
                try device.lockForConfiguration()
                if enabled {
                    device.torchMode = .on
                    device.flashMode = .on
                } else {
                    device.torchMode = .off
                    device.flashMode = .off
                }
                device.unlockForConfiguration()
            }
        } catch {
            print("Device tourch Flash Error ")
        }
    }
}

extension BarcodeViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        var requestOptions: [VNImageOption: Any] = [:]
        connection.videoOrientation = .landscapeRight
        if let camData = CMGetAttachment(sampleBuffer, key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, attachmentModeOut: nil) {
            requestOptions = [.cameraIntrinsics: camData]
        }

        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: CGImagePropertyOrientation.right, options: requestOptions)

        do {
            try imageRequestHandler.perform(requests)
        } catch {
            print(error)
        }
    }
}
