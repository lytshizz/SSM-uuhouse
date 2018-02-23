<!DOCTYPE html>
<html lang="en">
    <head>
        <title>File Upload</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
    </head>
    <body>
    	<a href="showUser?id=2">showUser</a><br/>
    	<a href="insertUser">insertUser</a><br/>
    	<a href="deleteUser?id=4">deleteUser</a>
    	<a href="updateUser">updateUser</a>
        <form method="POST" action="upload" id="postForm" enctype="multipart/form-data" >
            File:
            <input type="file" name="file" id="file" /> <br/>
            Destination:
            <input type="text" value="/tmp" name="destination"/>
            <br/>
            <input type="submit" value="Upload" name="upload" id="upload" />
        </form>
    </body>
    
    <script type="text/javascript">
    // 使用ajax动态上传文件
    $("#upload").click(
    	function() {
    	/* var formData=new FormData();
    	formData.append("myfile", $("#thumbnail")[0].files[0]) */
    	var formData = new FormData("#postForm");
    		$.ajax({
    			url:"http://localhost:8080/uuhouse/house_processRequest.action",
    			type:"POST",
    			data:formData,
    			// 必须false才会自动加上正确的Content-Type
    			contextType:false,  
    			// 必须false才会避开jQuery对 formdata 的默认处理
                // XMLHttpRequest会对 formdata 进行正确的处理
    			processData:false,
    			success:function(data) {
    				if(data.status == "true") {
    					alert("上传成功");
    				}
    				if(data.status == "error") {
    					alert(data.msg);
    				}
    			},
    			error:function() {
    			
    			}
    			
    		})
    	})
    
    </script>
</html>
