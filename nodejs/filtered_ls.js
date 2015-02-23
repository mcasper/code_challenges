var dir = process.argv[2]
var extension = process.argv[3]
var fs = require("fs")

function printIf(file, index, arr) {
  if (file.extension == extension) {
    console.log("hi")
  }
}

var what = fs.readdir(dir, "utf8", function doneReading(err, list) {
  console.log("before the forEach")
  list.forEach(printIf)
  console.log("after the forEach")
})

what
