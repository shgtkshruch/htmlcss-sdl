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

  grunt.registerTask 'default', [], ->
    grunt.loadNpmTasks 'grunt-bower-task'
    grunt.task.run 'bower'
