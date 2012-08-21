
###
Test CSV - Copyright David Worms <open@adaltas.com> (BSD Licensed)
###

require 'coffee-script'
fs = require 'fs'
should = require 'should'
csv = require '../src/csv'

describe 'lineBreaks', ->
    it 'Test line breaks custom', (next) ->
        csv()
        .from.path( "#{__dirname}/lineBreaks/lineBreaks.in" )
        .to.path( "#{__dirname}/lineBreaks/custom.tmp", lineBreaks: '::' )
        .on 'end', (count) ->
            count.should.eql 2
            expect = fs.readFileSync( "#{__dirname}/lineBreaks/custom.out").toString()
            result = fs.readFileSync( "#{__dirname}/lineBreaks/custom.tmp").toString()
            result.should.eql expect
            fs.unlink "#{__dirname}/lineBreaks/custom.tmp", next
    it 'Test line breaks unix', (next) ->
        csv()
        .from.path( "#{__dirname}/lineBreaks/lineBreaks.in" )
        .to.path( "#{__dirname}/lineBreaks/unix.tmp", lineBreaks: "unix")
        .on 'end', (count) ->
            count.should.eql 2
            expect = fs.readFileSync( "#{__dirname}/lineBreaks/unix.out" ).toString()
            result = fs.readFileSync( "#{__dirname}/lineBreaks/unix.tmp" ).toString()
            result.should.eql expect
            fs.unlink "#{__dirname}/lineBreaks/unix.tmp", next
    it 'Test line breaks unicode', (next) ->
        csv()
        .from.path( "#{__dirname}/lineBreaks/lineBreaks.in")
        .to.path( "#{__dirname}/lineBreaks/unicode.tmp", lineBreaks: 'unicode')
        .on 'end', (count) ->
            count.should.eql 2
            expect = fs.readFileSync( "#{__dirname}/lineBreaks/unicode.out" ).toString()
            result = fs.readFileSync( "#{__dirname}/lineBreaks/unicode.tmp" ).toString()
            result.should.eql expect
            fs.unlink "#{__dirname}/lineBreaks/unicode.tmp", next
    it 'Test line breaks mac', (next) ->
        csv()
        .from.path( "#{__dirname}/lineBreaks/lineBreaks.in" )
        .to.path( "#{__dirname}/lineBreaks/mac.tmp", lineBreaks: 'mac' )
        .on 'end', (count) ->
            count.should.eql 2
            expect = fs.readFileSync( "#{__dirname}/lineBreaks/mac.out" ).toString()
            result = fs.readFileSync( "#{__dirname}/lineBreaks/mac.tmp" ).toString()
            result.should.eql expect
            fs.unlink "#{__dirname}/lineBreaks/mac.tmp", next
    it 'Test line breaks windows', (next) ->
        csv()
        .from.path( "#{__dirname}/lineBreaks/lineBreaks.in" )
        .to.path( "#{__dirname}/lineBreaks/windows.tmp", lineBreaks: 'windows' )
        .on 'end', (count) ->
            count.should.eql 2
            expect = fs.readFileSync( "#{__dirname}/lineBreaks/windows.out" ).toString()
            result = fs.readFileSync( "#{__dirname}/lineBreaks/windows.tmp" ).toString()
            result.should.eql expect
            fs.unlink "#{__dirname}/lineBreaks/windows.tmp", next

