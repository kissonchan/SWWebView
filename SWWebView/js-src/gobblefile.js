const gobble = require("gobble");
const rollupConfig = require("./rollup.test.config");

module.exports = gobble([
    gobble("tests").include(["tests.html", "fixtures/**"]),
    gobble("node_modules/mocha").include(["mocha.js", "mocha.css"]),
    gobble("tests").transform("rollup", rollupConfig)
]);
