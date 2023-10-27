(function ($) {
  var aRecentViewCategoryJson = []; // 최근 본 카테고리
  var aRecentViewProductsJson = []; // 최근 본 상품
  var aShoppingPlanJson = []; // 추천 기획전
  var nRecentViewProductsCurrentPage = 0;
  var nRecentViewPageCount = 0; //최근본상품 페이지 수
  var bMemberCountExcuteYN = "N"; //회원 쪽지 조회여부
  var aHotKeyword = null;
  var nShoppingPlanCurrentPage = 0;
  var nShoppingPlanPageCount = 0;

  $.drawRecent = function () {
    var cateIdx = 0;
    var idx = nRecentViewProductsCurrentPage * 6;
    var rowcount = idx + 6;
    var memberSeq = $("#memberSeq").val();

    // 최근본 카테고리
    var recentViewCategoryHtml = "";
    if (aRecentViewCategoryJson.length > 0) {
      recentViewCategoryHtml +=
        '<div class="user-recent__header">' +
        '<strong class="title">최근 본 카테고리</strong>' +
        "</div>" +
        '<div class="user-recent__cate"><ul class="user-recent__cate__list">';

      for (cateIdx; cateIdx < aRecentViewCategoryJson.length; cateIdx++) {
        if (
          aRecentViewCategoryJson[cateIdx].name != null &&
          aRecentViewCategoryJson[cateIdx].name != ""
        ) {
          recentViewCategoryHtml +=
            '<li class="user-recent__cate__item">' +
            '<a href="//prod.danawa.com/list/?cate=' +
            aRecentViewCategoryJson[cateIdx].code +
            '" class="user-recent__cate__link">' +
            aRecentViewCategoryJson[cateIdx].name +
            "</a>" +
            '<button class="user-recent__cate__del" onclick="javascript:jQuery.deleteCategory(' +
            cateIdx +
            ');"><span class="blind">삭제</span></button>' +
            "</li>";
        } else {
          $.deleteCategory(cateIdx);
          $.loadContentProductDB();
        }
      }
      recentViewCategoryHtml += "</ul></div>";
    }
    $("#recentCate").html(recentViewCategoryHtml);

    var loginUrl =
      "https://auth.danawa.com/login?url=" + encodeURIComponent(location.href);

    // 최근본 상품
    var recentViewProductHtml = "";
    if (aRecentViewProductsJson.length > 0) {
      recentViewProductHtml +=
        '<div class="user-recent__header"><strong class="title">최근 본 상품</strong>';

      // 페이징 처리
      if (aRecentViewProductsJson.length % 3 == 0) {
        nRecentViewPageCount = Math.floor(aRecentViewProductsJson.length / 6);
      } else {
        nRecentViewPageCount =
          Math.floor(aRecentViewProductsJson.length / 6) + 1;
      }

      if (aRecentViewProductsJson.length > 0) {
        recentViewProductHtml +=
          '<div class="swipe-control">' +
          '<div class="swipe-control__num">' +
          '<em class="current"><span class="blind">현재</span>' +
          (nRecentViewProductsCurrentPage + 1) +
          '</em>/<span class="blind">전체</span>' +
          nRecentViewPageCount +
          "</div>" +
          '<div class="swipe-control__btn">' +
          '<button type="button" class="btn_prev" onclick="jQuery.prevPage();"><span class="blind">최근 본 상품 이전</span></button>' +
          '<button type="button" class="btn_next" onclick="jQuery.nextPage();"><span class="blind">최근 본 상품 다음</span></button>' +
          "</div>" +
          "</div>";
      }

      recentViewProductHtml +=
        '</div><div class="user-recent__prod"><ul class="user-recent__prod__list">';

      for (idx; idx < rowcount; idx++) {
        if (!aRecentViewProductsJson[idx]) {
          recentViewProductHtml += "";
        } else {
          if (aRecentViewProductsJson[idx].productName == "") {
            $.deleteProduct(idx);
            $.loadContentProductDB();
          } else {
            var nComparePrice = Math.abs(
              parseInt(aRecentViewProductsJson[idx].originPrice) -
                parseInt(aRecentViewProductsJson[idx].minPrice)
            );
            var bPriceUpDown = "";
            var sNewWin = "";

            if (
              aRecentViewProductsJson[idx].originPrice ==
              aRecentViewProductsJson[idx].minPrice
            ) {
              bPriceUpDown = "0";
            } else if (
              aRecentViewProductsJson[idx].originPrice >
              aRecentViewProductsJson[idx].minPrice
            ) {
              bPriceUpDown = "-";
            } else {
              bPriceUpDown = "+";
            }
            recentViewProductHtml += '<li class="user-recent__prod__item">';

            if (aRecentViewProductsJson[idx].goodKind == 1) {
              recentViewProductHtml +=
                '<a href="' +
                aRecentViewProductsJson[idx].linkUrl +
                '" title="' +
                aRecentViewProductsJson[idx].productName +
                '" class="user-recent__prod__link" target="_blank">';
            } else if (aRecentViewProductsJson[idx].goodKind == 2) {
              recentViewProductHtml +=
                '<a href="' +
                aRecentViewProductsJson[idx].linkUrl +
                '" title="' +
                aRecentViewProductsJson[idx].productName +
                '" class="user-recent__prod__link" target="_blank">';
            } else {
              recentViewProductHtml +=
                '<a href="' +
                aRecentViewProductsJson[idx].linkUrl +
                '" class="user-recent__prod__link" onclick="window.open(this.href, \'simliarProductPopup\', \'width=940,height=740,top=100,left=100,resizeable=false\');return false;">';
            }

            recentViewProductHtml +=
              '<span class="user-recent__prod__thumb">' +
              '<img src="' +
              aRecentViewProductsJson[idx].imageUrl +
              '" title="' +
              aRecentViewProductsJson[idx].productName +
              '" alt="' +
              aRecentViewProductsJson[idx].productName +
              '" onerror="this.src=\'//img.danawa.com/new/noData/img/noImg_400.gif\'" aria-hidden="true">' +
              "</span>" +
              '<span class="user-recent__prod__txt">' +
              aRecentViewProductsJson[idx].productName +
              "</span>";

            if (aRecentViewProductsJson[idx].productStatusName != "") {
              recentViewProductHtml +=
                '<span class="user-recent__prod__price">' +
                '<span class="none">' +
                aRecentViewProductsJson[idx].productStatusName +
                "</span>" +
                "</span>";
            } else {
              recentViewProductHtml +=
                '<span class="user-recent__prod__price">' +
                sNewWin +
                '<span class="num">' +
                $.number_format(aRecentViewProductsJson[idx].minPrice) +
                "</span>원</span>";
              if (bPriceUpDown == "0") {
                recentViewProductHtml +=
                  '<span class="user-recent__prod__gap">(<em>' +
                  bPriceUpDown +
                  "</em>)</span>";
              } else if (bPriceUpDown == "-") {
                recentViewProductHtml +=
                  '<span class="user-recent__prod__gap down">(' +
                  bPriceUpDown +
                  $.number_format(nComparePrice.toString()) +
                  ")</span>";
              } else {
                recentViewProductHtml +=
                  '<span class="user-recent__prod__gap up">(' +
                  bPriceUpDown +
                  $.number_format(nComparePrice.toString()) +
                  ")</span>";
              }
            }

            recentViewProductHtml += "</a>";

            if (
              aRecentViewProductsJson[idx].goodKind == 1 ||
              aRecentViewProductsJson[idx].goodKind == 2
            ) {
              var onWishProduct = "";
              if (aRecentViewProductsJson[idx].isWishProduct == 1) {
                onWishProduct = "on";
              } else {
                aRecentViewProductsJson[idx].wishProductSeq = "";
              }
              let productSeq = aRecentViewProductsJson[idx].productSeq;
              if (aRecentViewProductsJson[idx].goodKind > 1) {
                productSeq = `${aRecentViewProductsJson[idx].shop_id}^${aRecentViewProductsJson[idx].productSeq}`;
              }
              recentViewProductHtml +=
                '<button type="button" class="user-recent__prod__wish btn_interest ' +
                onWishProduct +
                '" code="' +
                productSeq +
                '" key="' +
                aRecentViewProductsJson[idx].wishProductSeq +
                '" price="' +
                aRecentViewProductsJson[idx].minPrice +
                '" goodKind="' +
                aRecentViewProductsJson[idx].goodKind +
                '" cate="' +
                (aRecentViewProductsJson[idx].cate1 +
                  "|" +
                  aRecentViewProductsJson[idx].cate2 +
                  "|" +
                  aRecentViewProductsJson[idx].cate3 +
                  "|" +
                  aRecentViewProductsJson[idx].cate4) +
                '"><span class="blind">관심상품 저장하기</span></button>';
            }

            recentViewProductHtml +=
              '<button type="button" class="user-recent__prod__del" onclick="javascript:jQuery.deleteProduct(' +
              idx +
              ')"><span class="blind">최근 본 상품 삭제</span></button>' +
              "</li>";
          }
        }
      }
      recentViewProductHtml += "</ui></div>";
    } else {
      if (memberSeq) {
        recentViewProductHtml +=
          '<div class="user-recent__header">' +
          '<strong class="title">아직 최근 본 상품이 없네요!<br>이런 상품들을 둘러보시겠어요?</strong>' +
          "</div>" +
          '<div class="user-recent__prod">' +
          '<ul class="user-recent__prod__none-list">';

        if (aHotKeyword) {
          for (idx; idx < aHotKeyword.length; idx++) {
            recentViewProductHtml +=
              '<li class="user-recent__prod__none-item">' +
              '<a href="' +
              aHotKeyword[idx].url +
              '">' +
              aHotKeyword[idx].name +
              "</a>" +
              "</li>";
          }
        }
        recentViewProductHtml += "</ul></div>";
      } else {
        recentViewProductHtml +=
          '<div class="user-recent__header">' +
          '<strong class="title">로그인하고 상품을 보시면<br>모든 기기와 브라우저에서 연동됩니다.</strong>' +
          "</div>" +
          '<div class="user-recent__prod">' +
          '<a href="' +
          loginUrl +
          '" class="btn_login">로그인</a>' +
          "</div>";
      }

      $.cookie("recentProductYN", "N", {
        expires: 30,
        path: "/",
        domain: ".danawa.com",
      });

      if ($(".recently_seeing_goods .number_has").length > 0) {
        $(".recently_seeing_goods .number_has").remove();
      }
    }
    $("#recentProduct").html(recentViewProductHtml);
  };

  $.drawPlan = function () {
    var planIdx = nShoppingPlanCurrentPage * 2;
    var planHtml = "";
    var planRowCount = planIdx + 2;

    // 추천 기획전
    if (aShoppingPlanJson.length % 2 === 0) {
      nShoppingPlanPageCount = Math.floor(aShoppingPlanJson.length / 2);
    } else {
      nShoppingPlanPageCount = Math.floor(aShoppingPlanJson.length / 2) + 1;
    }

    planHtml +=
      '<div class="user-recent__header">' +
      '<strong class="title">맞춤 구매가이드</strong>' +
      '<div class="swipe-control">' +
      '<div class="swipe-control__num">' +
      '<em class="current"><span class="blind">현재</span>' +
      (nShoppingPlanCurrentPage + 1) +
      '</em>/<span class="blind">전체</span>' +
      nShoppingPlanPageCount +
      "</div>" +
      '<div class="swipe-control__btn">' +
      '<button type="button" class="btn_prev" onclick="jQuery.prevPlanPage();"><span class="blind">최근 본 상품 이전</span></button>' +
      '<button type="button" class="btn_next" onclick="jQuery.nextPlanPage();"><span class="blind">최근 본 상품 다음</span></button>' +
      "</div>" +
      "</div>" +
      "</div>";

    if (aShoppingPlanJson.length > 0) {
      planHtml +=
        '<div class="user-recent__plan">' +
        '<ul class="user-recent__plan__list">';

      for (planIdx; planIdx < planRowCount; planIdx++) {
        if (!aShoppingPlanJson[planIdx]) {
          planHtml += "";
        } else {
          planHtml +=
            '<li class="user-recent__plan__item">' +
            '<a href="//plan.danawa.com/info/index.php?nPlanSeq=' +
            aShoppingPlanJson[planIdx].nShoppingPlanSeq +
            '" target="_blank" class="user-recent__plan__link">' +
            '<img src="' +
            aShoppingPlanJson[planIdx].sImageUrl +
            '" alt="' +
            aShoppingPlanJson[planIdx].sTitle +
            '" class="user-recent__plan__thumb" aria-hidden="true" onerror="this.src=\'//img.danawa.com/new/noData/img/noImg_400.gif\'">' +
            '<span class="user-recent__plan__title"><span class="txt">' +
            aShoppingPlanJson[planIdx].sTitle +
            "</span></span></a></li>";
        }
      }
      planHtml += "</ul></div>";
    }

    $("#buyingGuide").html(planHtml);
  };

  $.nextPage = function () {
    var page = nRecentViewProductsCurrentPage + 1;
    if (page >= nRecentViewPageCount) {
      nRecentViewProductsCurrentPage = 0;
    } else {
      nRecentViewProductsCurrentPage = page;
    }
    $.drawRecent();
    clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_상품_페이징");
  };

  $.prevPage = function () {
    var page = nRecentViewProductsCurrentPage - 1;
    if (page < 0) {
      nRecentViewProductsCurrentPage = nRecentViewPageCount - 1;
    } else {
      nRecentViewProductsCurrentPage = page;
    }
    $.drawRecent();
    clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_상품_페이징");
  };

  $.nextPlanPage = function () {
    var page = nShoppingPlanCurrentPage + 1;
    if (page >= nShoppingPlanPageCount) {
      nShoppingPlanCurrentPage = 0;
    } else {
      nShoppingPlanCurrentPage = page;
    }
    $.drawPlan();
    clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_기획전_페이징");
  };

  $.prevPlanPage = function () {
    var page = nShoppingPlanCurrentPage - 1;
    if (page < 0) {
      nShoppingPlanCurrentPage = nShoppingPlanPageCount - 1;
    } else {
      nShoppingPlanCurrentPage = page;
    }
    $.drawPlan();
    clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_기획전_페이징");
  };

  $.movePage = function (idx) {
    var page = idx;
    nRecentViewProductsCurrentPage = page;
    $.drawRecent();
  };

  //최근 본 카테고리 데이터 DB 접속
  $.loadContentCategoryDB = function () {
    var memberSeq = $("#memberSeq").val();
    var browserCode = $("#browserCode").val();

    var url =
      getHost() + "/globalData/recentProduct/getRecentCategory.json.php";
    var param = {
      memberSeq: memberSeq,
      browserCode: browserCode,
    };

    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      data: param,
      cache: false,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
      success: function (data) {
        aRecentViewCategoryJson = data;
        $.loadContentProductDB();
      },
    });
  };

  //최근 본 상품 데이터 DB 접속
  $.loadContentProductDB = function () {
    var memberSeq = $("#memberSeq").val();
    var browserCode = $("#browserCode").val();
    var url = getHost() + "/globalData/recentProduct/getRecentProduct.json.php";

    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      data: {
        memberSeq: memberSeq,
        browserCode: browserCode,
      },
      cache: false,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
      success: function (data) {
        aRecentViewProductsJson = data;
        $.drawRecent();

        // 가장 마지막에 본 기준상품으로 추천 기획전 조회
        var standardProdList = [];
        if (data && data.length) {
          $.each(data, function (index, item) {
            if (item.goodKind == 1) {
              standardProdList.push(item.productSeq);
            }
          });
          if (standardProdList.length > 0) {
            $.loadContentShoppingPlanDB(standardProdList[0]);
          } else {
            $.loadContentHotPlanDB();
          }
        } else {
          $.loadContentHotPlanDB();
        }
      },
    });
  };

  // 최근 본 상품 맞춤기획전 데이터 DB 접속
  $.loadContentShoppingPlanDB = function (productCode) {
    var url =
      getHost() + "/globalData/shoppingPlan/getShoppingPlanList.json.php";

    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      data: {
        productCode: productCode,
      },
      cache: false,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
      success: function (data) {
        aShoppingPlanJson = data.result;
        $.drawPlan();
      },
    });
  };

  // HOT에 있는 기획전 12개 랜덤 노출
  $.loadContentHotPlanDB = function () {
    var url = getHost() + "/globalData/shoppingPlan/getHotPlanList.json.php";

    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      cache: false,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
      success: function (data) {
        aShoppingPlanJson = data.result;
        $.drawPlan();
      },
    });
  };

  // 로그인 상태에서 최근본 상품이 없을 시 인기 검색어 30개중 5개 랜덤 노출
  $.getHotKeyword = function () {
    var url = getHost() + "/globalData/search/getHotKeyword.json.php";

    $.ajax({
      type: "get",
      url: url,
      dataType: "json",
      cache: false,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
      success: function (data) {
        aHotKeyword = data;
      },
    });
  };

  $.setStartHomePage = function (obj) {
    obj.style.behavior = "url(#default#homepage)";
    obj.setHomePage("https://www.danawa.com/");
  };

  $.addFavorite = function () {
    window.external.addFavorite(
      "https://www.danawa.com/",
      "행복쇼핑의 시작! 다나와 (가격비교)"
    );
  };

  // 최근본 카테고리 삭제
  $.deleteCategory = function (idx) {
    var cateCodeArray = [];
    cateCodeArray.push(parseInt(aRecentViewCategoryJson[idx].code));
    aRecentViewCategoryJson.splice(idx, 1);
    $.drawRecent();

    var memberSeq = $("#memberSeq").val();
    var browserCode = $("#browserCode").val();
    var categoryCodeList = cateCodeArray.join(",");

    var param = {
      memberSeq: memberSeq,
      browserCode: browserCode,
      categoryCodeList: categoryCodeList,
    };

    var url = getHost() + "/globalData/recentProduct/deleteRecentCategory.php";

    $.ajax({
      type: "get",
      url: url,
      dataType: "json",
      data: param,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
    });
  };

  // 최근본 상품 삭제
  $.deleteProduct = function (idx) {
    var aProductCodeList = [];
    aProductCodeList.push(aRecentViewProductsJson[idx].productSeq);
    aRecentViewProductsJson.splice(idx, 1);
    $.drawRecent();

    var memberSeq = $("#memberSeq").val();
    var browserCode = $("#browserCode").val();
    var productCodeList = aProductCodeList.join(",");

    var param = {
      memberSeq: memberSeq,
      browserCode: browserCode,
      productCodeList: productCodeList,
    };

    var url = getHost() + "/globalData/recentProduct/deleteRecentProduct.php";

    $.ajax({
      type: "GET",
      url: url,
      dataType: "json",
      data: param,
      crossDomain: true,
      contentType: "application/x-www-form-urlencoded; charset=utf-8",
      xhrFields: {
        withCredentials: true,
      },
    });
  };

  //최근본상품 관심상품 팝업
  $.saveRecentProd = function (productCode, e) {
    var posX = (posY = 0);

    posX = e.screenX;
    posY = e.screenY;
    posX = posX - 100;
    posY = posY + 15;

    var userHeight = screen.availHeight;
    if (userHeight - posY < 350) {
      posY = posY - 350;
    }

    var url =
      "https://prod.danawa.com/list/popup/interestProduct.php?productCode=" +
      productCode;
    var opt =
      "left=" + posX + ",top=" + posY + ",width=365,height=306,resizable=false";
    var popWin = window.open(url, "pop_wishFolder", opt);
    popWin.focus();
  };

  //number_format
  $.number_format = function (data) {
    if (data == null) return 0;
    var tmp = "";
    var number = "";
    var cutlen = 3;
    var comma = ",";
    var i;

    len = data.length;
    mod = len % cutlen;
    k = cutlen - mod;
    for (i = 0; i < data.length; i++) {
      number = number + data.charAt(i);

      if (i < data.length - 1) {
        k++;
        if (k % cutlen == 0) {
          number = number + comma;
          k = 0;
        }
      }
    }
    if (data == 0) {
      number = 0;
    }
    return number;
  };

  // 쪽지보기
  $.viewMyNote = function () {
    var width = 450;
    var height = 500;
    var posx = 10;
    var posy = 10;

    position =
      "width=" +
      width +
      ",height=" +
      height +
      ",scrollbars=no,resizable=no,top=" +
      posy +
      ",left=" +
      posx;
    var note = window.open(
      "https://dpg.danawa.com/note/receiveList",
      "ViewNote",
      position
    );
    note.focus();
  };

  //쪽지 개수 비동기 호출
  $.getMemberMessageCount = function () {
    if (bMemberCountExcuteYN == "N") {
      $.ajax({
        url:
          getHost() +
          "/globalData/memberMessage/getMemberMessageCount.ajax.php",
        type: "POST",
        crossDomain: true,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        xhrFields: {
          withCredentials: true,
        },
        success: function (data) {
          if (data["msgCnt"] > 0 && $.isNumeric(data["msgCnt"])) {
            $(".layer__user-more span#message_count").text(
              "(" + data["msgCnt"] + ")"
            );
          }
        },
        complete: function () {
          bMemberCountExcuteYN = "Y";
        },
      });
    }
  };

  $.isTouchDevice = function () {
    var deviceAgent = navigator.userAgent.toLowerCase();
    var isTouchDevice =
      "ontouchstart" in document.documentElement ||
      deviceAgent.match(/(iphone|ipod|ipad)/) ||
      deviceAgent.match(/(android)/) ||
      deviceAgent.match(/(iemobile)/) ||
      deviceAgent.match(/iphone/i) ||
      deviceAgent.match(/ipad/i) ||
      deviceAgent.match(/ipod/i) ||
      deviceAgent.match(/blackberry/i) ||
      deviceAgent.match(/bada/i);
    return isTouchDevice;
  };
})(jQuery);

