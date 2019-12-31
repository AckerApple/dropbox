const fs = require('fs')
const path = require('path')
let output = process.argv[2]
let fName = '_'+process.argv[2].split(/(\/|\\)/).pop()

fs.writeFileSync(path.join(__dirname, fName), output)

