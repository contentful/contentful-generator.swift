# Contentful Swift Generator

Script for generating structs with concretely typed properties from a [Contentful][1] content
model. This is meant to be used in conjunction with our [Swift SDK][3] to increase the
compile-time safety of your applications. 

Using the generated structs will ensure that you only access properties which are actually
defined in your content model and that the correct types are used for them. It will also decouple
your application from Contentful, as the model structs only depend on the SDK for their
conversion method.

[Contentful][1] is a content management platform for web applications, mobile apps and connected devices. It allows you to create, edit & manage content in the cloud and publish it anywhere via powerful API. Contentful offers tools for managing editorial teams and enabling cooperation between organizations.

## Usage

Executing the script will generate one Swift file per content type in your space. You have to
specify the space ID and a CDA access token. Optionally, an output directory for the generated
source files can be provided:

```bash
$ ./bin/contentful-generator cfexampleapi b4c0n73n7fu1 --output out
```

The output will look like this:

```swift
// This is a generated file.

import Contentful
import CoreLocation

struct Dog {
  let name: String?
  let description: String?
  let image: Asset?

  static func fromEntry(entry: Entry) throws -> Dog {
    return Dog(
        name: entry.fields["name"] as? String,
        description: entry.fields["description"] as? String,
        image: entry.fields["image"] as? Asset)
  }
}
```

For mapping from an `Entry` object received via the SDK to this struct, you can use the
`fromEntry()` function:

```swift
client.fetchEntry("doge").1.next { let doge = Doge.fromEntry($0) }
```

## Installation

The script requires `cato` for assembling its dependencies, please install it using:

```bash
$ gem install cocoapods cocoapods-rome
$ brew tap neonichu/formulae
$ brew install cato
```

The script can be invoked from anywhere, but it will load files from the `templates` directory
at runtime, so you will need to keep the full Git checkout around.

## Limitations

- Currently, `Date` and `Location` values are unsupported. You will receive warnings for each unsupported field that the generator encounters.
- All properties are declared optional at the moment.
- The script only runs on OS X.

## License

Copyright (c) 2015 Contentful GmbH. See LICENSE for further details.

[1]: https://www.contentful.com
[2]: http://cocoapods.org
[3]: https://github.com/contentful/contentful.swift
