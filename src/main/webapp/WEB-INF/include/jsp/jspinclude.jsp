<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- jstl/c 태그 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- security 태그 추가 --%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<%-- jQuery, Vue 추가 --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@2.6.12/dist/vue.js"></script>
<%-- 
<script src="/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="/find-recipes-by-ingredients/include/js/common.js"></script>
--%>
<%-- 다음 주소록 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- VO --%>
<%@ page import="java.util.List"%>
<%@ page import="com.jns.member.vo.MemberVO"%>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@ page import="com.jns.recipe.vo.RecipeVO"%>
<%@ page import="com.jns.recipeboard.vo.RecipeBoardVO"%>
<%@ page import="com.jns.reply.vo.ReplyVO"%>
<%@ page import="com.jns.subscribe.vo.SubscribeVO"%>