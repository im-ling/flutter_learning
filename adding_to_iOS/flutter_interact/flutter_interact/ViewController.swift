//
//  ViewController.swift
//  flutter_interact
//
//  Created by ling on 2022/10/28.
//

import UIKit
import Flutter
import flutter_boost



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemPink
    
        // Make a button to call the showFlutter function when pressed.
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.systemBlue
        self.view.addSubview(button)
    }
    
    @objc func showFlutter() {
        
        let options = FlutterBoostRouteOptions()
        options.pageName = "mainPage"
        options.arguments = ["key" :"value"]

        //页面是否透明（用于透明弹窗场景），若不设置，默认情况下为true
        options.opaque = true

        //这个是push操作完成的回调，而不是页面关闭的回调！！！！
        options.completion = { completion in
            print("open operation is completed")
        }

        //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
        options.onPageFinished = { dic in
            print(dic)
        }

        FlutterBoost.instance().open(options)
//      let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
//      let flutterViewController =
//          FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//      present(flutterViewController, animated: true, completion: nil)
    }


}