jQuery(document).ready(function ($) {
  if (!$("#browserCode").val()) {
    $("#browserCode").val($.cookie("danawa-loggingApplicationClient"));
  }

  $(document).on("mouseup", function (e) {
    // 최근 본 상품 바깥부분 클릭 시 레이어 닫기
    if (
      !$(".layer__user-recent").has(e.target).length &&
      !$(".btn_user--recent").has(e.target).length
    ) {
      $(".layer__user-recent").hide();
      $(".btn_user--recent").removeClass("opened");
    }
    // gnb 메뉴 더보기 바깥부분 클릭 시 레이어 닫기
    if (
      !$(".layer__nav-more").has(e.target).length &&
      !$(".layer__nav-more").has(e.target).length
    ) {
      $(".layer__nav-more").hide();
      $(".layer__nav-more").removeClass("more_cate_open");
    }
    // footer 자세히보기 바깥부분 클릭 시 레이어 닫기
    if (
      !$("#footer_law_layer").has(e.target).length &&
      !$("#footer_law_layer").has(e.target).length
    ) {
      $("#footer_law_layer").hide();
    }
    // footer 이메일수집거부 바깥부분 클릭 시 레이어 닫기
    if (
      !$("#denyEmailNoticeArea").has(e.target).length &&
      !$("#denyEmailNoticeArea").has(e.target).length
    ) {
      $("#denyEmailNoticeArea").hide();
    }

    // sub 메뉴 더보기 바깥부분 클릭 시 레이어 닫기
    if (
      !$(".sev_li.more_service").has(e.target).length &&
      !$(".sev_li.more_service").has(e.target).length
    ) {
      if ($(".more_sevice_click").hasClass("more_service_open")) {
        $("#more_service_layer2").hide();
        $(
          ".dnw-header__service.top_service_login .more_sevice_click"
        ).removeClass("more_service_open");
      }
    }
    // 모바일 앱 바깥부분 클릭 시 레이어 닫기
    if (
      !$("#mobile_service_layer").has(e.target).length &&
      !$("#mobile_service_layer").has(e.target).length
    ) {
      $(".btn_apss_wrap").removeClass("active_bg_style");
      $("#mobile_service_layer").removeClass("show2");
    }
  });

  //GNB 다나와앱 레이어 노출 (QrCode 첫화면에 미리 생성)
  getLayerInfo();

  /**
   * PRICE4.0 추가되는 버튼들 이벤트 (상단GNB 개인화 영역)
   */
  $(".recently_seeing_goods").on("mouseenter", function () {
    $(".recently_seeing_goods a").addClass("select");
  });
  $(".recently_seeing_goods").on("mouseleave", function () {
    var holdCondition = $(".recently_seeing_goods").hasClass("opened");

    if (!holdCondition) {
      $(".recently_seeing_goods a").removeClass("select");
    }
  });

  $(".interest_goods_service").on("mouseenter", function () {
    $(".interest_goods_service a").addClass("select");
  });
  $(".interest_goods_service").on("mouseleave", function () {
    $(".interest_goods_service a").removeClass("select");
  });

  $(".my_note_serice").on("mouseenter", function () {
    $(".my_note_serice a").addClass("select");
  });
  $(".my_note_serice").on("mouseleave", function () {
    $(".my_note_serice a").removeClass("select");
  });

  //최근 본 상품
  $(".btn_user--recent").on("click", function () {
    var memberSeq = $("#memberSeq").val();

    closeSiblingsGNBLayer("recent"); // 오픈 레이어 닫기

    var holdCondition = $(".btn_user--recent").hasClass("opened");

    if (!holdCondition) {
      $(".layer__user-recent").show();
      $(".btn_user--recent").addClass("opened");
      $(".btn_user--recent a").addClass("select");
      $.loadContentCategoryDB();
      if (memberSeq > 0) {
        $.getHotKeyword();
      }
    } else {
      $(".layer__user-recent").hide();
      $(".btn_user--recent").removeClass("opened");
      $(".btn_user--recent a").removeClass("select");
    }
    return false;
  });

  //최근 본 상품 닫기
  $(".layer__user-recent .btn_close").on("click", function () {
    $(".layer__user-recent").hide();
    $(".btn_user--recent").removeClass("opened");
    $(".btn_user--recent a").removeClass("select");
  });

  $(".my_service_layer").on("click", ".save_wishList", function () {
    $(".my_service_layer").find(".inte_folder_layer").remove();
  });

  //검색창 클릭시 최근본상품 레이어 닫기
  $(".search__input").on("click", function () {
    $(".more_sevice_click").removeClass("more_service_open");

    closeSiblingsGNBLayer("searchLayer");
    $(".screen_out").removeClass("more_service_open");
  });

  // 더보기 메뉴에 마지막 포커스 아웃 이면 창닫기
  $(".more_nav .layer__nav-more .more-list .item_more a")
    .last()
    .on("focusout", function () {
      $(".more_nav .layer__nav-more").removeClass("more_cate_open").hide();
    });
  /**
   * 더보기 버튼 클릭시 (통합메인)
   */
  $(".more_nav button#topMenu_moreButton").on("click", function (e) {
    e.preventDefault();

    var isOpen = $(".more_nav .layer__nav-more").hasClass("more_cate_open");
    if (!isOpen) {
      closeSiblingsGNBLayer("moreUrl");
      $(".more_nav .layer__nav-more").addClass("more_cate_open").show();
    } else {
      $(".more_nav .layer__nav-more").removeClass("more_cate_open").hide();
    }

    _trkEventLog("21통합검색_GNB_더보기");
  });

  /**
   * 더보기 버튼 클릭시 (나머지 서비스들)
   */
  $(".dnw-header__service.top_service_login .more_sevice_click").on(
    "click",
    function (e) {
      e.preventDefault();

      var isOpen = $(this).hasClass("more_service_open");
      if (!isOpen) {
        $("#more_service_layer2").show();
        $(this).addClass("more_service_open");
      } else {
        $("#more_service_layer2").hide();
        $(this).removeClass("more_service_open");
      }
    }
  );

  /**
   * 개인화 영역 로그인 마우스오버 레이어
   */
  var hasMyPageMoreLayer = false;
  var myPageTimeout = "";

  $(".layer__user-more .more-list a.link_more")
    .last()
    .on("focusout", function () {
      myPageTimeout = setTimeout(function () {
        if (hasMyPageMoreLayer == false && !$(this).hasClass("select")) {
          $(".layer__user-more").hide();
          $("a.btn_user.btn_user--login").removeClass("select");
        }
      }, 100);
    });

  $("a.btn_user.btn_user--login")
    .on("mouseenter focusin", function () {
      closeSiblingsGNBLayer("person");

      if (myPageTimeout != null) {
        clearTimeout(myPageTimeout);
      }

      //쪽지개수 조회 비동기 호출
      $.getMemberMessageCount();

      $("a.btn_user btn_user--login").addClass("select");
      $(".layer__user-more").show();

      return false;
    })
    .on("mouseleave", function () {
      myPageTimeout = setTimeout(function () {
        if (hasMyPageMoreLayer == false && !$(this).hasClass("select")) {
          $(".layer__user-more").hide();
          $("a.btn_user.btn_user--login").removeClass("select");
        }
      }, 100);
    })
    .on("click", function (event) {
      event.preventDefault();
    });

  /**
   * 개인화 영역 더보기 마우스오버 레이어
   */
  $(".layer__user-more").hover(
    function () {
      hasMyPageMoreLayer = true;
      $("a.btn_user.btn_user--login").addClass("select");
    },
    function () {
      hasMyPageMoreLayer = false;
      $(".layer__user-more").hide();
      $("a.btn_user.btn_user--login").removeClass("select");
    }
  );

  /**
   * CS센터 개편에 따른 CS클릭이벤트 추가
   */
  $("#csMoreView").on("click", function (e) {
    e.preventDefault();

    //고객센터 레이어 열려있을때
    var isOpen = $(this).parent().hasClass("off");
    if (isOpen) {
      $(this).parent().removeClass("off");
      $(this).addClass("more_cs_open");
    } else {
      $(this).parent().addClass("off");
      $(this).removeClass("more_cs_open");
    }
  });

  /**
   * PRICE4.0 추가되는 버튼들 이벤트(footer)
   */
  $("#danawa_footer #content_see_more").on("click", function (e) {
    e.preventDefault();
    $("#footer_law_layer").show();
  });

  $("#footer_law_layer .layer__basic__close").on("click", function (e) {
    e.preventDefault();
    $("#footer_law_layer").hide();
  });

  $("#denyEmailOpenBtn").on("click", function (e) {
    e.preventDefault();
    $("#denyEmailNoticeArea").show();
  });

  $("#denyEmailCloseBtn").on("click", function (e) {
    e.preventDefault();
    $("#denyEmailNoticeArea").hide();
  });

  /**
   * PRICE4.0 추가되는 버튼 이벤드 (search)
   */
  $(".market_search_option1,#market_search_option1").on(
    "mouseenter",
    function () {
      $("#market_search_option1").show();
      $("#market_search_option2").hide();
    }
  );
  $(".market_search_option1,#market_search_option1").on(
    "mouseleave",
    function () {
      $("#market_search_option1").hide();
      $("#market_search_option2").hide();
    }
  );

  $(".market_search_option2").on("mouseenter", function () {
    $("#market_search_option2").show();
    $("#market_search_option1").hide();
  });
  $("#market_search_option2").on("mouseleave", function () {
    $("#market_search_option2").hide();
    $("#market_search_option1").hide();
  });

  /**
   * GNB 로거
   */
  $(document).on("click", ".top_service_list li a", function () {
    var topName = $(this).text();
    try {
      if ($(this).hasClass("active_apps")) {
        _trk_clickTrace("EVT", "15GNB_" + topName + "앱");
      } else {
        _trk_clickTrace("EVT", "15GNB_" + topName);
      }
    } catch (_e) {}
  });
  /**
   * GNB 링크
   */
  $(document).on("click", ".main-header__nav > a", function () {
    try {
      _trk_clickTrace("EVT", "21통합검색_GNB_" + $(this).text());
    } catch (_e) {}
  });
  /**
   * GNB 더보기
   */
  $(document).on(
    "click",
    ".main-header__nav .more_nav .item_more a",
    function () {
      try {
        _trk_clickTrace("EVT", "21통합검색_GNB_더보기_" + $(this).text());
      } catch (_e) {}
    }
  );
  /**
   * GNB 서비스 전체보기
   */
  $(document).on(
    "click",
    ".more_nav .layer__nav-more .more-all a.link_all",
    function () {
      _trkEventLog("21통합검색_GNB_더보기_서비스전체보기");
    }
  );

  $(document).on("mousedown", ".btn_user--recent", function () {
    try {
      _trk_clickTrace("EVT", "21통합메인_GNB_최근본상품");
    } catch (_e) {}
  });
  $(document).on("click", ".btn_user--wish", function () {
    try {
      _trk_clickTrace("EVT", "21통합메인_GNB_관심상품");
    } catch (_e) {}
  });
  $(document).on("click", ".btn_user--login", function () {
    try {
      _trk_clickTrace("EVT", "21통합메인_GNB_로그인");
    } catch (_e) {}
    location.href = $(this).attr("href"); // 로그인 클릭시 로그인 페이지로 이동
  });

  $(document).on("click", ".btn_cate_all", function () {
    try {
      _trk_clickTrace("EVT", "ca_카테고리펼쳐보기_main");
    } catch (_e) {}
  });

  /**
   * 최근본상품 영역
   */
  $(document).on(
    "click",
    ".user-recent__prod__item .user-recent__prod__link",
    function () {
      clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_상품클릭");
    }
  );
  $(document).on(
    "mousedown",
    ".user-recent__prod__item .user-recent__prod__del",
    function () {
      clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_상품삭제");
    }
  );
  $(document).on(
    "click",
    ".user-recent__prod__item .user-recent__prod__wish",
    function () {
      clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_관심상품");
    }
  );
  $(document).on(
    "click",
    ".user-recent__cate__item .user-recent__cate__link",
    function () {
      clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_카테고리");
    }
  );
  $(document).on(
    "mousedown",
    ".user-recent__cate__item .user-recent__cate__del",
    function () {
      clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_카테고리삭제");
    }
  );
  $(document).on(
    "click",
    ".user-recent__plan__item .user-recent__plan__link",
    function () {
      const planTitle = $(this).find(".user-recent__plan__title .txt").text();
      clickTraceGNB("EVT", "21통합메인_GNB_최근본상품_콘텐츠클릭_" + planTitle);
    }
  );
  $(document).on("click", ".category__depth__row a", function () {
    var cateList = $(this).data("catelist");
    if ($(this).data("catelist")) {
      var evn_type = "";
      if ($("#danawa_header").hasClass("main-header--fixed")) {
        evn_type = "ca_플로팅";
      } else {
        evn_type = "ca_";
      }
      clickTraceGNB("EVT", evn_type + cateList);
    }
  });
  $(document).on("mousedown", ".category__depth__row a", function () {
    var cateList = $(this).data("catelist");
    if (typeof cateList !== "undefined" && $(this).data("catelist") != "") {
      //카테고리 펼쳐보기로 오픈했을때 클릭이벤트 분기
      //sCategoryExplodeLoggerText 변수는 각 서비스에서 선언
      if (
        typeof sCategoryExplodeLoggerText !== undefined &&
        sCategoryExplodeLoggerText != null
      ) {
        var sCategoryExplodeResultText = "ca_";
        if (sCategoryExplodeLoggerText != "main") {
          sCategoryExplodeResultText += "카테고리펼쳐보기_";
        }
        sCategoryExplodeResultText +=
          sCategoryExplodeLoggerText + "_" + cateList;
        clickTraceGNB("EVT", sCategoryExplodeResultText);
      }
    }
  });
  /**
   * 회원 링크
   */
  $(document).on("click", ".layer__user-more .item_more a", function (event) {
    var text = $.trim($(this).text().replace(/ /g, ""));
    clickTraceGNB("EVT", "21통합메인_GNB_회원_" + text);
  });
  /**
   * 다나와 앱 레이어 노출
   */
  $(".btn_app").on("click", function () {
    var openCondition = $(".btn_apss_wrap").hasClass("active_bg_style");
    if (!openCondition) {
      if ($(".more_sevice_click").hasClass("more_service_open")) {
        $("#more_service_layer").css("display", "none");
        $(".screen_out").removeClass("more_service_open");
      }
      $(".btn_apss_wrap").addClass("active_bg_style");
      $("#mobile_service_layer").addClass("show2");
    } else {
      $(".btn_apss_wrap").removeClass("active_bg_style");
      $("#mobile_service_layer").removeClass("show2");
    }
  });

  $(".btn_apps_close").on("click", function () {
    $(".btn_apss_wrap").removeClass("active_bg_style");
    $("#mobile_service_layer").removeClass("show2");
  });

  /**
   * 다나와 앱 설치 문자 전송
   * */
  $(".btn_sms_send").on("click", function () {
    $.phoneVaildate = function (phoneNumber) {
      if (phoneNumber != "") {
        var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
        if (!regExp.test(phoneNumber)) {
          return false;
        } else {
          return true;
        }
      }
    };

    var phoneNumObj = $(".input_size_01");
    var serviceType = $("#now_mobileApp").val();
    var appName = $(".active_apps").text();
    var phoneNumber = "";

    for (var i = 0; i < phoneNumObj.length; i++) {
      phoneNumber += phoneNumObj[i].value;
    }

    var phoneNumCheck = $.phoneVaildate(phoneNumber);

    if (phoneNumber == "") {
      alert("전화번호를 확인해주세요.");
      $(".input_size_01").val("");
    } else {
      if (phoneNumCheck == false) {
        alert("전화번호를 확인해주세요.");
        $(".input_size_01").val("");
      } else {
        $.post(
          getHost() + "/globalData/sendSms/sendSms.ajax.php",
          {
            serviceType: serviceType,
            phoneNumber: phoneNumber,
            appName: appName,
          },
          function () {
            alert("문자가 전송되었습니다.");
            $(".input_size_01").val("");
            _trkEventLog("15GNB_" + appName + "앱_보내기");
          }
        );
      }
    }
  });

  //번호 입력란 입력 수 제한
  $("#smsNumber_first").on("keyup", function () {
    var first = $("#smsNumber_first").val();
    $("#smsNumber_first").attr("maxlength", "3");
    if (first.length >= 3) {
      $("#smsNumber_middle").focus();
    }
  });
  $("#smsNumber_middle").on("keyup", function () {
    var middle = $("#smsNumber_middle").val();
    $("#smsNumber_middle").attr("maxlength", "4");
    if (middle.length >= 4) {
      $("#smsNumber_last").focus();
    }
  });
  $("#smsNumber_last").on("keyup", function () {
    $("#smsNumber_last").attr("maxlength", "4");
    var last = $("#smsNumber_last").val();
    if (last.length <= 4) {
      $("#smsNumber_last").val(last);
    }
  });

  //광고검색 안내레이어 노출 닫기
  $(document).on(
    "click",
    ".btn__onboarding__close, .layer_onboarding .layer__basic__dimm",
    function () {
      $(".layer__basic.layer_onboarding").hide();
      try {
        _trk_clickTrace("EVT", "외부검색유입_레이어_닫기버튼");
      } catch (_e) {}
      return false;
    }
  );

  //광고검색 안내레이어 즐겨찾기
  $(document).on("click", ".btn__onboarding__bookmark", function () {
    addFavoriteUrl("//www.danawa.com", "행복쇼핑의 시작! 다나와 (가격비교)");
    try {
      _trk_clickTrace("EVT", "외부검색유입_레이어_즐겨찾기");
    } catch (_e) {}
    return false;
  });

  //콘텐츠제공서비스 품질인증 레이어 열기
  $(".icon_contents_confirm").on("click", function (e) {
    e.preventDefault();
    if ($("#contentsConfirmLayer").is(":visible")) {
      $("#contentsConfirmLayer").hide();
    } else {
      $("#contentsConfirmLayer").show();
    }
  });

  //콘텐츠제공서비스 품질인증 레이어 닫기버튼
  $("#contentsConfirmCloseButton").on("click", function (e) {
    e.preventDefault();
    $("#contentsConfirmLayer").hide();
  });

  // 관심상품
  $(".layer__user-recent").on("click", ".user-recent__prod__wish", function () {
    var categoryCode1 = "";
    var categoryCode2 = "";
    let servicePage = "info_relation";
    const goodkind = $(this).attr("goodkind");
    if (goodkind == 1) {
      const cateList = $(this).attr("cate").split("|");
      if (cateList.length > 2) {
        categoryCode1 = cateList[0];
        categoryCode2 = cateList[1];
      }
    } else if (goodkind == 2) {
      // 협력사 상품인 경우 예외 처리
      servicePage = "info_relation_company";
    }

    if ($(this).hasClass("on")) {
      $(this).danawaDeleteProductToWishList(
        $(this).attr("key"),
        $(this).attr("code"),
        categoryCode1,
        categoryCode2
      );
    } else {
      $(this).danawaAddProductToWishList(
        $(this).attr("code"),
        servicePage,
        categoryCode1,
        categoryCode2,
        $(this).attr("price")
      );
    }
  });
});

