
module.exports = function(config) {
  config.set({
    basePath: "",
    frameworks: ["jasmine"],
    files: ["spec/javascripts/**/*_spec.js"],
    preprocessors: {
      "app/javascript/packs/*.js": ["webpack", "sourcemap"],
      "spec/javascripts/**/*_spec.js": ["webpack", "sourcemap"],
    },
    reporters: ["mocha"],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: ['ChromeHeadlessNoSandbox'],
    customLaunchers: {
      ChromeHeadlessNoSandbox: {
        base: 'ChromeHeadless',
        flags: ['--headless', '--disable-gpu','--no-sandbox','--disable-dev-shm-usage']
      }
    },
    singleRun: true,
    concurrency: Infinity,
    webpack: require("./config/webpack/test.js"),
    webpackMiddleware: {
      stats: "errors-only"
    }
  })
}
