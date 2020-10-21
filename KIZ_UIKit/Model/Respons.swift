//
//  Respons.swift
//  KIZ_UIKit
//
//  Created by Михаил Егоров on 22.10.2020.
//

import RealmSwift

// MARK: - Respons
class Respons: Object, Codable {
    let docOrdersList = List<DocOrders>()
    let docInvoicesList = List<String>()
    let workigPositionsList  = List<WorkigPositions>()
    let namesTMCList = List<String>()
    let destinationsList = List<String>()
    let measuresList = List<String>()

    enum CodingKeys: String, CodingKey {
        case docOrdersList = "docOrders"
        case docInvoicesList = "docInvoices"
        case workigPositionsList = "workigPositions"
        case namesTMCList = "namesTMC"
        case destinationsList = "destinations"
        case measuresList = "measures"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let docOrders = (try container.decodeIfPresent([DocOrders].self, forKey: .docOrdersList))!
        docOrdersList.append(objectsIn: docOrders)
        
        let docInvoices = (try container.decodeIfPresent([String].self, forKey: .docInvoicesList))!
        docInvoicesList.append(objectsIn: docInvoices)
        
        let workigPositions = (try container.decodeIfPresent([WorkigPositions].self, forKey: .workigPositionsList))!
        workigPositionsList.append(objectsIn: workigPositions)
        
        let namesTMC = (try container.decodeIfPresent([String].self, forKey: .namesTMCList))!
        namesTMCList.append(objectsIn: namesTMC)

        let destinations = (try container.decodeIfPresent([String].self, forKey: .destinationsList))!
        destinationsList.append(objectsIn: destinations)

        let measures = (try container.decodeIfPresent([String].self, forKey: .measuresList))!
        measuresList.append(objectsIn: measures)
    }
}

// MARK: - DocOrders
class DocOrders: Object, Codable {
  
    @objc dynamic var _id = ObjectId()
    @objc dynamic var docDate: String = ""
    @objc dynamic var approveDate: String = ""
    @objc dynamic var docNum: Int = 0
    @objc dynamic var departament: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var senderName: String = ""
    @objc dynamic var senderState: String = ""
    @objc dynamic var status: String = ""
    let positionsList = List<Positions>()
    
    enum CodingKeys: String, CodingKey {
        case _id
        case docDate
        case approveDate
        case docNum
        case departament
        case category
        case senderName
        case senderState
        case status
        case positionsList = "positions"
    }
    

    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self._id = try container.decode(ObjectId.self, forKey: ._id)
        self.docDate = try container.decode(String.self, forKey: .docDate)
        self.approveDate = try container.decode(String.self, forKey: .approveDate)
        self.docNum = try container.decode(Int.self, forKey: .docNum)
        self.departament = try container.decode(String.self, forKey: .departament)
        self.category = try container.decode(String.self, forKey: .category)
        self.senderName = try container.decode(String.self, forKey: .senderName)
        self.senderState = try container.decode(String.self, forKey: .senderState)
        self.status = try container.decode(String.self, forKey: .status)
        
        let positions = (try container.decodeIfPresent([Positions].self, forKey: .positionsList))!
        positionsList.append(objectsIn: positions)
        
    }
}

// MARK: - Positions
class Positions: Object, Codable {
    @objc dynamic var destination: String = ""
    @objc dynamic var nameTMC: String? = nil
    @objc dynamic var quantity: String = ""
    @objc dynamic var approvedQuantity: String = ""
    @objc dynamic var measure: String? = nil
    @objc dynamic var comment: String = ""
    let filesList = List<String>()
    let chatList = List<String>()
    @objc dynamic var chatReaded: Bool = false
    @objc dynamic var visible: Bool = false
    @objc dynamic var category: String = ""
    
    enum CodingKeys: String, CodingKey {
        case destination
        case nameTMC
        case quantity
        case approvedQuantity
        case measure
        case comment
        case filesList = "files"
        case chatList = "chat"
        case chatReaded
        case visible
        case category
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.destination = try container.decode(String.self, forKey: .destination)
        self.nameTMC = try container.decode(String?.self, forKey: .nameTMC)
        self.quantity = try container.decode(String.self, forKey: .quantity)
        self.approvedQuantity = try container.decode(String.self, forKey: .approvedQuantity)
        self.measure = try container.decode(String?.self, forKey: .measure)
        self.comment = try container.decode(String.self, forKey: .comment)
        

        let files = (try container.decodeIfPresent([String].self, forKey: .filesList))!
        filesList.append(objectsIn: files)

        let chat = (try container.decodeIfPresent([String].self, forKey: .chatList))!
        chatList.append(objectsIn: chat)
       
        self.chatReaded = try container.decode(Bool.self, forKey: .chatReaded)
        self.visible = try container.decode(Bool.self, forKey: .visible)
        self.category  = try container.decode(String.self, forKey: .category)
    }
}

// MARK: - WorkigPositions
class WorkigPositions: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var docId: String? = nil
    @objc dynamic var docNum: Int = 0
    @objc dynamic var docDate: String = ""
    @objc dynamic var docApproveDate: String = ""
    @objc dynamic var departament: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var senderName: String = ""
    @objc dynamic var senderState: String = ""
    @objc dynamic var destination: String = ""
    @objc dynamic var nameTMC: String? = nil
    @objc dynamic var quantity: String = ""
    @objc dynamic var measure: String = ""
    @objc dynamic var comment: String? = nil
    let logistCommentsList = List<String>()
    @objc dynamic var status: String = ""
    @objc dynamic var statusDate: String = ""
    @objc dynamic var completeDate: String? = nil
    @objc dynamic var completeComment: String = ""
    @objc dynamic var cancelDate: String? = nil
    @objc dynamic var cancelComment: String? = nil
    let filesList = List<String>()
    @objc dynamic var invoiceId: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case docId
        case docNum
        case docDate
        case docApproveDate
        case departament
        case category
        case senderName
        case senderState
        case destination
        case nameTMC
        case quantity
        case measure
        case comment
        case logistCommentsList = "logistComments"
        case status
        case statusDate
        case completeDate
        case completeComment
        case cancelDate
        case cancelComment
        case filesList = "files"
        case invoiceId
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let logistComments = (try container.decodeIfPresent([String].self, forKey: .logistCommentsList))!
        logistCommentsList.append(objectsIn: logistComments)
        
        let files = (try container.decodeIfPresent([String].self, forKey: .filesList))!
        filesList.append(objectsIn: files)
        
    }
}
