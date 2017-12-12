struct UserModel: Codable {
    let firstName: String
    let lastName: String
    let age: Int
    let phone: String
    let email: String
    let address: String

    private enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case age
        case phone
        case email
        case address
    }
}
