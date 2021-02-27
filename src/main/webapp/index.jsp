<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지 테스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Open Sans -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<style>
div, h1, h2, h3, h4, h5, h6, p {
	font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

html {
	height: 100%;
	font-size: 14px;
}

@media ( min-width : 768px) {
	html {
		font-size: 16px;
	}
}

body {
	position: relative;
	min-height: 100%;
	background: #2F3032;
	box-shadow: inset 0 0 200px rgba(0, 0, 0, 0.1), inset 0 0 20px
		rgba(0, 0, 0, 0.08);
}

h1, h2, h3, h4, h5, h6 {
	margin-top: 0;
}

h1 {
	font-size: 2rem;
	font-weight: 300;
	line-height: 2.5rem;
	letter-spacing: 4px;
}

@media ( min-width : 768px) {
	h1 {
		font-size: 2.375rem;
		line-height: 2.75rem;
	}
}

p {
	margin-bottom: 20px;
	font-size: 1rem;
	font-weight: 300;
	letter-spacing: 0.5px;
	line-height: 1.6rem;
}

p highlight {
	font-weight: 600;
	color: #ff7f00;
}

p:last-child {
	margin-bottom: 0;
}

code {
	font-size: 0.875rem;
}

nav.navbar {
	height: 70px;
	background: transparent;
	border: none;
	transition: background-color 0.3s;
	will-change: transform;
}

nav.navbar.show-color {
	background: black;
	box-shadow: 0px 6px 16px -2px rgba(0, 0, 0, 0.3);
}

nav.navbar.show-color .navbar-home {
	visibility: visible;
	transform: translate(100%, 0);
	transform: translate3d(100%, 0, 0);
	opacity: 1;
}

.navbar-home {
	visibility: hidden;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: absolute;
	top: 0px;
	left: 0px;
	height: 70px;
	width: 10%;
	transform: translate(100%, -50%);
	transform: translate3d(100%, -50%, 0);
	transition: transform 0.2s ease-in, opacity 0.2s ease-in, visibilit 0.2s
		ease-in;
	opacity: 0;
}

.navbar-home svg {
	width: 20px;
	height: 20px;
	fill: #BDC4D0;
}

.navbar-brand {
	position: relative;
	height: 70px;
	padding: 0 28px 0 15px;
	padding: 0 28px 0 45px;
	font-size: 20px;
	font-weight: 300;
	line-height: 80px;
	letter-spacing: 1px;
	color: #18190e;
	vertical-align: middle;
}

.navbar-brand:hover, .navbar-brand:focus {
	color: white;
}

.navbar-brand i.material-icons {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translate(0, -50%);
}

.navbar-toggle {
	height: 70px;
	margin: 0;
	padding: 0 20px;
	color: black;
	border: none;
}

.navbar-toggle.collapsed {
	color: #e7e6f1;
}

@media ( max-width : 767px) {
	.navbar-collapse {
		background: #e5e4ea;
	}
}

ul.navbar-nav {
	color: black;
}

@media ( min-width : 768px) {
	ul.navbar-nav {
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		float: none;
		text-align: center;
		color: #423b2f;
	}
}

@media ( min-width : 768px) {
	ul.navbar-nav>li {
		float: none;
		display: inline-block;
	}
}

ul.navbar-nav>li>a {
	padding: 0 20px;
	font-size: 14px;
	font-weight: 400;
	text-transform: uppercase;
	line-height: 70px;
	letter-spacing: 1px;
	color: currentColor;
}

ul.navbar-nav>li>a:hover {
	background: rgba(0, 0, 0, 0.15);
}

ul.navbar-nav>li>a:focus {
	background: rgba(0, 0, 0, 0.2);
}

@media ( max-width : 767px) {
	ul.navbar-nav>li.active {
		background: rgba(0, 0, 0, 0.1);
	}
}

@media ( min-width : 768px) {
	ul.navbar-nav>li.active {
		color: #ff7f00;
		background: rgba(255, 255, 255, 0.15);
		box-shadow: inset 0 -3px 0 0 #ff7f00;
	}
}

ul.navbar-nav>li.active>a:hover, ul.navbar-nav>li.active>a:focus {
	background: none;
}

section {
	position: relative;
	padding: 30px 0 50px;
	background: white;
}

section:last-of-type {
	min-height: 20vh;
}

section.focus .page-header {
	color: #ff7f00;
}

section.focus .page-header:after {
	visibility: visible;
	opacity: 1;
}

.section-header {
	position: relative;
	margin-bottom: 40px;
	font-size: 26px;
	font-weight: 400;
	color: #333;
	text-align: center;
	line-height: 60px;
	letter-spacing: 1px;
}

.section-header:after {
	content: "";
	display: block;
	position: absolute;
	left: 50%;
	bottom: 0;
	width: 70px;
	height: 2px;
	background: #ff7f00;
	transform: translate(-50%, 0);
	transform: translate3d(-50%, 0, 0);
}

.section-sub-header {
	position: relative;
	margin-bottom: 40px;
	font-size: 22px;
	font-weight: 300;
	text-align: center;
	line-height: 60px;
	letter-spacing: 1px;
}

.banner .banner-child {
	padding: 25px 15px;
	height: 500px;
}

.banner .bc-left {
	color: #e7e6f1;
	background: #ff7f00;
}

.banner .bc-right {
	color: #333;
	background: #F3F4F8;
}

.page-header {
	position: relative;
	margin-top: 0;
	margin-bottom: 50px;
	letter-spacing: 1px;
	color: #333;
	transition: color 0.2s ease-in;
}

.page-header: {
	visibility: hidden;
	display: block;
	content: "Boom!!! got your focus now ay :-)";
	position: absolute;
	top: 100%;
	padding-top: 25px;
	font-size: 16px;
	transition: opacity 0.2s ease-in, visibility 0.2s ease-in;
	opacity: 0;
}

footer {
	min-height: 240px;
	position: relative;
	padding: 50px 0 150px;
	font-size: 22px;
	text-align: center;
	letter-spacing: 1px;
	color: #e7e6f1;
	background: #2F3032;
}

a.tutorials-link {
	display: block;
	position: relative;
	width: 180px;
	margin: 0 auto 25px;
	padding: 15px 0;
	font-size: 0.875rem;
	font-weight: 600;
	text-align: center;
	text-transform: uppercase;
	text-decoration: none;
	letter-spacing: 2px;
	color: #ff7f00;
	border: 2px solid #ff7f00;
	transition: background 0.2s ease, color 0.2s ease, box-shadow 0.2s ease;
}

a.tutorials-link:hover {
	color: #e7e6f1;
	background: #ff7f00;
	box-shadow: 0 6px 12px -4px rgba(0, 0, 0, 0.3);
}

#home {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	position: relative;
	min-height: 400px;
	height: 60vh;
	padding: 50px 0;
	/* Layering due to Psuedo overlay */
}

