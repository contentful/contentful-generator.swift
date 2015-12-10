// This is a generated file.

import Contentful
import CoreLocation

struct {{ className }} {{% for field in fields %}
  let {{ field.name }}: {{ field.type }}?{% endfor %}

  static func fromEntry(entry: Entry) throws -> {{ className }} {
    return {{ className }}({% for field in fields %}
        {{ field.name }}: entry.fields["{{ field.name }}"] as? {{ field.type }},{% endfor %})
  }
}

