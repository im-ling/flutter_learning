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
        options.pageName = "simplePage"
        options.arguments = ["key" :"value", "data":"datastring"]
        

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
        
        
        //同样声明一个对象用来存删除的函数

        //这里注册事件监听，监听flutter发送到iOS的事件
        FlutterBoost.instance().addEventListener({[weak self] key, dic in
            //注意，如果这里self持有removeListener，而这个闭包中又有self的话，要用weak self
            //否则就有self->removeListener->self 循环引用
            
            //在这里处理你的事件
            print("lllll")
            print(key)
            print(dic)
            
            FlutterBoost.instance().sendEventToFlutter(with: "eventToFlutter", arguments: ["data":"event from native"])
        }, forName: "eventToNative")
        
//      let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
//      let flutterViewController =
//          FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
//      present(flutterViewController, animated: true, completion: nil)
    }


}

