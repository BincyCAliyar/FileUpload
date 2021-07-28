//
//  Model.swift
//  File Upload
//
//  Created by Sijo Thadathil on 28/07/21.
//

import Foundation

struct Welcome: Codable {
    var data: DataClass?
    var face, sign: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    var address, dob, doe, end: String?
    var eyes: String?
    var face: Bool?
    var gender, height, iss, lic: String?
    var licenseNo, name, restriction: String?
    var sign: Bool?

    enum CodingKeys: String, CodingKey {
        case address = "Address"
        case dob = "DOB"
        case doe = "DOE"
        case end = "End"
        case eyes = "Eyes"
        case face = "Face"
        case gender = "Gender"
        case height = "Height"
        case iss = "ISS"
        case lic = "Lic"
        case licenseNo = "License_No"
        case name = "Name"
        case restriction = "Restriction"
        case sign = "Sign"
    }
    init(address:String?, dob:String?,doe:String?, end:String?, eyes:String?, face:Bool?, gender:String?, height:String?, iss:String?, lic:String?, licenseNo:String?, name:String?, restriction:String?, sign:Bool?)
    {
        self.address = address
        self.dob = dob
        self.doe = doe
        self.end = end
        self.eyes = eyes
        self.face = face
        self.gender = gender
        self.height = height
        self.iss = iss
        self.lic = lic
        self.licenseNo = licenseNo
        self.name = name
        self.restriction = restriction
        self.sign = sign
    }
}
