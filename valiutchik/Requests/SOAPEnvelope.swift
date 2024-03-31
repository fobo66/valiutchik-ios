//
//  SOAPEnvelope.swift
//  XMLMapper
//
//  Created by Giorgos Charitakis on 02/10/2017.
//

import Foundation
import XMLMapper

public class SOAPEnvelope: XMLMappable {
    public var nodeName: String! = "soap:Envelope"

    var soapEncodingStyle: String = "http://schemas.xmlsoap.org/soap/encoding/"
    var xmlnsSOAP: String = "http://schemas.xmlsoap.org/soap/envelope/"
    var soapBody: SOAPBody!
    var soapHeader: SOAPHeader?

    var nodesOrder: [String] = [
        "soap:Header",
        "soap:Body",
    ]

    public init(soapMessage: SOAPMessage, soapInformation: SOAPInformation? = nil, soapVersion: SOAPVersion = .version1point1) {
        xmlnsSOAP = soapVersion.namespace
        soapEncodingStyle = soapVersion.encodingStyle
        soapBody = SOAPBody(soapMessage: soapMessage)
        if let soapInformation = soapInformation {
            soapHeader = SOAPHeader(soapInformation: soapInformation)
        }
    }

    public required init?(map _: XMLMap) {}

    public func mapping(map: XMLMap) {
        soapEncodingStyle <- map.attributes["soap:encodingStyle"]
        xmlnsSOAP <- map.attributes["xmlns:soap"]
        soapHeader <- map["soap:Header"]
        soapBody <- map["soap:Body"]
        nodesOrder <- map.nodesOrder
    }
}
