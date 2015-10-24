$.Carousel = function (el) {
  this.$el = el;
  this.activeIdx = 0

  $('.slide-left').on('click', this.slideLeft.bind(this))
  $('.slide-right').on('click', this.slideRight.bind(this))
}

$.Carousel.prototype.slideLeft = function () {
  this.$findActiveImg().removeClass('active').addClass('left')
  this.activeIdx += 1;
  this.$findActiveImg().addClass('active')
  // .addClass('left')
  // setTimeout((function () {
  //   this.$findActiveImg().removeClass('left')
  // }).bind(this), 0)
}

$.Carousel.prototype.$findActiveImg = function () {
  return $('section.item img:eq(' + this.activeIdx + ')');
}

$.Carousel.prototype.slideRight = function () {
  this.$findActiveImg().removeClass('active').addClass('right')
  this.activeIdx -= 1;
  this.$findActiveImg().addClass('active')
}

$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  })
}
