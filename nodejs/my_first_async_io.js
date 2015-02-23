var fs = require("fs")
var lineCount = undefined

function string(callback) {
  fs.readFile(process.argv[2], 'utf8', function doneReading(err, fileContents) {
    lineCount = fileContents.split("\n").length - 1
    callback()
  })
}

function print() {
  console.log(lineCount)
}

string(print)
