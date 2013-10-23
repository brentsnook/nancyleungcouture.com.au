$(function() {
  $(document).ready(function() {
    $('.hero').slidesjs({

      width: 1020,
      height: 800,

      navigation: {
        active: false,
        effect: 'fade'
      },

      play: {
        active: false,
        effect: 'fade',
        interval: 5000,
        auto: true,
        swap: false,
        pauseOnHover: true,
      },

      effect: {
        fade: {
          speed: 500,
          crossfade: true
        }
      },

      pagination: {
        active: false
      }
    });
  });
});