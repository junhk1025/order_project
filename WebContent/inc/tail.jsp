<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ##### tail.jsp ##### -->
<script>
if(${navLv!=1}){
	$(".nav").attr("class","sub-nav");
}
switch (${subTitleNum}){
case 1:
	$(".section01").attr("id","bg-company");
	break;
case 2:
	$(".section01").attr("id","bg-info");
	break;
case 3:
	$(".section01").attr("id","bg-directions");
	break;
case 4:
	$(".section01").attr("id","bg-customerService");
	break;
}
</script>

<!-- ##### tail.jsp ##### -->