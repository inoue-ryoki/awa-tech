$(function () {
  $('.js-messages').hide();
  $('.form-control').on('keyup', function () {
    var keyword = $.trim($(this).val());

    // 追加コード
    $.ajax({
      type: 'GET',
      url: '/posts/search_results',
      data: { keyword: keyword },
      dataType: 'json'
    })
      .done(function (data) {
        // 一旦リストをクリア
        $('.js-messages').empty();

        // データを反復処理
        $(data).each(function (i, message) {
          // メッセージをリストに追加
          $('.js-messages').append(
            `<li class="message">${message.text}</li>`
          );
        });
        if ($('.js-messages li').length > 0) {
          // リスト内に要素がある場合のみ表示
          $('.js-messages').show();
        } else {
          // 一致するデータがない場合は非表示
          $('.js-messages').hide();
        }
      });
  });
});
