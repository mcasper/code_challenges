var dir = process.argv[2]
var extension = "." + process.argv[3]
var fs = require("fs")
var path = require("path")

fs.readdir(dir, function callback (err, list) {
  list.forEach(function(file) {
    if (path.extname(file) == extension) {
      console.log(file)
    }
  })
})
