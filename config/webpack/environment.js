const { environment } = require('@rails/webpacker')
// import { ProvidePlugin } from 'webpack'
// environment.plugins.append('Provide',
//   new ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
//     Popper: ['popper.js','default']
//   })
//   )

  const webpack = require('webpack')
  environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
      $: 'jquery/src/jquery',
      jQuery: 'jquery/src/jquery'
    })
  )
module.exports = environment
