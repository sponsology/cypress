_             = require("lodash")
fs            = require("fs")
chalk         = require("chalk")
path          = require("path")
request       = require("request")
progress      = require("request-progress")
ProgressBar   = require("progress")
through2      = require("through2")
yauzl         = require("yauzl")
Decompress    = require("decompress")
Promise       = require("bluebird")
utils         = require("../utils")

url = "http://download.cypress.io/latest"

class Install
  constructor: (options = {}) ->
    if not (@ instanceof Install)
      return new Install(options)

    _.defaults options,
      initialize:     true
      percent:        0
      current:        0
      total:          100
      width:          30
      throttle:       100
      zipDestination: "./cypress.zip"
      destination:    utils.getDefaultAppFolder()

    return if not options.initialize

    @initialize(options)

  initialize: (options) ->
    @download(options)
      .bind(@)
      .catch(@downloadErr)
      .then(@unzip)
      # .catch (err) ->
        # could not unzip
      .then(@finish)

  downloadErr: (err) ->
    console.log("")
    console.log(chalk.bgRed.white(" -Error- "))
    console.log(chalk.red.underline("The Cypress App could not be downloaded."))
    console.log("")
    console.log("URL:", chalk.blue(@getUrl()))
    if err.statusCode
      msg = [err.statusCode, err.statusMessage].join(" - ")
      console.log("The server returned:", chalk.red(msg))
    else
      console.log(err.toString())
    console.log("")
    process.exit(1)

  getUrl: ->
    ## append os to url
    if os = utils.getOs()
      "#{url}?os=#{os}"
    else
      url

  download: (options) ->
    new Promise (resolve, reject) =>
      ascii = [
        chalk.white("  -")
        chalk.blue("Downloading Cypress")
        chalk.yellow("[:bar]")
        chalk.white(":percent")
        chalk.gray(":etas")
      ]

      bar = new ProgressBar(ascii.join(" "), {
        total: options.total
        width: options.width
      })

      ## nuke the bar on error
      terminate = (err) ->
        bar.clear = true
        bar.terminate()
        reject(err)

      progress(request(@getUrl()), {
        throttle: options.throttle
      })

      .on "response", (response) ->
        ## if our status code doesnt start with 200
        if not /^2/.test(response.statusCode)
          terminate _.pick(response, "statusCode", "statusMessage")

      .on "error", terminate

      .on "progress", (state) ->
        ## always subtract the previously percent
        ## amount since our progress notifications
        ## are only the total progress, and our
        ## progress bar expects the delta
        options.current = state.percent - options.percent
        options.percent = state.percent

        bar.tick(options.current)

      .pipe(fs.createWriteStream(options.zipDestination))

      .on "finish", ->
        ## make sure we get to 100% on the progress bar
        if diff = options.total - options.percent
          bar.tick(diff)

        resolve(options)

  unzip: (options) ->
    new Promise (resolve, reject) ->

      resolve = _.partial(resolve, options)

      ascii = [
        chalk.white("  -")
        chalk.blue("Unzipping Cypress  ")
        chalk.yellow("[:bar]")
        chalk.white(":percent")
        chalk.gray(":etas")
      ]

      yauzl.open options.zipDestination, (err, zipFile) ->
        return reject(err) if err

        total = zipFile.entryCount

        bar = new ProgressBar(ascii.join(" "), {
          total: total
          width: options.width
        })

        new Decompress()
          .src(options.zipDestination)
          .dest(options.destination)
          .use(Decompress.zip())
          .use through2.obj (file, enc, cb) ->
            bar.tick(1)
            cb(null, file)
          .run(resolve)

  finish: (options) ->
    ascii = [
      chalk.white("  -")
      chalk.blue("Finished Installing")
      chalk.green(utils.getPathToUserExecutable())
    ]

    console.log ascii.join(" ")

module.exports = Install