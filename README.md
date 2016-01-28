# nhz.lib

## NHZ Library [![Build Status][travis-image]][travis-url]
[![NPM][npm-image]][npm-url]

## Install
```
npm install --save nhz.lib
```

## Contents:

### nhz.lib/error/unimplemented
Returns an instance of `Error` with *UNIMPLEMENTED* message
```coffeescript
unimplemented = require 'nhz.lib/dist/error/unimplemented'
throw unimplemented()
```

### nhz.lib/array/copy
Returns an array copy (shallow)
```coffeescript
copy = require 'nhz.lib/dist/array/copy'
copy [1,2,3]
```

### nhz.lib/object/copy
Returns an object copy (shallow)
```coffeescript
copy = require 'nhz.lib/dist/object/copy'
copy a:'1', b:'2', c:'3'
```

### nhz.lib/property/descriptor
Returns object property's `descriptor` ([Object.getOwnPropertyDescriptor()][Object.getOwnPropertyDescriptor-url])
```coffeescript
descriptor = require 'nhz.lib/dist/property/descriptor'
descriptor {foo:1}, 'foo'
```

Updates object property's `descriptor` ([Object.defineProperty()][Object.defineProperty-url])
```coffeescript
descriptor = require 'nhz.lib/dist/property/descriptor'
descriptor {foo:1}, 'foo', writable:no
```

### nhz.lib/property/getter
Returns object property's `getter`
```coffeescript
getter = require 'nhz.lib/dist/property/getter'
getter {foo:1}, 'foo'
```

Updates object property's `getter`
```coffeescript
getter = require 'nhz.lib/dist/property/getter'
getter {foo:1}, 'foo', -> 'bar'
```

### nhz.lib/property/setter
Returns object property's `setter`
```coffeescript
setter = require 'nhz.lib/dist/property/setter'
setter {foo:1}, 'foo'
```

Updates object property's `setter`
```coffeescript
setter = require 'nhz.lib/dist/property/setter'
setter {foo:1}, 'foo', ->
```

### nhz.lib/property/is-writable
Returns object property's `writable` flag
```coffeescript
isWritable = require 'nhz.lib/dist/property/is-writable'
isWritable {foo:1}, 'foo'
```

Updates object property's `writable` flag
```coffeescript
isWritable = require 'nhz.lib/dist/property/is-writable'
isWritable {foo:1}, 'foo', no
```

### nhz.lib/property/is-enumerable
Returns object property's `enumerable` flag
```coffeescript
isEnumerable = require 'nhz.lib/dist/property/is-enumerable'
isEnumerable {foo:1}, 'foo'
```

Updates object property's `enumerable` flag
```coffeescript
isEnumerable = require 'nhz.lib/dist/property/is-enumerable'
isEnumerable {foo:1}, 'foo', no
```

### nhz.lib/property/is-configurable
Returns object property's `configurable` flag
```coffeescript
isConfigurable = require 'nhz.lib/dist/property/is-configurable'
isConfigurable {foo:1}, 'foo'
```

Updates object property's `configurable` flag
```coffeescript
isConfigurable = require 'nhz.lib/dist/property/is-configurable'
isConfigurable {foo:1}, 'foo', no
```

### nhz.lib/browser/next-animation-frame
Callbacks for the next animation frame. Chainable with `.then(callbacks...)`.
Chained callbacks will be called upcoming frames. One group per frame!

```coffeescript
next = require 'nhz.lib/dist/browser/next-animation-frame'
next -> document.body.style.backgroundColor =  'red'
.then -> document.body.style.backgroundColor = 'green'
.then -> document.body.style.backgroundColor = 'blue'
```

### nhz.lib/geometry/rectangle/has
Checks if point belongs to rectangle.
- rectangle is an array: [x, y, width, height]
- point is an array: [x, y]

```coffeescript
has = require 'nhz.lib/dist/geometry/rectangle/has'
has [1,1,2,2], [1.5, 1.5]
```

### nhz.lib/geometry/rectangle/has
Checks if point belongs to circle.
- circle is an array: [x, y, radius]
- point is an array: [x, y]

```coffeescript
has = require 'nhz.lib/dist/geometry/circle/has'
has [1,1,2], [2.3, 2.3]
```

### nhz.lib/async/parallel
Call `tasks` in parallel and after they finished,
call the `callback` with errors and results

```coffeescript
parallel = require 'nhz.lib/dist/async/parallel'
parallel ((cb) -> cb null, 1), ((cb) -> cb null, 2)
.timeout 300
.then (err, res) ->
```

Build
-----
```
git clone https://github.com/nhz-io/nhz.lib.git
cd nhz.lib
npm install
gulp
```

LICENSE
-------
#### [MIT](LICENSE)

[HISTORY](HISTORY.md)
---------------------

[travis-image]: https://travis-ci.org/NHZio/nhz.lib.svg
[travis-url]: https://travis-ci.org/NHZio/nhz.lib

[npm-image]: https://nodei.co/npm/nhz.lib.png
[npm-url]: https://nodei.co/npm/nhz.lib
[extends__-url]: https://github.com/nhz-io/extends__
[Object.getOwnPropertyDescriptor-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertyDescriptor
[Object.defineProperty-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty
