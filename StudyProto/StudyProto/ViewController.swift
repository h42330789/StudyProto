//
//  ViewController.swift
//  StudyProto
//
//  Created by MacBook Pro on 5/31/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 将proto转换成data， 然后再将data当成request里的body发送到服务端
        var clientInfo = ClientInfo()
        clientInfo.language = 2
        clientInfo.version = 122
        clientInfo.macID = "xxxx"
        clientInfo.token = "yyyyyy"

        var reqMessage = StudentsReq()
        reqMessage.clientInfo = clientInfo
        reqMessage.gender = .male
        reqMessage.grade = 2
        reqMessage.pageNum = 1
        reqMessage.pageSize = 30

        if let postData = try? reqMessage.serializedData() {
            var request = URLRequest(url: URL(string: "https://xxx.xxx/biz/stus/students")!)
            request.httpBody = postData
            // 发起请求
            URLSession.shared.dataTask(with: request, completionHandler: {_,_,_ in
                
            })
        }
    }


}