@media ( min-width : 768px) {
	#home {
		height: 80vh;
		min-height: 640px;
	}
}

#home:before {
	content: "";
	display: block;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	min-height: 400px;
	height: 60vh;
	background-image:
		url("https://cdn.pixabay.com/photo/2014/12/20/13/59/vegetables-573958_1280.jpg");
	background-image:
		url("https://cdn.pixabay.com/photo/2014/12/20/13/59/vegetables-573958_1280.jpg");
	background-size: cover;
	background-position: center bottom;
	will-change: transform;
	z-index: 0;
}

@media ( min-width : 768px) {
	#home:before {
		height: 80vh;
		min-height: 640px;
	}
}

#home .container {
	z-index: 1;
}

#home .mouse {
	position: relative;
	width: calc(28px * 2);
	height: calc(44px * 2);
	margin: 0 auto 20px;
	background: none;
	border: 2px solid white;
	border-radius: calc(16px * 2);
	z-index: 1;
}

@media ( min-width : 768px) {
	#home .mouse {
		width: calc(28px * 4);
		height: calc(44px * 4);
		margin: 0 auto 30px;
		background: none;
		border: 2px solid white;
		border-radius: calc(16px * 4);
	}
}

#home .mouse:after {
	display: block;
	content: "";
	position: absolute;
	top: 10px;
	left: 50%;
	width: calc(5px * 2);
	height: calc(5px * 2);
	background: none;
	border: 2px solid white;
	border-radius: 100%;
	-webkit-animation-name: scrollWheel;
	animation-name: scrollWheel;
	-webkit-animation-duration: 1.4s;
	animation-duration: 1.4s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: ease;
	animation-timing-function: ease;
	will-change: transform;
}

