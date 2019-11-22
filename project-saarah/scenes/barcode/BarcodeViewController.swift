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
        AppUtility.lockOrientation(.portrait)

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
        videoPreviewLayer.connection?.videoOrientation = .portrait
        contentView.imageView.layer.addSublayer(videoPreviewLayer)

        session.startRunning()
    }

    func startBarcodeDetection() {
        let barcodeDetectRequest = VNDetectBarcodesRequest(completionHandler: handleDetectedBarcode)
        barcodeDetectRequest.symbologies = [.Aztec, .EAN13]
        requests = [barcodeDetectRequest]
    }

    var barcode: String?

    func handleDetectedBarcode(request: VNRequest, error: Error?) {
        if let nsError = error as NSError? {
            print(nsError.localizedDescription)
            return
        }

        DispatchQueue.main.async {
            if !self.session.isRunning { return }
            guard let results = request.results as? [VNBarcodeObservation] else { return }
            if let result = results.first {
                if self.contentView.hasContentVisible && self.barcode == result.payloadStringValue { return }
                if self.contentView.hasContentVisible && self.barcode != result.payloadStringValue {
                    self.contentView.animateToHide()
                }
                self.barcode = result.payloadStringValue
                // TODO: Request to API
                self.contentView.presentUndefinedProductViews()
            }
        }
    }

}

extension BarcodeViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        var requestOptions: [VNImageOption: Any] = [:]
        connection.videoOrientation = .portrait
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
