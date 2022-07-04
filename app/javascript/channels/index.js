// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")
//= require 'greensock/TweenLite'
//= require 'greensock/TimelineMax'
//= require 'greensock/easing/EasePack'

const letters = document.querySelector(".letters");
const tl = new TimelineMax();
tl.from(letters, 1, {x:-80, opacity:0});