@media ( min-width : 768px) {
	#home .mouse:after {
		position: absolute;
		top: 25px;
		left: 50%;
		width: calc(5px * 4);
		height: calc(5px * 4);
	}
}

#home h1 {
	text-align: center;
	text-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
	color: #e7e6f1;
}

#home h4 {
	font-size: 14px;
	font-weight: 600;
	text-align: center;
	text-transform: uppercase;
	text-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
	letter-spacing: 2px;
	color: #ff7f00;
}

#home p {
	margin: 0;
	padding: 25px 0;
	text-align: center;
	text-shadow: 0px 0px 40px rgba(0, 0, 0, 0.5), 1px 1px 3px
		rgba(0, 0, 0, 0.3);
	line-height: 26px;
	color: #e7e6f1;
}

#about p {
	text-align: center;
	color: #333;
}

#demo {
	background: #F3F4F8;
}

#demo h4 {
	margin-bottom: 20px;
	margin-bottom: 0px;
	font-size: 0.875rem;
	font-weight: 400;
	text-transform: uppercase;
	line-height: 24px;
	letter-spacing: 1px;
	color: #BDC4D0;
}

#demo .video-roll--container {
	padding: 0;
}

@media ( min-width : 768px) {
	#demo .video-roll--container {
		padding: 0 15px;
	}
}

#demo .video-roll {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-items: center;
	position: relative;
	width: 100%;
	max-width: 1000px;
	margin: 0 auto 80px;
	padding: 25px 0 0;
	list-style: none;
}

@media ( min-width : 768px) {
	#demo .video-roll {
		margin: 0 auto 120px;
	}
}

#demo .video-roll:after {
	content: "";
	display: block;
	width: 30%;
	height: 14px;
	margin: -90px auto 0;
	margin: -20px auto 0;
	background: transparent;
	border-radius: 50%;
	box-shadow: 0 50px 40px rgba(0, 0, 0, 0.4);
}

@media ( min-width : 768px) {
	#demo .video-roll:after {
		margin: 0px auto 0;
	}
}

#demo .video-roll li {
	display: flex;
	flex-direction: column;
	flex-grow: 0;
	flex-shrink: 1;
	align-items: stretch;
	align-content: stretch;
	position: relative;
	background: transparent;
}

#demo .video-roll li:before {
	content: "";
	display: block;
	padding-top: 56.25%;
}

#demo .video-roll li:after {
	content: "";
	display: block;
	position: absolute;
	left: 50%;
	bottom: 0px;
	width: 60%;
	height: 14px;
	margin: -90px auto 0;
	background: transparent;
	border-radius: 50%;
	box-shadow: 0 50px 40px rgba(0, 0, 0, 0.25);
	transform: translate(-50%, 0);
	transform: translate3d(-50%, 0, 0);
}

#demo .video-roll li:first-child {
	visibility: hidden;
	flex-basis: 10%;
	transform: translate(50%, 0);
	transform: translate3d(50%, 0, 0);
	opacity: 0;
}

@media ( min-width : 768px) {
	#demo .video-roll li:first-child {
		visibility: visible;
		flex-basis: 30%;
		opacity: 1;
	}
}

#demo .video-roll li:first-child a {
	background-image:
		url("https://i.ytimg.com/vi/kLiMpaMKal8/maxresdefault.jpg");
	transform-origin: left center;
}

#demo .video-roll li:nth-child(2) {
	flex-basis: 80%;
	z-index: 2;
}

@media ( min-width : 768px) {
	#demo .video-roll li:nth-child(2) {
		flex-basis: 40%;
	}
}

#demo .video-roll li:nth-child(2):after {
	display: none;
}

#demo .video-roll li:nth-child(2) a {
	flex-grow: 1;
	background-image:
		url("https://i.ytimg.com/vi/aVFYHGtf6So/maxresdefault.jpg");
	transform-origin: center center;
}

#demo .video-roll li:last-child {
	visibility: hidden;
	flex-basis: 10%;
	transform: translate(-50%, 0);
	transform: translate3d(-50%, 0, 0);
	opacity: 0;
}

