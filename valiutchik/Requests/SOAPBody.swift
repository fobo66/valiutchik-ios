//
//  SOAPBody.swift
//  XMLMapper
//
//  Created by Giorgos Charitakis on 02/10/2017.
//

import Foundation
import XMLMapper

public class SOAPBody: XMLMappable {
    public var nodeName: String!

    var soapMessage: SOAPMessage?

    private var soapAction: String?

    init(soapMessage: SOAPMessage) {
        soapAction = soapMessage.soapAction
        self.soapMessage = soapMessage
    }

    public required init?(map _: XMLMap) {}

    public func mapping(map: XMLMap) {
        soapMessage <- map["m:\(soapAction ?? "")"]
    }
}
