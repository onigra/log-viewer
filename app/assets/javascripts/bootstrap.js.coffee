jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $.datepicker.setDefaults($.extend($.datepicker.regional['ja']))
  $('.datepicker').datepicker(
    monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
    dayNamesMin: ['日','月','火','水','木','金','土'],
    yearSuffix: '年',
    showMonthAfterYear: true,
    dateFormat: 'yy-mm-dd 00:00:00',
  )
