//
//  SOAPHeader.swift
//  XMLMapper
//
//  Created by Giorgos Charitakis on 02/10/2017.
//

import Foundation
import XMLMapper

public class SOAPHeader: XMLMappable {
    public var nodeName: String!

    var soapInformation: SOAPInformation?

    private var informationName: String?

    init(soapInformation: SOAPInformation) {
        informationName = soapInformation.informationName
        self.soapInformation = soapInformation
    }

    public required init?(map _: XMLMap) {}

    public func mapping(map: XMLMap) {
        soapInformation <- map["m:\(informationName ?? "")"]
    }
}
