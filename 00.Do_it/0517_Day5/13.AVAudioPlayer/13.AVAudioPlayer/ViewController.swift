//
//  ViewController.swift
//  13.AVAudioPlayer
//
//  Created by 유준용 on 2022/05/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    var audioFile: URL!
    let MAX_VOLUME: Float = 10.0
    var progressTimer: Timer!
    
    let recordTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        return label
    }()
    
    let recordButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Record", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitleColor(UIColor.black, for: .disabled)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(record(_:)), for: .touchUpInside)
        return btn
    }()
    
    let recordSwitch: UISwitch = {
        let recordSwitch = UISwitch()
        recordSwitch.isOn = false
        recordSwitch.translatesAutoresizingMaskIntoConstraints = false
        recordSwitch.addTarget(self, action: #selector(recordOnOff(_:)), for: .valueChanged)
        return recordSwitch
    }()
    
    let recordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Record"
        return label
    }()
    
    let volumeSlider: UISlider = {
        let volumeSlider = UISlider()
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        return volumeSlider
    }()
    
    let volumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Volume"
        label.textColor = .black
        return label
    }()

    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.contentMode = .scaleAspectFit
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let playButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Play", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .disabled)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(play), for: .touchUpInside)
        return btn
    }()
    
    let stopButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Stop", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .disabled)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(stop), for: .touchUpInside)

        return btn
    }()
    
    let pauseButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Pause", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .disabled)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(pause), for: .touchUpInside)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Audio Player"
        label.textColor = .black
        return label
    }()
    
    let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Time"
        label.textColor = .black
        return label
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "End Time"
        label.textColor = .black
        return label
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        return progressView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureButton()
        selectAudioFile()
        if !isRecordMode {
            initPlay()
            recordButton.isEnabled = false
            recordTimeLabel.isEnabled = false
        }else{
            initRecord()
        }
        configreRecordSwtich()
    }
    
    func selectAudioFile(){
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        } else {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    //MARK: - User Event
    @objc func recordOnOff(_ sender: UISwitch){
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            recordTimeLabel.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            recordButton.isEnabled = true
            recordTimeLabel.isEnabled = true
        }else{
            isRecordMode = false
            recordButton.isEnabled = false
            recordTimeLabel.isEnabled = false
            recordTimeLabel.text = convertNSTimeInterval2String(0)
        }
        selectAudioFile()
        if !isRecordMode{
            initPlay()
        }else{
            initRecord()
        }
            
    }
    
    @objc func changeVolume(_ sender: UISlider){
        audioPlayer.volume = volumeSlider.value
    }
    
    @objc func updateTime(){
        currentTimeLabel.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        progressView.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }

    @objc func play(){
        print(#function)
        audioPlayer.play()
        setPlayButtons(play: false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
    }
    @objc func pause(){
        print(#function)
        audioPlayer.pause()
        setPlayButtons(play: true, pause: false, stop: true)
    }
    @objc func stop(){
        print(#function)
        audioPlayer.stop()
        setPlayButtons(play: true, pause: false, stop: false)
        progressView.progress = 0
        audioPlayer.currentTime = 0
        currentTimeLabel.text = convertNSTimeInterval2String(0)
        progressTimer.invalidate()
    }
    
    @objc func record(_ sender: UIButton){
        if (sender as AnyObject).titleLabel!.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateRecordtime), userInfo: nil, repeats: true)
        } else{
            audioRecorder.stop()
            if progressTimer != nil { progressTimer.invalidate()}
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            playButton.isEnabled = true
            initPlay()
        }
    }
    
    
    //MARK: - Audio
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(play: true, pause: false, stop: false)
    }

    func convertNSTimeInterval2String(_ time: TimeInterval) -> String {
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    private func setPlayButtons(play: Bool, pause: Bool, stop: Bool){
        playButton.isEnabled = play
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
    
    private func initPlay(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay: \(error)")
        }
        volumeSlider.maximumValue = MAX_VOLUME
        volumeSlider.value = 1.0
        progressView.progress = 0
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volumeSlider.value
        
        endTimeLabel.text = convertNSTimeInterval2String(audioPlayer.duration)
        currentTimeLabel.text = convertNSTimeInterval2String(0)
        setPlayButtons(play: true, pause: false, stop: false)
    }
    
    //MARK: - Record
    @objc func updateRecordtime(){
        recordTimeLabel.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    
    private func initRecord(){
        let recordSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0] as [String: Any]
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            print("Error-initRecord: \(error)")
        }
        audioRecorder.delegate = self
        volumeSlider.value = 1.0
        audioPlayer.volume = volumeSlider.value
        endTimeLabel.text = convertNSTimeInterval2String(0)
        currentTimeLabel.text = convertNSTimeInterval2String(0)
        setPlayButtons(play: false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("Error-setCategory: \(error)")
        }
        do {
            try session.setActive(true)
        }catch let error as NSError {
            print("Error-setActive: \(error)")
        }
    }
    
    
    
    //MARK: - Configure UI
    private func configureUI(){
        [titleLabel,progressView, currentTimeLabel, endTimeLabel ].forEach {
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 70),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            currentTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            currentTimeLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 15),
            endTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            endTimeLabel.topAnchor.constraint(equalTo: currentTimeLabel.topAnchor),
            

            
        ])
    }
    
    private func configureButton(){
        [playButton, stopButton, pauseButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [buttonStackView, volumeLabel, volumeSlider].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: currentTimeLabel.bottomAnchor, constant: 30),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            
            volumeLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 40),
            volumeLabel.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor, constant: 10),
            volumeSlider.centerYAnchor.constraint(equalTo: volumeLabel.centerYAnchor),
            volumeSlider.leadingAnchor.constraint(equalTo: volumeLabel.trailingAnchor, constant: 15),
            volumeSlider.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor)
        ])
    }
    
    private func configreRecordSwtich(){
        [recordSwitch, recordLabel, recordTimeLabel, recordButton].forEach {
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            recordSwitch.trailingAnchor.constraint(equalTo: recordTimeLabel.trailingAnchor),
            recordSwitch.topAnchor.constraint(equalTo: volumeSlider.bottomAnchor, constant: 30),
            
            recordLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            recordLabel.centerYAnchor.constraint(equalTo: recordSwitch.centerYAnchor),
            
            recordButton.leadingAnchor.constraint(equalTo: recordLabel.leadingAnchor),
            recordButton.topAnchor.constraint(equalTo: recordLabel.bottomAnchor, constant: 30),
            
            recordTimeLabel.leadingAnchor.constraint(equalTo: recordButton.trailingAnchor, constant: 30),
            recordTimeLabel.centerYAnchor.constraint(equalTo: recordButton.centerYAnchor)
        ])
    }
    

    
}



extension ViewController: AVAudioRecorderDelegate {
    
}
