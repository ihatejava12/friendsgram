<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Epilogue&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lexend&display=swap"
	rel="stylesheet" />
<link href="./css/main.css" rel="stylesheet" />
<style>
/* 기본 스타일 */
* {
  box-sizing: border-box;
}
body {
  font-size: 14px;
}

/* 큰 화면 (데스크탑) */
@media (min-width: 1024px) {
  .v147_2186 {
    width: 100%;
    height: 1333px;
    background: rgba(255,255,255,1);
    opacity: 1;
    position: relative;
    box-shadow: 0px 3px 6px rgba(0.07058823853731155, 0.05882352963089943, 0.1568627506494522, 0.11999999731779099);
    overflow: hidden;
  }
  .v147_2187 {
    width: 100%;
    height: 587px;
    background: rgba(12,146,0,1);
    position: absolute;
    top: 73px;
    left: 0px;
  }
  .v147_2188 {
    width: 357px;
    height: 259px;
    background: url("../images/v147_2188.png");
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    position: absolute;
    top: 5687px;
    left: 1044px;
    border-radius: 4px;
  }
  .v147_2189 {
    width: 189px;
    height: 52px;
    background: rgba(255,255,255,1);
    position: absolute;
    top: 333px;
    left: 1318px;
    border-radius: 26px;
  }
  .v147_2190 {
    width: 169px;
    color: rgba(50,56,66,1);
    position: absolute;
    top: 12px;
    left: 20px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 18px;
    text-align: left;
  }
  /* 추가 스타일... */
}

/* 중간 화면 (태블릿) */
@media (min-width: 768px) and (max-width: 1023px) {
  .v147_2186 {
    height: 1000px; /* 예제 조정 */
  }
  .v147_2187 {
    height: 400px; /* 예제 조정 */
    top: 50px; /* 예제 조정 */
  }
  .v147_2188 {
    width: 300px; /* 예제 조정 */
    height: 200px; /* 예제 조정 */
    top: 4000px; /* 예제 조정 */
    left: 800px; /* 예제 조정 */
  }
  .v147_2189 {
    width: 150px; /* 예제 조정 */
    height: 40px; /* 예제 조정 */
    top: 250px; /* 예제 조정 */
    left: 1000px; /* 예제 조정 */
  }
  .v147_2190 {
    font-size: 16px; /* 예제 조정 */
  }
  /* 추가 스타일... */
}

/* 작은 화면 (모바일) */
@media (max-width: 767px) {
  .v147_2186 {
    height: 800px; /* 예제 조정 */
  }
  .v147_2187 {
    height: 300px; /* 예제 조정 */
    top: 20px; /* 예제 조정 */
  }
  .v147_2188 {
    width: 100%; /* 예제 조정 */
    height: auto; /* 예제 조정 */
    top: 2000px; /* 예제 조정 */
    left: 0; /* 예제 조정 */
  }
  .v147_2189 {
    width: 100%; /* 예제 조정 */
    height: auto; /* 예제 조정 */
    top: 150px; /* 예제 조정 */
    left: 0; /* 예제 조정 */
  }
  .v147_2190 {
    font-size: 14px; /* 예제 조정 */
  }
  /* 추가 스타일... */
}

.v147_2256 {
  width: 306px;
  height: 173px;
  background: rgba(248,249,250,1);
  opacity: 1;
  position: absolute;
  top: 173px;
  left: 1052px;
  border-top-left-radius: 48px;
  border-top-right-radius: 48px;
  border-bottom-left-radius: 48px;
  border-bottom-right-radius: 48px;
  overflow: hidden;
}

.v147_2257 {
  width: 949px;
  height: 35px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 188px;
  left: 1052px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  overflow: hidden;
}

.v147_2258 {
  width: 949px;
  color: rgba(23,26,31,1);
  position: absolute;
  top: 3px;
  left: 0px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 20px;
  opacity: 1;
  text-align: left;
}

.v147_2259 {
  width: 267px;
  height: 35px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 227px;
  left: 1052px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  overflow: hidden;
}

.v147_2260 {
  width: 255px;
  color: rgba(23,26,31,1);
  position: absolute;
  top: 7px;
  left: 12px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 14px;
  opacity: 1;
  text-align: left;
}

.v147_2261 {
  width: 267px;
  height: 35px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 227px;
  left: 1392px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  overflow: hidden;
}

.v147_2262 {
  width: 255px;
  color: rgba(23,26,31,1);
  position: absolute;
  top: 7px;
  left: 12px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 14px;
  opacity: 1;
  text-align: left;
}

.v147_2263 {
  width: 132px;
  height: 35px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 279px;
  left: 1052px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  overflow: hidden;
}

.v147_2264 {
  width: 120px;
  color: rgba(23,26,31,1);
  position: absolute;
  top: 7px;
  left: 12px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 14px;
  opacity: 1;
  text-align: left;
}

