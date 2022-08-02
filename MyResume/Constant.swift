//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "ChunYi Chan"
    let title    = "iOS Developer"
    let location = "Location：Taiwan"
    let bio      = "I have about 3 yeas experiences of iOS development."
    let skills   = ["python", "swift", "mySQL", "xd"]
    let experiences: [Experience] = [("iOS Developer",
                                      "TBCASoft",
                                      "2022 年 2 月",
                                      "Now"),
                                     ("iOS Developer",
                                      "雲程在線股份有限公司",
                                      "2019 年 2 月",
                                      "2020 年 12 月"),
                                     ("iOS intern",
                                      "雲程在線股份有限公司",
                                      "2018 年 9 月",
                                      "2019 年 2 月")]
    let phoneUrl = "tel://0912345678"
    let socialMedia: [(name: String, url: String)] = [("LinkedIn","https://www.linkedin.com/in/chun-yi-chan-445655242/"),
                                                      ("Line","https://line.me/ti/p/Fhgz4-NFLH"),
                                                      ("YouTube","https://www.youtube.com/channel/UCsssLDarjKe7K0YtuLrjpcw")]
}

