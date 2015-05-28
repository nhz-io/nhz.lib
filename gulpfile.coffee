_ = (require './package.json').gulpfile

$ =
  gulp          :require 'gulp'
  test          :require 'gulp-mocha'
  coffee        :require 'gulp-coffee'
  lint          :require 'gulp-coffeelint'
  del           :require 'del'
  replace       :require 'gulp-replace'
  run           :require 'run-sequence'
  rename        :require 'gulp-rename'

  extendsRegexp : /((__)?extends?)\s*=\s*function\(child,\s*parent\)\s*\{.+?return\s*child;\s*\}/

$.gulp.task 'default', (cb) -> $.run [ 'dist' ], cb

$.gulp.task 'clean', (cb) -> $.del [ _.build, _.dist ], cb

$.gulp.task 'lint', ->
  $.gulp
    .src [ "#{_.source}/**/*.+(coffee|litcoffee|coffee.md)" ]
    .pipe $.lint './coffeelint.json'
    .pipe $.lint.reporter()

$.gulp.task 'build', ['coffee', 'copy'], ->

$.gulp.task 'copy', ['clean', 'lint'], ->
  $.gulp
    .src [
      "#{_.source}/**/*"
      "#{_.source}/**/*.*"
      "#{_.source}/**/.*"
      "!#{_.source}/**/*.+(coffee|litcoffee|coffee.md)"
      "!#{_.test}" ]
    .pipe $.gulp.dest _.build

$.gulp.task 'coffee', [ 'clean', 'lint'], ->
  $.gulp
    .src [ "#{_.source}/**/*.+(coffee|litcoffee|coffee.md)" ]
    .pipe $.coffee bare:true
    .pipe $.replace $.extendsRegexp, '$1 = require("extends__")'
    .pipe $.gulp.dest _.build

$.gulp.task 'test', [ 'build' ], ->
  unless _.notest
    $.gulp
      .src [ "#{_.test}/**/*.js" ], read: false
      .pipe $.test reporter: 'tap'

$.gulp.task 'dist', [ 'build', 'test' ], ->
  $.gulp
    .src [ "#{_.build}/**", "!#{_.build}/test{,/**}" ]
    .pipe $.gulp.dest _.dist
