const express = require("express");
const http = require('http');
const cors = require("cors");
const bodyParser = require('body-parser');

var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

app.get("/health", (req, res) => {
    res.status(200).send('OK');
});

const httpServer = http.createServer(app);
const port = process.env.PORT || 8484;

httpServer.listen(port, () => {
    console.log(`HTTP Server running on port ${port}`);
});

module.exports = app;
