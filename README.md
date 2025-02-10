# 📌 Storage Property Wrapper

A property wrapper for securely and efficiently storing and retrieving values in `UserDefaults`.

## 🚀 Description

The `Storage` property wrapper is a structure that allows storing and retrieving values in `UserDefaults` using a JSON encoding and decoding mechanism. This enables safe and efficient storage of complex data types, such as structures and classes.

## 🛠 Features

- Stores values in `UserDefaults`.
- Uses JSON encoding and decoding to handle complex data types.
- Provides a mechanism to set a default value if no stored value is found.
- Compatible with types that conform to the `Codable` protocol.
- Supports a custom `UserDefaults` container.

## 📌 Usage

To use the property wrapper, simply create an instance and access the wrapped value:

```swift
@Storage(key: "name", defaultValue: "Steven")
var name: String

print(name) // Prints the stored value or the default value

name = "Juan"
print(name) // Prints the new stored value
```

## 🔹 Examples

### Storing and Retrieving Simple Values

```swift
@Storage(key: "age", defaultValue: 25)
var age: Int

print(age) // Prints 25

age = 30
print(age) // Prints 30
```

### Storing and Retrieving Optional Values

```swift
@Storage(key: "address")
var address: String?

print(address) // Prints nil if no value has been set

address = "123 Street"
print(address) // Prints "123 Street"

address = nil
print(address) // Prints nil
```

### Storing and Retrieving Complex Types

```swift
struct Person: Codable {
    let name: String
    let age: Int
}

@Storage(key: "person", defaultValue: Person(name: "Steven", age: 25))
var person: Person

print(person.name) // Prints "Steven"

person = Person(name: "Juan", age: 30)
print(person.name) // Prints "Juan"
```

