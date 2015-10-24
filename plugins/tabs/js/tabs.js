$.Tabs = function (el) {
  this.$el = $(el)
  // this.$contentTabs = $(this.$el.data("content-tabs"))
  this.$contentTabs = $('.content-tabs')
  this.$activeTab = $(this.$contentTabs.find(".active"))

  this.$el.on('click', 'a', this.clickTab.bind(this))
};

$.Tabs.prototype.clickTab = function () {
  event.preventDefault();

  // console.log($(".active"))
  // $(".active").each(function () {
  //   this.removeClass("active")
  // });
  $(".active").removeClass('active').addClass('transitioning')
  var $clickedTab = $(event.target)
  $('article.transitioning').one('transitionend', function () {
    $('article.transitioning').removeClass('transitioning')
    $clickedTab.addClass("active transitioning")
    setTimeout(function () {
      $clickedTab.removeClass('transitioning')
    }, 0)
    var currentTabContentId = $clickedTab.attr('for')
    $(currentTabContentId).addClass('active')
    this.$activeTab = $(this.$contentTabs.find(".active"))
  })

}

$.fn.tabs = function () {
  return this.each(function () {
    new $.Tabs(this);
  });
};
