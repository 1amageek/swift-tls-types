# swift-tls-types

`swift-tls-types` is the dependency-light vocabulary layer shared by the
Pure Swift TLS stack. It defines protocol-independent values such as endpoint
role, TLS version, cipher-suite identifiers, ALPN, encryption level, alerts,
and opaque server names.

It intentionally does not contain cryptography, parsing, transport I/O,
certificate policy, secret storage, or protocol state. Ownership-backed types
such as traffic secrets and scoped input/output borrows remain in `swift-ssl`.

```text
swift-tls-types (TLSTypes)
        ↓
swift-ssl (cryptography, PKI, TLS/DTLS mechanisms)
        ↓
swift-tls-sessions (session contracts and adapters)
```

## Usage

```swift
dependencies: [
    .package(url: "https://github.com/1amageek/swift-tls-types.git", branch: "main")
]
```
