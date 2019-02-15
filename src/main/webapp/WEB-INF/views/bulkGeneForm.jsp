<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form id="qForm" action="/QueryBuilder/bulkGeneQuery/" method="post"
			commandName="queryString" target="_blank">
			Genes (symbols or RGD_IDs):<br>
			<textarea name="qString" type="text" class="ui-widget-content"
								rows="20" cols="80" ></textarea>
			<br>
			<input id="search" type="submit" value="Search"
						class="button" />
        </form>
</body>
</html>