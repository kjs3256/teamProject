<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 스타일시트 -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath }/dist/lang/summernote-ko-KR.js"></script>
<script>
	$(document).ready(function(){
    $("#header").load("${pageContext.request.contextPath }/header")
    });
</script>
</head>
<body>
	<div id="header"></div>
	<section>
	<div class="container">
		<div class="row">
			<form:form method="post" commandName="formData" name="writeForm"
				onsubmit="return writeSave()">
				<table class="table" style="border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color:#000000; color:white; text-align:center;"><h3>글 쓰기</h3></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<form:input class="form-control" placeholder="제목" path="title" /><br>
								<small id="error"><form:errors path="title"/></small>
							</td>
						</tr>
						<tr>
							<td><form:textarea class="form-control" row="7" id="summernote" path="content"></form:textarea></td>
						</tr>
					</tbody>
				</table>
				<div style="margin-bottom:20px">
					<input type="submit" class="btn btn-success pull-right" value="글쓰기"/>
					<a href="<c:url value='/userBoard/list'/>" class="btn btn-primary">목록</a>
				</div>
			</form:form>
		</div>
	</div>
</section>
<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote({
      height: 300,
      minHeight: null,
      maxHeight: null,
      focus: true,
      callbacks: {
        onImageUpload: function(files, editor, welEditable) {
          for (var i = files.length - 1; i >= 0; i--) {
            sendFile(files[i], this);
          }
        }
      }
    });
  });
function sendFile(file, editor) {
    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
      data: form_data,
      type: "POST",
      url: '/teamProject/userBoard/image',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(data) {
        $(editor).summernote('editor.insertImage', data);
      }
    });
  }
</script>
</body>
</html>