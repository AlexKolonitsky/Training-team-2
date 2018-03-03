(function ($) {
  $(document).ready(function () {

    /* open or close navigation menu <992px*/

    $('#nav-menu').on('click', function () {
      $('.navigation').toggleClass('show');
    });


    $('.filterable .filters input').keyup(function (e) {

      var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');

      var $filteredRows = $rows.filter(function () {
        var value = $(this).find('td').eq(column).text().toLowerCase();
        return value.indexOf(inputContent) === -1;
      });
      $table.find('tbody .no-result').remove();

      $rows.show();
      $filteredRows.hide();

      if ($filteredRows.length === $rows.length) {
        $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="' + $table.find('.filters th').length + '">No result found</td></tr>'));
      }
    });
  });
})(jQuery);
