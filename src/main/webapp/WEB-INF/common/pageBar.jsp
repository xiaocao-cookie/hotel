<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
    var contextPath = "${ctx}";
</script>
<span id="totalCount" style="margin-left: 20px">总共 ${pager.totalCount} 条</span>
<div class="pages">
    <c:if test="${pager.pageCount>=1}">
        <a href="#" onclick="jump(1)" class="p_pre">首页</a>
        <c:if test="${pager.currentPage>1}">
            <a href="#" onclick="jump(${pager.currentPage-1})" class="p_pre">上一页</a>
        </c:if>
        <c:forEach  var="temp" begin="${pager.currentPage>3?pager.currentPage-3:1}" end="${pager.pageCount-pager.currentPage>3?pager.currentPage+3:pager.pageCount}" step="1">
            <c:if test="${pager.currentPage==temp}">
                <a href="#" onclick="jump(${temp})" class="cur">${temp}</a>
            </c:if>
            <c:if test="${pager.currentPage!=temp}">
                <a href="#" onclick="jump(${temp})">${temp}</a>
            </c:if>
        </c:forEach>
        <c:if test="${pager.currentPage<pager.pageCount}">
            <a href="#" onclick="jump(${pager.currentPage+1})" class="p_pre">下一页</a>
        </c:if>
        <a href="#" onclick="jump(${pager.pageCount});" class="p_pre">尾页</a>
    </c:if>
    <c:if test="${pager.pageCount==0}">
        暂无记录
    </c:if>
</div>