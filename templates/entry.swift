// This is a generated file.

import Contentful
import CoreLocation

struct {{ className }} {{% for field in fields %}
  let {{ field.name }}: {{ field.type }}{% endfor %}
}

