$('a').on 'ajax:success', ->
  $(this).closest('tr').fadeOut();
