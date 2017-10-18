<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>表单</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<#include "/widget/common-css.html">
	</head>

	<body>

		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
			<legend>选完文件后不自动上传</legend>
		</fieldset>

		<div class="layui-upload">
			<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
			<button type="button" class="layui-btn" id="test9">开始上传</button>
		</div>

		<script type="text/javascript" src="${base}/static/plugins/layui/layui.js"></script>

		<script type="text/javascript">
            layui.use('upload', function() {
                var $ = layui.jquery
                        , upload = layui.upload;

                //普通图片上传
                var uploadInst = upload.render({
                    elem: '#test1'
                    , url: '/upload/'
                    , before: function (obj) {
                        //预读本地文件示例，不支持ie8
                        obj.preview(function (index, file, result) {
                            $('#demo1').attr('src', result); //图片链接（base64）
                        });
                    }
                    , done: function (res) {
                        //如果上传失败
                        if (res.code > 0) {
                            return layer.msg('上传失败');
                        }
                        //上传成功
                    }
                    , error: function () {
                        //演示失败状态，并实现重传
                        var demoText = $('#demoText');
                        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                        demoText.find('.demo-reload').on('click', function () {
                            uploadInst.upload();
                        });
                    }
                });
            });

			//选完文件后不自动上传
			/*upload.render({
				elem: '#test8'
				,url: '/upload/'
				,auto: false
				//,multiple: true
				,bindAction: '#test9'
				,done: function(res){
					console.log(res)
				}
			});*/
		</script>

	</body>


</html>