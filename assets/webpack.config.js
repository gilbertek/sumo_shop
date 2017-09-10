const { resolve } = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require("copy-webpack-plugin");

const env = process.env.MIX_ENV || "dev";
const isProduction = env === "prod";

// We'll set up some paths for our generated files and our development server
const staticDir = resolve(__dirname, ".");
const destDir = resolve(__dirname, "..", "priv", "static");
const publicPath = "/";

module.exports = {
  entry: [staticDir + "/js/app.js", staticDir + "/css/app.scss"],
  output: {
    path: destDir,
    filename: "js/app.js",
    publicPath
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: "babel-loader",
        query: {
          presets: ["es2015"]
        }
      },
      // Any CSS or SCSS files will run through the css loader, the sass
      // loader, and the import-glob-loader. The last one will allow us to use
      // glob patterns to import SCSS files - for instance, a whole directory of
      // them. That isn't available by default in node-sass
      {
        test: /\.s?css$/,
        use: ExtractTextPlugin.extract({
          use: "css-loader!sass-loader!import-glob-loader",
          fallback: "style-loader"
        })
      }
    ]
  },
  // And we'll configure our ExtractTextPlugin and CopyWebpackPlugin
  plugins: [
    new ExtractTextPlugin("css/app.css"),
    // We copy our images and fonts to the output folder
    new CopyWebpackPlugin([{ from: "./static/images", to: "images" }])
  ]
};