.v147_2265 {
  width: 115px;
  height: 35px;
  background: rgba(255,255,255,1);
  opacity: 1;
  position: absolute;
  top: 279px;
  left: 1332px;
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  overflow: hidden;
}

.v147_2266 {
  width: 103px;
  color: rgba(23,26,31,1);
  position: absolute;
  top: 7px;
  left: 12px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 14px;
  opacity: 1;
  text-align: left;
}

.v147_2267 {
  width: 100%;
  height: 183px;
  background: rgba(30,33,40,0.6800000071525574);
  opacity: 1;
  position: absolute;
  top: 462px;
  left: 0px;
  border-top-left-radius: 48px;
  border-top-right-radius: 48px;
  overflow: hidden;
}

.v147_2268 {
  width: 130px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 49px;
  left: 901px;
  font-family: Epilogue;
  font-weight: Bold;
  font-size: 24px;
  opacity: 1;
  text-align: left;
}

.v147_2269 {
  width: 268px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 49px;
  left: 1365px;
  font-family: Epilogue;
  font-weight: Bold;
  font-size: 24px;
  opacity: 1;
  text-align: left;
}

.v147_2270 {
  width: 339px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 103px;
  left: 716px;
  font-family: Epilogue;
  font-weight: Regular;
  font-size: 16px;
  opacity: 1;
  text-align: left;
}


</style>
<title>Document</title>
</head>
<body>
	<div class="v147_2186">
		<div class="v147_2187">
			<div class="v147_2188"></div>
			<div class="v147_2189">
				<span class="v147_2190">프리랜서 찾아보기s</span>
			</div>
			<span class="v147_2191">원하는 프리랜서를 찾아보세요!</span>
			<div class="v147_2192"></div>
		</div>
		<div class="v147_2193">
			<div class="v147_2194">
				<span class="v147_2195">로그인</span>
			</div>
			<div class="v147_2196">
				<div class="v147_2197">
					<sapn class="v147_2198">코딩 게시판</span>
				</div>
				<div class="v147_2199">
					<span class="v147_2200">프리랜서 검색</span>
				</div>
				<div class="v147_2201">
					<span class="v147_2202">팀 모집</span>
				</div>
				<div class="v147_2203">
					<span class="v147_2204">프리랜서 공고</span>
				</div>
				<div class="v147_2205">
					<span class="v147_2206">취업 공고</span>
				</div>
			</div>
			<div class="v147_2207">
				<div class="v147_2208">
					<div class="v147_2209"></div>
					<div class="v147_2210"></div>
				</div>
			</div>
			<div class="v147_2211">
				<div class="v147_2212"></div>
				<div class="v147_2213"></div>
			</div>
			<div class="v147_2214"></div>
		</div>
		<div class="v147_2215">
			<span class="v147_2216">↗</span>
			<div class="v147_2217"></div>
			<span class="v147_2218">공지사항</span>
			<div class="v147_2219"></div>
			<div class="v147_2220"></div>
			<div class="v147_2221"></div>
			<span class="v147_2222">프리랜서 공고</span>
			<div class="v147_2223">
				<span class="v147_2224">프리랜서 모집공고 제목</span>
			</div>
			<div class="v147_2225">
				<span class="v147_2226">예상 금액</span>
			</div>
			<div class="v147_2227">
				<span class="v147_2228">시작 예정일</span>
			</div>
			<div class="v147_2229">
				<span class="v147_2230">예상기간</span>
			</div>
			<div class="v147_2231">
				<span class="v147_2232">상주, 원격</span>
			</div>
			<div class="v147_2233">
				<span class="v147_2234">모집중</span>
			</div>
			<div class="v147_2235"></div>
			<div class="v147_2236">
				<span class="v147_2237">프리랜서 모집공고 제목</span>
			</div>
			<div class="v147_2238">
				<span class="v147_2239">예상 금액</span>
			</div>
			<div class="v147_2240">
				<span class="v147_2241">시작 예정일</span>
			</div>
			<div class="v147_2242">
				<span class="v147_2243">예상기간</span>
			</div>
			<div class="v147_2244">
				<span class="v147_2245">상주, 원격</span>
			</div>
			<div class="v147_2246">
				<span class="v147_2247">모집중</span>
			</div>
			<div class="v147_2248">
				<span class="v147_2249">사용언어</span>
			</div>
			<div class="v147_2250">
				<span class="v147_2251">사용언어d</span>
			</div>
		</div>
		<div class="v147_2252">
			<span class="v147_2253">고객센터</span><span class="v147_2254">개인정보
				처리방침</span><span class="v147_2255">(주)프렌즈그램(대표이사 : 전재민)</span><span
				class="v147_2256">서울 특별시 종로구 종로 12길 15 코아빌딩 </span><span
				class="v147_2257">프리랜서 이용약관</span><span class="v147_2258">광고
				문의</span>
			<div class="v147_2259"></div>
		</div>
	</div>
</body>
</html>
</body>
</html>