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

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>设定上传文件的格式</legend>
</fieldset>

<input id="test1" type="file" name="file" class="layui-upload-file">
<input type="file" name="file" lay-type="file" class="layui-upload-file">
<input type="file" name="file1" lay-type="audio" class="layui-upload-file">
<input type="file" name="file2" lay-type="video" class="layui-upload-file">
<blockquote class="layui-elem-quote" style="margin-top: 20px;">支持拖动文件上传</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>演示上传</legend>
</fieldset>

<div class="site-demo-upload">
    <img id="LAY_demo_upload" src="${base}/static/plugins/layui/images/tong.jpg">
    <div class="site-demo-upbar">
        <input type="file" name="file" class="layui-upload-file" id="test">
    </div>
</div>

<p style="margin-top: 20px;">注：由于服务器资源有限，所以此处每次给你返回的是同一张图片</p>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>自定义文本</legend>
</fieldset>

<input type="file" name="file" class="layui-upload-file" lay-title="添加一个碉堡了的图片">

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>保留原始风格</legend>
</fieldset>

<input type="file" name="file">

<blockquote class="layui-elem-quote" style="margin-top: 20px;">即不改变input的样式，只提供上传功能</blockquote>

<script type="text/javascript" src="${base}/static/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/plugins/jquery/jquery.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('upload', function(){
        layui.upload({
            url: '${base}/test/upload' //上传接口
            ,success: function(res){ //上传成功后的回调
                debugger;
                console.log(res)
            }
        });

        layui.upload({
            url: '${base}/test/upload'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'post' //上传接口的http类型
            ,success: function(res){
                LAY_demo_upload.src = '${base}/' + res.data;
            }
        });
    });
</script>

</body>
</html>