@media ( min-width : 768px) {
	#demo .video-roll li:last-child {
		visibility: visible;
		flex-basis: 30%;
		opacity: 1;
	}
}

#demo .video-roll li:last-child a {
	background-image:
		url("https://i.ytimg.com/vi/OKxASY7ABfs/maxresdefault.jpg");
	transform-origin: right center;
}

#demo .video-roll li a {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-size: cover;
	background-position: center center;
	transform: translate(0, 0);
	transform: translate3d(0, 0, 0);
	transition: transform 0.2s ease-out;
	will-change: transform;
}

#demo .video-roll li a:hover {
	transform: translate(0, -4px);
	transform: translate3d(0, -4px, 0);
}

#features {
	padding-bottom: 0;
	color: #333;
}

#features .feature-container {
	margin-bottom: 80px;
}

@media ( min-width : 768px) {
	#features .feature-container {
		margin-bottom: 80px;
	}
}

#features .feature {
	padding: 25px 0;
}

@media ( min-width : 768px) {
	#features .feature {
		padding: 50px 0;
	}
}

#features .feature svg {
	width: 40px;
	height: 40px;
	margin-bottom: 15px;
	fill: currentColor;
}

@media ( min-width : 768px) {
	#features .feature svg {
		width: 60px;
		height: 60px;
	}
}

#features .feature h4 {
	font-size: 14px;
	font-weight: 600;
	text-transform: uppercase;
	line-height: 24px;
	letter-spacing: 2px;
	color: #ff7f00;
}

#features .feature p {
	font-size: 14px;
	font-weight: 300;
	color: #BDC4D0;
	letter-spacing: 1px;
}

#features .animated-scroll {
	display: flex;
	flex-direction: column;
	position: relative;
	width: 80%;
	max-width: 450px;
	height: 315px;
	margin: 0 auto;
	border: 4px solid #826dd5;
	border-bottom-color: transparent;
	border-radius: 6px;
	overflow: hidden;
}

#features .animated-scroll .scroll-header {
	display: flex;
	flex-direction: row;
	flex-grow: 0;
	flex-shrink: 0;
	flex-basis: 60px;
	align-items: center;
	justify-content: center;
	background: #826dd5;
}

#features .animated-scroll .scroll-header .scroll-nav {
	width: 15%;
	height: 8px;
	margin-right: 5%;
	border-radius: 4px;
}

#features .animated-scroll .scroll-header .sn-1 {
	-webkit-animation-name: scrollColor-1;
	animation-name: scrollColor-1;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 5s;
	animation-duration: 5s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .animated-scroll .scroll-header .sn-2 {
	-webkit-animation-name: scrollColor-2;
	animation-name: scrollColor-2;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 5s;
	animation-duration: 5s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .animated-scroll .scroll-header .sn-3 {
	margin-right: 0;
	-webkit-animation-name: scrollColor-3;
	animation-name: scrollColor-3;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 5s;
	animation-duration: 5s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .animated-scroll .scroll-header svg.cursor {
	position: absolute;
	top: 28px;
	left: 50%;
	width: 20%;
	height: 20px;
	-webkit-animation-name: scrollCursor;
	animation-name: scrollCursor;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 5s;
	animation-duration: 5s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	z-index: 2;
}

#features .animated-scroll .scroll-body {
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	flex-shrink: 1;
	flex-basis: auto;
	padding-top: 20px;
	overflow: hidden;
}

#features .animated-scroll .scroll-child {
	flex-grow: 0;
	flex-shrink: 0;
	flex-basis: 150px;
	width: 90%;
	margin: 0 auto 20px;
	fill: #404040;
	background: rgba(255, 255, 255, 0.2);
	border-radius: 4px;
	-webkit-animation-name: scrollDemo;
	animation-name: scrollDemo;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 5s;
	animation-duration: 5s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .animated-scroll .sc-back-to-top {
	flex-basis: 40px;
	width: 40px;
	margin: 0 auto;
	border-radius: 100%;
	-webkit-animation-name: scrollBackToTop;
	animation-name: scrollBackToTop;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 5s;
	animation-duration: 5s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	z-index: 0;
}

#features .focus-events {
	display: flex;
	flex-direction: column;
	position: relative;
	width: 80%;
	max-width: 450px;
	height: 315px;
	margin: 0 auto;
	border: 4px solid #e6e8f0;
	border-bottom-color: transparent;
	border-radius: 6px;
	overflow: hidden;
}

