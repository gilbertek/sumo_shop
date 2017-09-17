const { resolve } = require('path');
const webpack = require('webpack');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

const env = process.env.MIX_ENV || 'dev';
const isProduction = env === 'prod';

// We'll set up some paths for our generated files and our development server
const staticDir = resolve(__dirname, '.');
const destDir = resolve(__dirname, '..', 'priv', 'static');
const publicPath = '/';

module.exports = {
  entry: [staticDir + '/js/app.js', staticDir + '/css/app.scss'],
  output: {
    path: destDir,
    filename: 'js/app.js',
    publicPath
  },
  resolve: {
    extensions: ['.js', '.json', '.jsx', '.css'],
    modules: ['node_modules'],
    alias: {
      jquery: resolve(__dirname, 'node_modules/jquery/dist/jquery.js'),
      jQuery: resolve(__dirname, 'node_modules/jquery/dist/jquery.js')
    }
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
      // Any CSS or SCSS files will run through the css loader, the sass
      // loader, and the import-glob-loader. The last one will allow us to use
      // glob patterns to import SCSS files - for instance, a whole directory of
      // them. That isn't available by default in node-sass
      {
        test: /\.s?css$/,
        use: ExtractTextPlugin.extract({
          use: 'css-loader!sass-loader!import-glob-loader',
          fallback: 'style-loader'
        })
      },
      {
        test: /\.(png|jpg|gif|svg)$/,
        loader: 'file-loader?name=/images/[name].[ext]'
      },
      {
        test: /\.(ttf|eot|svg|woff2?)$/,
        loader: 'file-loader?name=/fonts/[name].[ext]'
      }
    ]
  },
  // And we'll configure our ExtractTextPlugin and CopyWebpackPlugin
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery'
    }),
    new ExtractTextPlugin('css/app.css'),
    // We copy our images and fonts to the output folder
    new CopyWebpackPlugin([
      { from: './static/images', to: 'images' },
      { from: 'node_modules/font-awesome/fonts', to: 'fonts/' }
    ])
  ]
};
