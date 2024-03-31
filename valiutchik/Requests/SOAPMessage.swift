//
//  SOAPMessage.swift
//  XMLMapper
//
//  Created by Giorgos Charitakis on 02/10/2017.
//

import Foundation
import XMLMapper

open class SOAPMessage: XMLMappable {
    public var nodeName: String!

    private var xmlnsMessage: String?
    var soapAction: String?

    public init(soapAction: String, nameSpace: String) {
        self.soapAction = soapAction
        xmlnsMessage = nameSpace
    }

    public required init?(map _: XMLMap) {}

    open func mapping(map: XMLMap) {
        xmlnsMessage <- map.attributes["xmlns:m"]
    }
}
