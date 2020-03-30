//
//  ViewController.swift
//  a阿萨德
//
//  Created by Anmo on 2020/3/30.
//  Copyright © 2020 com.Cingjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let content = "三端拿到了卡机:\nhttp://www.baidu.com\n这是网址案件来看受打击了卡机了,dkajskldla:\n ahjahdkjhakhttp://www.baidu.com87647826478\n876238ahdkjandkanlk\nhttp://www.taobao.com这是网址\"http://www.baidu.cn\n\"卡号的快捷键啊https://www.iconfont.cn/collections/detail?cid=2301da"

        cj_getContentUrl(content: content)
    }

    fileprivate func cj_getContentUrl(content:String) {
        // 获取链接
        var content = content.replacingOccurrences(of: "\n", with: "")
        content = (content.trimmingCharacters(in: .whitespaces))
        let regulaStr = "((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
        // 创建正则表达式对象
        guard let regex = try? NSRegularExpression(pattern: regulaStr, options: []) else {
            return
        }
        // 匹配到的字符串的内容
        let results = regex.matches(in: content, options: [], range: NSRange(location: 0, length: content.count))
        // 遍历结果，获取结果[NSTextCheckingResult]
        var urls = [String]()
        
        if results.count > 0 {
            for result in results {
               let rang:NSRange = result.range
               let str = (content as NSString).substring(with: rang)
               urls.append(str)
            }
            // 创建网址提示框
            let alertVC = UIAlertController(title: "提示", message: "检测到\(urls.count)个链接", preferredStyle:.actionSheet)
            for url in urls {
                let urlAction = UIAlertAction(title: url, style: .default) { (action) in
                    // 这里实现连接的跳转操作
                }
                alertVC.addAction(urlAction)
            }
            let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            }
            alertVC.addAction(cancelAction)
            self.present(alertVC, animated: true) {}
        }
        print("\(urls)")
    }

}



