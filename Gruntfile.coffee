module.exports = (grunt) ->
  'use strict'

  grunt.initConfig
  
    bower:
      install:
        options:
          targetDir: './source/lib'
          layout: 'byType'
          install: true
          verbose: false
          clearnTargetDir: true
          cleanBowerDir: true

    # grunt-prettify
    # https://github.com/jonschlinkert/grunt-prettify
    prettify:
      options:
        # condense: true
        # padcomments: false
        indent: 2
        # indent_char: ' '
        # indent_inner_html: 'false'
        # wrap_line_length: 0
        # preserve_newlines: true
        # unformatted: [
        #   'input'
        # ]
      files:
        src: ['minify.html']
        dest: 'pretty.html'

    # grunt-contrib-htmlmin
    # https://github.com/gruntjs/gruntcontrib-htmlmin
    htmlmin:
      options:
        removeComments: true
        collapseWhitespace: true
      files:
        src: 'entry.html'
        dest: 'minify.html'

  grunt.registerTask 'default', [], ->
    grunt.loadNpmTasks 'grunt-bower-task'
    grunt.task.run 'bower'

  grunt.registerTask 'p', [], ->
    grunt.loadNpmTasks 'grunt-contrib-htmlmin'
    grunt.loadNpmTasks 'grunt-prettify'
    grunt.task.run 'htmlmin', 'prettify'