#features .focus-events .scroll-header {
	display: flex;
	flex-direction: row;
	flex-grow: 0;
	flex-shrink: 0;
	flex-basis: 60px;
	align-items: center;
	justify-content: center;
	background: #e6e8f0;
}

#features .focus-events .scroll-header .scroll-nav {
	width: 15%;
	height: 8px;
	margin-right: 5%;
	border-radius: 4px;
}

#features .focus-events .scroll-header .sn-1 {
	-webkit-animation-name: focusColor-1;
	animation-name: focusColor-1;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 4s;
	animation-duration: 4s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .focus-events .scroll-header .sn-2 {
	-webkit-animation-name: focusColor-2;
	animation-name: focusColor-2;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 4s;
	animation-duration: 4s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .focus-events .scroll-header svg.cursor {
	position: absolute;
	top: 28px;
	left: 50%;
	width: 20%;
	height: 20px;
	-webkit-animation-name: focusCursor;
	animation-name: focusCursor;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 4s;
	animation-duration: 4s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	z-index: 2;
}

#features .focus-events .scroll-body {
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	flex-shrink: 1;
	flex-basis: auto;
	padding-top: 20px;
	overflow: hidden;
}

#features .focus-events .scroll-child {
	flex-grow: 0;
	flex-shrink: 0;
	flex-basis: 150px;
	width: 90%;
	margin: 0 auto 20px;
	padding: 10% 5%;
	background: rgba(0, 0, 0, 0.05);
	background: #edeef4;
	border-radius: 4px;
	-webkit-animation-name: focusDemo;
	animation-name: focusDemo;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: ease-in;
	animation-timing-function: ease-in;
	-webkit-animation-duration: 4s;
	animation-duration: 4s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

#features .focus-events .scroll-child .header {
	height: 14px;
	width: 50%;
	margin: 0 auto 8px;
	border-radius: 8px;
	background: #dcdfeb;
}

#features .focus-events .scroll-child .sub-header {
	height: 10px;
	width: 40%;
	margin: 0 auto 22px;
	border-radius: 6px;
	background: #e3e5ef;
}

#features .focus-events .scroll-child .body {
	width: 70%;
	height: 8px;
	margin: 0 auto 8px;
	background: #e0e2ed;
}

#features .focus-events .sc-2 .header {
	-webkit-animation-name: focusHeaderColor;
	animation-name: focusHeaderColor;
	-webkit-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-duration: 4s;
	animation-duration: 4s;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
}