//GNB 다나와앱 레이어 노출, QRCode 생성
function getLayerInfo(self, serviceType) {
  if (!serviceType) {
    serviceType = "priceCompare";
  }

  //현재 선택된 서비스 hidden 설정
  jQuery("#now_mobileApp").val(serviceType);

  jQuery.post(
    getHost() + "/globalData/makeQrCodeImage/ajax/qrCodeGenerate.ajax.php",
    { serviceType: serviceType },
    function (data) {
      //jQuery('.qr_image_area').html(data);
      //qrcode 이미지 대체 텍스트
      //var appName = jQuery('.active_apps').text();
      jQuery("#qrCode_image").attr(
        "alt",
        "https://cws.danawa.com/mobileApp/qrCode.php?serviceType=" + serviceType
      ); // 웹 접근을 위한 src 추가
      jQuery("#qrCode_image").attr("src", jQuery.trim(data));
    }
  );

  if (serviceType == "tvShopping") {
    jQuery(".txt_sms_01").html("* 아이폰은 지원예정입니다.");
  } else {
    jQuery(".txt_sms_01").html("");
  }

  jQuery(".gnb_apps_link").on("click", function () {
    jQuery(".gnb_apps_link").removeClass("active_apps");
    jQuery(self).addClass("active_apps");

    jQuery(".gnb_apps_imgs").hide();
    jQuery("#layerInfo_" + serviceType).show();

    jQuery("#now_mobileApp").val(serviceType);
  });
}

