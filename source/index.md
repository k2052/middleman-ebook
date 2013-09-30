# A test ebook with live code examples

## Runnable Code Stuff

A runnable code example

    alert("hi!")
{: .language-coffeescript}

A runnable test example
    
    chai.should()
    mocha.setup('bdd')

    cats = "dogs"
    truthy = true
    
    it "should equal things", ->
      cats.should.equal "dogs"
      truthy.should.be.true

    mocha.run()
{: .language-coffeescript}

Another runnable test example
    
    chai.should()
    mocha.setup('bdd')

    cats = "cats"
    truthy = false
    
    it "should notequal things", ->
      cats.should.not.equal "dogs"
      truthy.should.not.be.true

    mocha.run()
{: .language-coffeescript}

Another Code example a long one taken from Docco

    document = (options = {}) ->
      configure options

      exec "mkdir -p #{config.output}", ->

        exec "cp -f #{config.css} #{config.output}"
        exec "cp -fR #{config.public} #{config.output}" if fs.existsSync config.public
        files = config.sources.slice()

        nextFile = ->
          source = files.shift()
          fs.readFile source, (error, buffer) ->
            throw error if error

            code = buffer.toString()
            sections = parse source, code
            format source, sections
            write source, sections
            nextFile() if files.length

        nextFile()
{: .language-coffeescript}

A non runnable code block

    test
    test second line
    $ a command

## A linked heading

Here is a [link](#a-linked-heading)

And a *bold*. Some _em_. Maybe a code `thing`. A key: <kbd>CRTL</kbd> + <kbd>SHIFT</kbd>
