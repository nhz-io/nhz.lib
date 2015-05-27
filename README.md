# nhz.lib

## NHZ Library [![Build Status][travis-image]][travis-url]
[![NPM][npm-image]][npm-url]

## Install
```
npm install --save nhz.lib
```

## Contents:

### nhz.lib/coffee/nil
A `NIL` Object (Function actually, returns itself)
```coffeescript
NIL = require 'nhz.lib/dist/coffee/nil'
foo = -> NIL
if foo() is nil then console.log "GOT NIL"
```

### nhz.lib/coffee/mixin
Create new class from prototypes with Base superclass
```coffeescript
mixin = require 'nhz.lib/dist/coffee/mixin'

class Base
fooPrototype = foo: -> console.log "Foo"
barPrototype = bar: -> console.log "Bar"

class Foo extends mixin Base, fooPrototype, barPrototype
foobar = new Foo
foobar.foo()
foobar.bar()
```
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

### nhz.lib/browser/next-animation-frame
Callbacks for the next animation frame. Chainable with `.this(callbacks...)`.
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

VERSION
-------
#### 0.0.10
- Removed browser/event-target
- Added web-api/event
- Added web-api/event-target

#### 0.0.9
- Added browser/event-target

#### 0.0.8
- Added async/parallel

#### 0.0.7
- Added geometry/rectangle/has
- Added geometry/circle/has

#### 0.0.6
- Added browser/next-animation-frame

#### 0.0.5
- Added coffeescript highlight to README.md snipets
- Added snipets for NIL and undefined

#### 0.0.4
- Added array/copy
- Added object/copy
- Fixed comment headers

#### 0.0.3
- Added info on contents to README
- Added error/unimplemented
- Added coffee/nil

#### 0.0.2
- Added coffee/mixin

#### 0.0.1
- Initial commit

[travis-image]: https://travis-ci.org/nhz-io/nhz.lib.svg
[travis-url]: https://travis-ci.org/nhz-io/nhz.lib

[npm-image]: https://nodei.co/npm/nhz.lib.png
[npm-url]: https://nodei.co/npm/nhz.lib
