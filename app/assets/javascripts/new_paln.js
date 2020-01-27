// $(function() {
//   function readURL(input) {
//     if (input.files && input.files[0]) {
//       var reader = new FileReader();
//       reader.onload = function (e) {
//         $('#img_prev').attr('src', e.target.result);
//       }
//       reader.readAsDataURL(input.files[0]);
//     }
//   }
//   $("#book_img").change(function(){
//     readURL(this);
//   });
//  });


// $(function(){
//   //querySelectorでfile_fieldを取得
//   var file_field = document.querySelector('input[type=file]')
//   //fileが選択された時に発火するイベント
//   $('#img-file').change(function(){
//     //選択したfileのオブジェクトをpropで取得
//     var file = $('input[type="file"]').prop('files')[0];
//     //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
//     var fileReader = new FileReader();
//     //読み込みが完了すると、srcにfileのURLを格納
//     fileReader.onloadend = function() {
//       var src = fileReader.result
//       var html= `<img src="${src}" width="114" height="80">`
//       //image_box__container要素の前にhtmlを差し込む
//       $('#image-box__container').before(html);
//     }
//     fileReader.readAsDataURL(file);
//     if (num==1){
//       $('#image-box__container').css('display', 'none')   
//     }
//   });
// });


$(function(){
  $fileField = $('#file')
 
  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "200px",
          height: "150px",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});