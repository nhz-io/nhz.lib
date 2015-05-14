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

### nhz.lib/coffee/mixin
Create new class from prototypes with Base superclass
```coffeescript
mixin = require 'nhz.lib/coffee/mixin'

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
