//
//  DownloadAnimationViewController.swift
//  AnimationExample
//
//  Created by Oleg Ten on 5/25/20.
//  Copyright © 2020 Oleg Ten. All rights reserved.
//

import UIKit

class DownloadAnimationViewController: UIViewController, URLSessionDownloadDelegate {
    
    var shapelayer = CAShapeLayer()
    let percentagelabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(percentagelabel)
        percentagelabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentagelabel.center = view.center
        
        circleSetup()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGestureHandle)))
        
    }
    
    @objc func tapGestureHandle(){
        
        downloadFile()
//        animateCircle()
        
    }
    //Download file from url
    func downloadFile() {
        shapelayer.strokeEnd = 0
        percentagelabel.text = "0%"
        
        print("download file")
        let urlString = "https://upload.wikimedia.org/wikipedia/commons/9/92/Ba_b_do8mag_c6_big.png"
        
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: urlString) else { return }
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        
    }
    
    
    func circleSetup(){
        
//        let centerView = view.center
        let circlePath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let trackLayer = CAShapeLayer()
        trackLayer.lineCap = CAShapeLayerLineCap.round
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.position = view.center
        
        view.layer.addSublayer(trackLayer)
        
        
        shapelayer.lineCap = CAShapeLayerLineCap.round
        shapelayer.path = circlePath.cgPath
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.strokeColor = UIColor.green.cgColor
        shapelayer.lineWidth = 10
        shapelayer.position = view.center
        shapelayer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
        shapelayer.strokeEnd = 0
        
        view.layer.addSublayer(shapelayer)
    }
    
    //delegate URLSessionDownloadDelegate for downloading progress observe
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        //        print(totalBytesWritten, totalBytesExpectedToWrite)
        let precentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.percentagelabel.text = "\(Int(precentage * 100))%"
            self.shapelayer.strokeEnd = precentage
        }
        
        print(precentage)
    }
     //delegate URLSessionDownloadDelegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finished downloading file")
    }
    
    
    
//MARK: for handle animate only !!!
    fileprivate func animateCircle() {
        let basicanimation = CABasicAnimation(keyPath: "strokeEnd")
        basicanimation.toValue = 1
        basicanimation.duration = 2
        basicanimation.fillMode = CAMediaTimingFillMode.forwards
        basicanimation.isRemovedOnCompletion = false
        
        shapelayer.add(basicanimation, forKey: "animStroke")
    }
    
}