@
-webkit-keyframes scrollWheel {from { transform:translate(-50%, 0);
	transform: translate3d(-50%, 0, 0);
	opacity: 1;
}

to {
	transform: translate(-50%, 20px);
	transform: translate3d(-50%, 20px, 0);
	opacity: 0;
}

@media ( min-width : 768px) {
	from {
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
		opacity: 1;
	}
	to {
		transform: translate(-50%, 40px);
		transform: translate3d(-50%, 40px, 0);
		opacity: 0;
	}
}

}
@
keyframes scrollWheel {from { transform:translate(-50%, 0);
	transform: translate3d(-50%, 0, 0);
	opacity: 1;
}

to {
	transform: translate(-50%, 20px);
	transform: translate3d(-50%, 20px, 0);
	opacity: 0;
}

@media ( min-width : 768px) {
	from {
		transform: translate(-50%, 0);
		transform: translate3d(-50%, 0, 0);
		opacity: 1;
	}
	to {
		transform: translate(-50%, 40px);
		transform: translate3d(-50%, 40px, 0);
		opacity: 0;
	}
}

.highlight {
	padding: 9px 14px;
	margin-bottom: 14px;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
	border-radius: 4px;
}

.highlight pre {
	padding: 0;
	margin-top: 0;
	margin-bottom: 0;
	word-break: normal;
	white-space: nowrap;
	background-color: transparent;
	border: 0;
}

.highlight pre code {
	font-size: inherit;
	color: #333;
}

.highlight pre code:first-child {
	display: inline-block;
	padding-right: 45px;
}
</style>
</head>
<body data-spy="scroll" data-target="#scroll-spy">
	<!-- Navigation - Fixed Top -->
	<nav class="navbar navbar-fixed-top">
		<div class="container-fluid">
			<!-- navbar-nav -->
			<ul class="nav navbar-nav ">
				<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
			</ul>
			<!-- /.navbar-nav -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- /.fixed navigation -->

	<section id="home">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h1>Jeon Nyeng Si</h1>
					<h4>by 3조</h4>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">
					<p>전냉시 사이트입니다.</p>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-12">
					<a class="tutorials-link" href="" role="button">Read More
						Recipe</a>
				</div>
			</div>
		</div>
		<!-- /.container -->
	</section>
	<!-- /#home -->

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">About</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">

					<h3>공지사항 관련 URL</h3>
					<ul>
						<li><a href="noticeForm.do">공지사항 글쓰기</a></li>
						<li><a href="noticeSelectAllPage.do">공지사항 목록</a></li>
					</ul>

					<hr>

					<h3>QnA 관련 URL</h3>
					<ul>
						<li><a href="qnaForm.do">QnA 글쓰기</a></li>
						<li><a href="qnaSelectAllPage.do">QnA 목록</a></li>
					</ul>

					<hr>

					<h3>레시피 관련 URL</h3>
					<ul>
						<li><a href="recipelist.do">레시피 리스트</a></li>
						<li><a href="recipeboard.do">레시피 일반 게시판</a></li>
					</ul>

					<hr>

					<h3>회원 관련 URL</h3>
					<ul>
						<li><a href="memberForm.do">회원가입</a></li>
						<li><a href="memberSelectAllPage.do">회원목록</a></li>

					</ul>

					<hr>




					<h3>셰프 관련 URL</h3>

					<ul>
						<li><a href="chefboard/writeForm.do">chefboard writeForm</a></li>
						<li><a href="chefboard/writeFormFile.do">chefboard
								writeForm 파일</a></li>
						<li><a href="chefboard/boardselectall.do">chefboard
								boardList</a></li>
						<li><a href="chefboard/boardselectallpage.do">chefboard
								페이징</a></li>
					</ul>

					<hr>

					<h3>댓글 관련 URL</h3>
					<ul>
						<li><a href="reply/reply.do">댓글 테스트</a></li>
						<li><a href="reply/rbreply.do">레시피 댓글 테스트</a></li>
					</ul>

					<hr>

					<h3>구매 관련 URL</h3>
					<ul>
						<li><a href="searchPage.do">상품 검색 페이지(최근검색어,최근본상품,관심상품등록)</a></li>
						<li><a href="likeProduct.do">관심상품 목록 보기</a></li>
						<li><a href="socketTest2">웹소켓 테스트</a></li>
					</ul>

					<hr>

					<h3>권한 & 로그인 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/main.do">일반 접속</a></li>
						<li><a href="/kosmoJns/admin/main.do">admin 접속</a></li>
					</ul>

					<hr>

					<h3>세프 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
					</ul>

					<hr>

					<h3>세프 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/chef/test.do">테스트</a></li>
					</ul>

					<hr>

					<h3>구독 관련 URL</h3>
					<ul>
						<li><a href="/kosmoJns/subscribe/test.do">테스트</a></li>
					</ul>

					<h3>플라스크 테스트</h3>
					<ul>
						<li><a href="sendNutrient.do?rcp_seq=1">플라스크 테스트 - 영양소</a></li>
						<li><a
							href="sendSubscribeInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
								테스트 - 월별구독자증가추이(파라미터 : 201102 ~ 202102)</a></li>
						<li><a
							href="sendSignupInc?start_yyyymm=201102&end_yyyymm=202102">플라스크
								테스트 - 월별회원가입증가추이(파라미터 : 201102 ~ 202102)</a></li>
					</ul>

					<hr>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#about -->

	<section id="demo">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">Demo</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="video-roll--container col-xs-12">
					<ul class="video-roll">
						<li><a href="https://youtu.be/kLiMpaMKal8" target="_blank"></a></li>
						<li><a href="https://youtu.be/aVFYHGtf6So" target="_blank"></a></li>
						<li><a href="https://youtu.be/OKxASY7ABfs" target="_blank"></a></li>
					</ul>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-xs-12 text-center">
					<a class="tutorials-link"
						href="https://www.youtube.com/channel/UCydykDsTWRIVnxKHW3SHPQA"
						role="button">Watch Videos</a>
					<h4>Check out my YouTube tutorials</h4>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<section id="features">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">Features</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="feature-container col-xs-12">
					<div class="row">
						<div
							class="feature col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-0 text-center">
							<svg class="lnr lnr-magic-wand">
								<use xlink:href="#lnr-magic-wand"></use></svg>
							<h4>Animated Scroll</h4>
							<p>Smooth, animated scroll between navigation links</p>
						</div>
						<!-- /.feature -->

						<div
							class="feature col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-0 text-center">
							<svg class="lnr lnr-map-marker">
								<use xlink:href="#lnr-map-marker"></use></svg>
							<h4>Page Location</h4>
							<p>Track page locations when scrolling</p>
						</div>
						<!-- /.feature -->

						<div
							class="feature col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-0 text-center">
							<svg class="lnr lnr-bullhorn">
								<use xlink:href="#lnr-bullhorn"></use></svg>
							<h4>Focus Events</h4>
							<p>Draw user attention to navigated sections</p>
						</div>
						<!-- /.feature -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.feature-container -->

			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->

		<div class="container-fluid">
			<div class="banner row">
				<div class="banner-child bc-left col-sm-6">
					<div class="section-sub-header">Animated Scroll</div>

					<div class="animated-scroll">
						<div class="scroll-header">
							<div class="scroll-nav sn-1"></div>
							<div class="scroll-nav sn-2"></div>
							<div class="scroll-nav sn-3"></div>
							<svg class="cursor" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink"
								enable-background="new 0 0 24 24" id="Layer_1" version="1.0"
								viewBox="0 0 24 24" xml:space="preserve">
								<path d="M7,2l12,11.2l-5.8,0.5l3.3,7.3l-2.2,1l-3.2-7.4L7,18.5V2" /></svg>
						</div>
						<!-- /.scroll-header -->

						<div class="scroll-body">
							<div class="scroll-child sc-1"></div>
							<div class="scroll-child sc-2"></div>
							<div class="scroll-child sc-3"></div>
							<div class="scroll-child sc-back-to-top"></div>
						</div>
						<!-- /.scroll-body -->
					</div>
					<!-- /.animated scroll -->
				</div>
				<!-- /.banner-child -->

				<div class="banner-child bc-right col-sm-6">
					<div class="section-sub-header">Focus Events | UX</div>

					<div class="focus-events">
						<div class="scroll-header">
							<div class="scroll-nav sn-1"></div>
							<div class="scroll-nav sn-2"></div>
							<svg class="cursor" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink"
								enable-background="new 0 0 24 24" id="Layer_1" version="1.0"
								viewBox="0 0 24 24" xml:space="preserve">
								<path d="M7,2l12,11.2l-5.8,0.5l3.3,7.3l-2.2,1l-3.2-7.4L7,18.5V2" /></svg>
						</div>
						<!-- /.scroll-header -->

						<div class="scroll-body">
							<div class="scroll-child sc-1">
								<div class="header"></div>
								<div class="sub-header"></div>
								<div class="body"></div>
								<div class="body"></div>
								<div class="body"></div>
							</div>
							<div class="scroll-child sc-2">
								<div class="header"></div>
								<div class="sub-header"></div>
								<div class="body"></div>
								<div class="body"></div>
								<div class="body"></div>
							</div>
						</div>
						<!-- /.scroll-body -->
					</div>
					<!-- /.animated scroll -->
				</div>
				<!-- /.banner-child -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /#features -->

	<section id="howto">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="section-header">How To</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<div class="section-sub-header">Offest a Fixed Navbar</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<figure class="highlight">
						<pre>
							<code class="language-html" data-lang="html">
								<span class="nt">&lt;body</span> <span class="na">data-spy=</span><span
									class="s">"scroll"</span> <span class="na">data-target=</span><span
									class="s">"#navbar-example"</span> <span class="na">data-offset=</span><span
									class="s">"70"</span><span class="nt">&gt;</span>
  ...
<span class="nt">&lt;/body&gt;</span>
							</code>
						</pre>
					</figure>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<figure class="highlight">
						<pre>
							<code class="language-js" data-lang="js">
								<span class="nx">$</span><span class="p">(</span><span
									class="s1">'body'</span><span class="p">).</span><span
									class="nx">scrollspy</span><span class="p">({</span>
  <span class="na">offset</span><span class="p">:</span> <span
									class="s1">offsetHeight</span> <span class="c1">/*A numeric representing pixel count*/</span>
<span class="p">})</span>
							</code>
						</pre>
					</figure>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<div class="section-sub-header">Ensure last #target scrolls
						to top</div>
					<p>A common problem I see with scrollspy implementations is
						when the last navigation target doesn't navigation to the top of
						the screen. This causes issues for scrollspy as well as confusing
						the user if the target they clicked is half way down the page.</p>
					<p>The problem is simple, the document isn't long enough to
						allow it to scroll to the top.</p>

					<p>A simple solution is to dynamically add padding-bottom to
						the body via JQuery, which increases the height to the pixel
						perfect minimum. We need to do this both at render/page load and
						if the window is resized. The below code is a simplified and
						calculates the height of all sibling elements (after the target)
						to calculate</p>


				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-xs-12">
					<figure class="highlight">
						<pre>
							<code class="language-js" data-lang="js">
<span class="kd">var</span> <span class="vg">height</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">'#targetId'</span><span class="p">).</span><span
									class="nx">innerHeight</span><span class="p">(</span><span
									class="p">)</span>
<span class="kd">var</span> <span class="vg">windowHeight</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">window</span><span class="p">).</span><span
									class="nx">height</span><span class="p">(</span><span class="p">)</span>
<span class="kd">var</span> <span class="vg">navHeight</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">'nav.navbar'</span><span class="p">).</span><span
									class="nx">innerHeight</span><span class="p">(</span><span
									class="p">)</span>
<span class="kd">var</span> <span class="vg">siblingHeight</span> <span
									class="o">=</span> <span class="nx">$</span><span class="p">(</span><span
									class="s1">'#targetId'</span><span class="p">).</span><span
									class="nx">nextAll</span><span class="p">(</span><span
									class="p">).</span><span class="nx">innherHeight</span><span
									class="p">(</span><span class="p">)</span>

<span class="nx">if</span><span class="p">(</span><span class="nx">height </span><span
									class="nx">&lt;</span><span class="nx"> windowHeight</span><span
									class="p">)</span><span class="p">(</span><span class="p">{</span>
  <span class="nx">$</span><span class="p">(</span><span class="s1">'body'</span><span
									class="p">).</span><span class="nx">css</span><span class="p">(</span><span
									class="na">"padding-bottom"</span><span class="p">,</span> <span
									class="nx">windowHeight</span><span class="p">-</span><span
									class="nx">navHeight</span><span class="p">-</span><span
									class="nx">height</span><span class="p">-</span><span
									class="nx">siblingHeight</span> <span class="p">+</span> <span
									class="p">"</span><span class="s1">px</span><span class="p">"</span><span
									class="p">)</span>
<span class="p">}</span>	
</code>
						</pre>
					</figure>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h4>This is a footer</h4>
				</div>
			</div>
		</div>
	</footer>
	<a href="#home" role="button" class="scrollTop"> <svg
			class="lnr lnr-chevron-up">
			<use xlink:href="#lnr-chevron-up"></use></svg>
	</a>

</body>
<script>
	$(document).ready(
			function() {

				// On render, adjust body padding to ensure last Scroll target can reach top of screen
				var height = $('#howto').innerHeight();
				var windowHeight = $(window).height();
				var navHeight = $('nav.navbar').innerHeight();
				var siblingHeight = $('#howto').nextAll().innerHeight();

				if (height < windowHeight) {
					$('body').css(
							"padding-bottom",
							windowHeight - navHeight - height - siblingHeight
									+ "px");
				}

				// On window resize, adjust body padding to ensure last Scroll target can reach top of screen
				$(window).resize(
						function(event) {
							var height = $('#howto').innerHeight();
							var windowHeight = $(window).height();
							var navHeight = $('nav.navbar').innerHeight();
							var siblingHeight = $('#howto').nextAll()
									.innerHeight();

							if (height < windowHeight) {
								$('body').css(
										"padding-bottom",
										windowHeight - navHeight - height
												- siblingHeight + "px");
							}
						});
			});
</script>

</html>