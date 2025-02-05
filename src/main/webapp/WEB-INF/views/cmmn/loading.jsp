<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 <c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
    <head>

        <style>

        body{
          margin:0;
          color:#444;
          background-color:#141414;
          font:300 18px/18px Roboto, sans-serif;
        }
        *,:after,:before{box-sizing:border-box}
        .pull-left{float:left}
        .pull-right{float:right}
        .clearfix:after,.clearfix:before{content:'';display:table}
        .clearfix:after{clear:both;display:block}

        .loader-wrap{
          top:50%;
          left:50%;
          width:374px;
          height:194px;
          position:fixed;
          margin-top:-97px;
          margin-left:-187px;
        }
        .bar{
          height:5px;
          width:100%;
          margin:30px 0;
          position:relative;
          background-color:#444;
        }
        .bar:before{
          top:0;
          left:0;
          width:0;
          content:'';
          height:inherit;
          position:absolute;
          background-color:#FBCE13;
          animation:bar 2500ms linear infinite;
        }
        .text{
          color:#FBCE13;
          font-size:24px;
          font-weight:500;
          text-align:center;
          letter-spacing:10px;
          text-transform:uppercase;
        }
        .cap{
          left:0;
          right:0;
          top:-15px;
          z-index:1;
          width:100%;
          position:absolute;
        }
        .cap>i{
          opacity:0;
          height:3px;
          width:16px;
          margin-left:12px;
          border-radius:3px;
          position:absolute;
          background-color:#FBCE13;
          animation:move-cap 2500ms linear infinite;
        }
        .bottle-fill{
          animation:waves 2500ms infinite linear, fill 2500ms infinite forwards;
        }
        .bottle-wrap{
          height:110px;
          position:relative;
        }
        .bottle{
          bottom:0;
          opacity:0;
          width:40px;
          text-align:center;
          position: absolute;
          display:inline-block;
          vertical-align:bottom;
          transform-origin:bottom right;
          transform:translateX(-300px);
          animation:move 2500ms linear infinite;
        }
        .bottle:before,
        .bottle:after{
          left:50%;
          opacity:0;
          content:'';
          position:absolute;
          background-color:#FBCE13;
        }
        .bottle:before{
          opacity:1;
          width:4px;
          top:-40px;
          height:14px;
          margin-left:-2px;
          animation:lock-cap 2500ms linear infinite;
        }
        .bottle:after{
          top:0;
          height:4px;
          width:16px;
          margin-left:-8px;
          border-radius:4px;
          animation:show-cap 2500ms linear infinite;
        }
        .cap>i:nth-child(2),
        .bottle:nth-child(2),
        .bottle:nth-child(2):before,
        .bottle:nth-child(2):after,
        .bottle:nth-child(2) .bottle-fill{
          animation-delay:625ms;
        }
        .cap>i:nth-child(3),
        .bottle:nth-child(3),
        .bottle:nth-child(3):before,
        .bottle:nth-child(3):after,
        .bottle:nth-child(3) .bottle-fill{
          animation-delay:1250ms;
        }
        .cap>i:nth-child(4),
        .bottle:nth-child(4),
        .bottle:nth-child(4):before,
        .bottle:nth-child(4):after,
        .bottle:nth-child(4) .bottle-fill{
          animation-delay:1875ms;
        }
        .bottle svg{vertical-align:bottom;display:block;margin:auto}

        @keyframes waves{
          0%{ x:-200px }
          25%{ x:-100px }
          50%{ x:-200px }
          75%,
          100%{ x:-40px }
        }
        @keyframes fill{
          0%{ height:0; y:125px}
          30%,
          100%{ height:100px; y:25px}
        }

        @keyframes move{
          0%{
            opacity:0;
            transform:translateX(0);
          }
          25%{
            opacity:1;
            transform:translateX(75px);
          }
          48%{transform:translateX(144px) translateY(0);}
          50%{
            transform:translateX(150px) translateY(-10px);
          }
          52%{transform:translateX(156px) translateY(0);}
          75%{
            opacity:1;
            transform:translateX(225px);
          }
          100%{
            opacity:0;
            transform:translateX(300px);
          }
        }
        @keyframes move-cap{
          0%{
            opacity:0;
            transform:translate(0,0);
          }
          25%{
            opacity:1;
            transform:translate(75px,0);
          }
          45%{opacity:1}
          48%{transform:translate(144px, 0)}
          50%{
            transform:translate(150px,10px);
          }
          52%{opacity:0}
          75%{
            transform:translate(225px,0);
          }
          100%{
            opacity:0;
            transform:translate(300px,0);
          }
        }
        @keyframes show-cap{
          0%,45%{opacity:0}
          48%,90%{opacity:1}
        }
        @keyframes lock-cap{
          0%,45%,48%,100%{opacity:0;transform:translateY(-10px)}
          46%,47%{opacity:1;;transform:translateY(0)}
        }
        @keyframes bar{
          0%{width:0}
          100%{width:100%}
        }
        </style>

    </head>
    <body>

        <div>
            <div class="loader-wrap">
            <div class="bottle-wrap">
            <div class="cap"><i></i><i></i><i></i><i></i></div>
            <div class="bottle">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
              width="26.81px" height="106.124px" viewBox="0 0.5 26.81 106.124" enable-background="new 0 0.5 26.81 106.124" xml:space="preserve">
              <defs>
              <pattern id="water_fill" width=".25" height="1.1" patternContentUnits="objectBoundingBox">
              <path fill="#FBCE13" d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"/>
              </pattern>
              <path id="bottle" d="M17.905,38.109V9.734c0,0,1.75-3.125,1.375-5.5s-5.875-2.232-5.875-2.232s-5.5-0.143-5.875,2.232
              s1.375,5.5,1.375,5.5v28.375c0,0-7.405,1.311-7.405,16.03s0,40.72,0,45.47s5.515,5.515,5.515,5.515h6.39h6.39
              c0,0,5.515-0.765,5.515-5.515s0-30.75,0-45.47S17.905,38.109,17.905,38.109z"/>
              <mask id="bottle_mask">
              <use x="0" y="0" xlink:href="#bottle" opacity="1" fill="#ffffff"/>
              </mask>
              </defs>
              <rect class="bottle-fill" mask="url(#bottle_mask)" fill="url(#water_fill)" x="-400" y="0" width="1600" height="120"/>
              <path id="btl-out" fill="none" stroke="#FCE480" stroke-width="3" stroke-miterlimit="10" d="M17.905,38.109V9.734
              c0,0,1.75-3.125,1.375-5.5s-5.875-2.232-5.875-2.232s-5.5-0.143-5.875,2.232s1.375,5.5,1.375,5.5v28.375
              c0,0-7.405,1.311-7.405,16.03s0,40.72,0,45.47s5.515,5.515,5.515,5.515h6.39h6.39c0,0,5.515-0.765,5.515-5.515s0-30.75,0-45.47
              S17.905,38.109,17.905,38.109z"/>
            </svg>
            </div>
            <div class="bottle">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
              width="32.339px" height="105.586px" viewBox="0 0 32.339 105.586" enable-background="new 0 0 32.339 105.586" xml:space="preserve">
              <defs>
              <pattern id="water_fill" width=".25" height="1.1" patternContentUnits="objectBoundingBox">
              <path fill="#FBCE13" d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"/>
              </pattern>
              <path id="bottle_2" d="M30.836,48.086c-0.083-3.417-3.167-7.583-3.167-7.583s-3-15.5-4-19.667s-1.417-13.25-0.167-14.583
              s0-3.083-1.667-4.083s-5.667-0.583-5.667-0.583s-4-0.417-5.667,0.583S7.584,4.92,8.834,6.253S9.667,16.67,8.667,20.836
              s-4,19.667-4,19.667S1.584,44.67,1.5,48.086c-0.083,3.417,1.833,34.833,1.667,37.917C3,89.086,2.25,96.586,2.834,99.67
              c0.583,3.083,5.5,4.417,5.5,4.417h7.833H24c0,0,4.917-1.333,5.5-4.417c0.583-3.083-0.167-10.583-0.333-13.667
              C29.003,82.919,30.919,51.503,30.836,48.086z"/>
              <mask id="bottle_mask_2">
              <use x="0" y="0" xlink:href="#bottle_2" opacity="1" fill="#ffffff"/>
              </mask>
              </defs>
              <rect class="bottle-fill" mask="url(#bottle_mask_2)" fill="url(#water_fill)" x="-400" y="0" width="1600" height="120"/>
              <path id="btl-out" fill="none" stroke="#FCE480" stroke-width="3" stroke-miterlimit="10" d="M30.836,48.086
              c-0.083-3.417-3.167-7.583-3.167-7.583s-3-15.5-4-19.667s-1.417-13.25-0.167-14.583c1.25-1.333,0-3.083-1.667-4.083
              c-1.667-1-5.667-0.583-5.667-0.583s-4-0.417-5.667,0.583c-1.667,1-2.917,2.75-1.667,4.083c1.25,1.333,0.833,10.417-0.167,14.583
              s-4,19.667-4,19.667s-3.083,4.167-3.167,7.583c-0.083,3.417,1.833,34.833,1.667,37.917c-0.167,3.083-0.917,10.583-0.333,13.667
              c0.583,3.083,5.5,4.417,5.5,4.417h7.833h7.833c0,0,4.917-1.333,5.5-4.417c0.583-3.083-0.167-10.583-0.333-13.667
              C29.003,82.919,30.919,51.503,30.836,48.086z"/>
            </svg>
            </div>
            <div class="bottle">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
              width="31.314px" height="102.629px" viewBox="0 0 31.314 102.629" enable-background="new 0 0 31.314 102.629" xml:space="preserve">
              <defs>
              <pattern id="water_fill" width=".25" height="1.1" patternContentUnits="objectBoundingBox">
              <path fill="#FBCE13" d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"/>
              </pattern>
              <path id="bottle_3" d="M29.157,53.497c-2-10.757-6.688-36.18-7.375-40.493s0.688-1.688,0.25-6.75s-6.375-4.75-6.375-4.75
              S9.72,1.191,9.282,6.254s0.938,2.438,0.25,6.75S4.157,42.74,2.157,53.497s1.25,22.757,0.75,29.507s-1.917,12.333,1.333,15.5
              c3.25,3.167,8.583,2.583,8.583,2.583h2.833h2.833c0,0,5.333,0.583,8.583-2.583c3.25-3.167,1.833-8.75,1.333-15.5
              S31.157,64.254,29.157,53.497z"/>
              <mask id="bottle_mask_3">
              <use x="0" y="0" xlink:href="#bottle_3" opacity="1" fill="#ffffff"/>
              </mask>
              </defs>
              <rect class="bottle-fill" mask="url(#bottle_mask_3)" fill="url(#water_fill)" x="-400" y="0" width="1600" height="120"/>
              <path id="btl-out" fill="none" stroke="#FCE480" stroke-width="3" stroke-miterlimit="10" d="M29.157,53.497c-2-10.757-6.688-36.18-7.375-40.493
              s0.688-1.688,0.25-6.75s-6.375-4.75-6.375-4.75S9.72,1.191,9.282,6.254s0.938,2.438,0.25,6.75S4.157,42.74,2.157,53.497
              s1.25,22.757,0.75,29.507s-1.917,12.333,1.333,15.5c3.25,3.167,8.583,2.583,8.583,2.583h2.833h2.833c0,0,5.333,0.583,8.583-2.583
              c3.25-3.167,1.833-8.75,1.333-15.5S31.157,64.254,29.157,53.497z"/>
            </svg>
            </div>
            <div class="bottle">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
              width="27.071px" height="100.378px" viewBox="0 0 27.071 100.378" enable-background="new 0 0 27.071 100.378" xml:space="preserve">
              <defs>
              <pattern id="water_fill" width=".25" height="1.1" patternContentUnits="objectBoundingBox">
              <path fill="#FBCE13" d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"/>
              </pattern>
              <path id="bottle_4" d="M25.474,44.253c-0.564-8.625-3.189-12-5.189-20s-2.5-16-2.5-16s0.438-3.125-0.313-4.625
              c-0.706-1.413-2.247-2.15-3.937-2.128c-1.691-0.022-3.231,0.715-3.938,2.128c-0.75,1.5-0.313,4.625-0.313,4.625s-0.5,8-2.5,16
              s-4.625,11.375-5.189,20c-0.564,8.625,1.564,35.25,0.626,40.625s-1.375,14,2.813,14c3.029,0,6.375,0,8,0c0,0,0.378,0,1,0
              c1.625,0,4.971,0,8,0c4.188,0,3.75-8.625,2.813-14S26.038,52.878,25.474,44.253z"/>
              <mask id="bottle_mask_4">
              <use x="0" y="0" xlink:href="#bottle_4" opacity="1" fill="#ffffff"/>
              </mask>
              </defs>
              <rect class="bottle-fill" mask="url(#bottle_mask_4)" fill="url(#water_fill)" x="-400" y="0" width="1600" height="120"/>
              <path id="btl-out" fill="none" stroke="#FCE480" stroke-width="3" stroke-miterlimit="10" d="M25.474,44.253c-0.564-8.625-3.189-12-5.189-20
              s-2.5-16-2.5-16s0.438-3.125-0.313-4.625c-0.706-1.413-2.247-2.15-3.937-2.128c-1.691-0.022-3.231,0.715-3.938,2.128
              c-0.75,1.5-0.313,4.625-0.313,4.625s-0.5,8-2.5,16s-4.625,11.375-5.189,20c-0.564,8.625,1.564,35.25,0.626,40.625
              s-1.375,14,2.813,14c3.029,0,6.375,0,8,0c0,0,0.378,0,1,0c1.625,0,4.971,0,8,0c4.188,0,3.75-8.625,2.813-14
              S26.038,52.878,25.474,44.253z"/>
            </svg>
            </div>
            </div>
            <div class="bar"></div>
            <div class="text">loading</div>
            </div>
        </div>
</body>
</html>