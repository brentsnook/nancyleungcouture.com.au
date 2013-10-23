$(function() {
  $(document).ready(function() {
    $('.images').slidesjs({

      width: 520,
      height: 780,

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