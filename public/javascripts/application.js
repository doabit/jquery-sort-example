$(function(){
    sortList("posts","tr");//调用排序方法，对post对行排序
})
//排序方法，obj:要排序的model复数名，item：排序元素，jqeury官方文发写的是对li进行排序，但可以对表格排序，具体访谈录请参考jquery ui文档
function sortList(obj,item)
{
	$('#'+obj).sortable({
          axis: 'y',
          dropOnEmpty: false,
          //handle: '.handle',
          cursor: 'crosshair',
          items: item,
          opacity: 0.4,
          scroll: true,
          update: function(){
            $.ajax({
              type: 'post',
              data: $('#'+obj).sortable('serialize'),
              dataType: 'script',
              complete: function(request){
                $('#'+obj).effect('highlight');
                },
              url: ""+obj+"/sort"});
            }
   		});
}