//광고검색 안내레이어 즐겨찾기(브라우저별 분기처리)
function addFavoriteUrl(url, title) {
  if (window.sidebar && window.sidebar.addPanel) {
    //Firefox < 23
    window.sidebar.addPanel(title, url, "");
  } else if (window.opera && window.print) {
    //Opera
    var addBtn = $(".btn_bookmark_add1");
    addBtn.attr("href", url);
    addBtn.attr("title", title);
    addBtn.attr("rel", "sidebar");
    addBtn.off(e);
  } else {
    // chrome , safari, firefox, ie11
    alert(
      (navigator.userAgent.toLowerCase().indexOf("mac") !== -1
        ? "Cmd"
        : "Ctrl") + "+D로 즐겨찾기에 추가하실 수 있습니다."
    );
  }
}

//GNB내 레이어 오픈시 파라미터의 객체 이외의 모든 레이어 닫기
function closeSiblingsGNBLayer(selector) {
  var GNBLayers = [
    "searchLayer",
    "cateAll",
    "mainLnb",
    "person",
    "recent",
    "moreUrl",
    "mobileApp",
  ];

  if (jQuery.inArray(selector, GNBLayers) >= 0) {
    if (selector !== "cateAll") {
      //카테고리 펼쳐보기
      jQuery(".btn_cate_all.btn_cate").removeClass("btn_cate--active");
      jQuery("#category").removeClass("category--active");
    }
    if (selector !== "moreUrl") {
      //통합메인 더보기
      jQuery(".more_nav .layer__nav-more").removeClass("more_cate_open").hide();
    }
    if (selector !== "recent") {
      //최근본상품
      jQuery(".layer__user-recent").hide();
      jQuery(".btn_user--recent").removeClass("opened");
      jQuery(".btn_user--recent a").removeClass("select");
    }

    jQuery("ul#sectionLayer li").removeClass("select active");
    jQuery("ul#sectionLayer .category_hover_layer").hide();
  }
}

// GNB 클릭 이벤트 로그
function clickTraceGNB(event, text) {
  try {
    if ($("#danawa_header").hasClass("main-header--fixed")) {
      text = text.replace("_GNB_", "_플로팅_");
    }
    _trk_clickTrace(event, text);
  } catch (_e) {}
}

function getHost() {
  var host = location.host;
  if (
    location.host.indexOf("dpg") > -1 ||
    location.host.indexOf("shoppingguide") > -1
  ) {
    host = "static.danawa.com";
    if (
      location.host.indexOf("-local") > -1 ||
      location.host.indexOf("-t") > -1
    ) {
      host = "static-t.danawa.com";
    }
  }
  return location.protocol + "//" + host;
}
