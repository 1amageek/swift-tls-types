import XCTest
@testable import TLSTypes

final class TLSTypesVocabularyTests: XCTestCase {
    func testTLSVocabularyValues() throws {
        XCTAssertEqual(TLSVersion.tls13.rawValue, 0x0304)
        XCTAssertEqual(TLSCipherSuite.aes128GCM_SHA256.rawValue, 0x1301)
        XCTAssertEqual(TLSEncryptionLevel.allCases.count, 4)
        XCTAssertEqual(TLSRole.client, .client)
    }

    func testBoundedOwnedValues() throws {
        let name = try TLSServerName(bytes: ContiguousArray("example.test".utf8))
        let protocolName = try TLSApplicationProtocol(bytes: ContiguousArray("h3".utf8))
        XCTAssertEqual(name.byteCount, 12)
        XCTAssertEqual(protocolName.byteCount, 2)
        try name.withBytes { bytes in
            XCTAssertEqual(bytes.count, 12)
        }
        try protocolName.withBytes { bytes in
            XCTAssertEqual(bytes.count, 2)
        }
    }

    func testBoundedOwnedValuesRejectInvalidLengths() {
        XCTAssertThrowsError(try TLSServerName(bytes: []))
        XCTAssertThrowsError(try TLSApplicationProtocol(bytes: []))
    }
}
