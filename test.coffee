#!/usr/bin/env coffee

module.paths.unshift 'pegex-js/lib'
fs = require 'fs'
require 'pegex/parser'
require 'pegex/grammar'
require 'pegex/tree'

grammar = new Pegex.Grammar
  text: fs.readFileSync('grammar.pgx').toString()

class Action extends Pegex.Tree
  got_rgx3: (got)->
    return

console.log "JavaScript: (#{process.argv[2]}) '#{process.argv[3]}'"

parser = new Pegex.Parser
  grammar: grammar
  receiver: new Action
  debug: process.env.DEBUG

console.dir parser.parse process.argv[3], process.argv[2]
console.log ''
