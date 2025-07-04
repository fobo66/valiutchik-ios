//
//  SOAPInformation.swift
//  XMLMapper
//
//  Created by Giorgos Charitakis on 02/10/2017.
//

import Foundation
import XMLMapper

open class SOAPInformation: XMLMappable {
    public var nodeName: String!

    private var xmlnsInformation: String?
    var informationName: String?

    public init(informationName: String, nameSpace: String) {
        self.informationName = informationName
        xmlnsInformation = nameSpace
    }

    public required init?(map _: XMLMap) {}

    open func mapping(map: XMLMap) {
        xmlnsInformation <- map.attributes["xmlns:m"]
    }
}
