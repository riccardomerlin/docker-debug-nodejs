const http = require('http')
const server = http.createServer((req, res) => {
  res.end('Hello Docker World!')
})
const port = 3000
server.listen(port, () => {
  console.log('App running on port ', port);
})