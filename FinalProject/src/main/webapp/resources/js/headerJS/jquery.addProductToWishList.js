(function ($) {
  var aWL = (addProductToWishList = function (
    selector,
    prodCode,
    servicePage,
    cate_c1,
    cate_c2,
    price
  ) {
    var selectors = {
      clickButton: null, //클릭된 버튼
      parentLayer: null, //최상단 부모 레이어
      mainLayer: null, //관심상품담기 최상단 Layer
      wishListLayer: null, //관심상품폴더선택 상단 Layer
      //wishListTitleLayer		:	null,			//관심상품폴더선택 타이틀 Layer
      wishListUlLayer: null, //관심상품폴더선택 본문 Layer
      wishAsideLayer: null, //모바일관심상품폴더선택 Layer
      toastLayer: null, //토스트 Layer
      nonLogincompleteLayer: null, //비로그인 관심상품 담기완료 Layer
      bundleWishSelectLayer: null, //묶음 상품 선택용 dl Layer
      bundleWishFolderLayer: null, //묶음 상품 폴더 선택 dl Layer
      wishFolderDivLayer: null, //묶음 상품 폴더 선택 div Layer
      wishSaveLayer: null, //묶음 상품 한개 저장 폴더 선택 div Layer
    };

    var options = {
      memberId: null,
      prodCode: null,
      servicePage: null,
      serviceType: 0,
      serviceTypName: "관심상품",
      estimateYN: "N",
      cate_c1: cate_c1,
      cate_c2: cate_c2,
      price: 0,
      linkProdCode: null,
      shopId: null,
    };

    /*
     * 서비스타입
     * search:				 통합검색,
     * search_bundle:		 통합검색(묶음상품/이미지형 미포함),
     * search_image:		 통합검색(묶음상품 이미지형),
     * list:				 리스트,
     * list_bundle:			 리스트(묶음상품/이미지형 포함),
     * list_compare:		 상품비교레이어,
     * list_compare_popup:	 상품비교팝업,
     * info:				 블로그,
     * gnb_recent:			 최근본상품
     * keyword:				 인기검색어
     * list_company:         리스트(협력사 상품)
     * list_company_imge:    리스트(협력사 상품 / 이미지형)
     * info_relation_company 최근 본 상품 (협력사 상품)
     * search_company        통합검색(협력사 상품)
     */
    //서비스타입()
    options.servicePage = servicePage;
    options.prodCode = prodCode;
    options.price = price;
    selectors.clickButton = selector;

    // 협력사 상품인 경우 예외 처리
    const companyPage = [
      "list_company",
      "list_company_image",
      "search_company", // 통합검색 검색 상품 리스트형
      "search_comapny_image", // 통합검색 검색 상품 이미지형
      "info_relation_company", // GBN 최근본 상품
    ];

    if (companyPage.includes(servicePage)) {
      const prodInfo = options.prodCode.split("^");
      options.shopId = prodInfo[0];
      options.linkProdCode = prodInfo[1];
      options.prodCode = 0;
      options.cate_c1 = 0;
      options.cate_c2 = 0;
    }

    switch (servicePage) {
      case "list":
      case "list_bundle":
      case "search_image":
      case "search_comapny_image":
      case "list_company_image": // 협력사 상품
        selectors.parentLayer = selector.parent().parent().parent().parent();
        break;
      case "info_new":
      case "list_company": // 협력사 상품
      case "search":
      case "search_bundle":
      case "search_company": // 협력사 상품
        selectors.parentLayer = selector.parent().parent().parent();
        break;
      case "gnb_recent":
        selectors.parentLayer = selector.parent().parent();
        break;
      case "keyword":
        selectors.parentLayer = selector.parents(".recom_goods");
        break;
      case "list_compare_popup":
        selectors.parentLayer = selector.parent();
        break;
      default:
        selectors.parentLayer = selector.parent();
    }

    this.sel = selectors;
    this.opt = options;

    this.init();
  });

  aWL.prototype = {
    init: function () {
      //하나의 관심상품 레이어만 띄우도록 기존 띄워진 레이어 삭제
      if ($(".inte_folder_layer").length > 0) {
        $(".inte_folder_layer").remove();
      }
      this.makeWishListLayer();
    },

    /*
     * 관심상품 담기 레이어 생성
     * 서비스별 레이어 위치를 지정
     */
    makeWishListLayer: function () {
      var sel = this.sel;
      var opt = this.opt;
      var mainLayer = $(document.createElement("DIV")); //외부레이어
      var wishListLayer = $(document.createElement("DIV")); //로그인상태 리스트레이어
      var nonLogincompleteLayer = $(document.createElement("DIV")); //비로그인/로그인 저장완료 레이어
      var wishListUlLayer = $(document.createElement("UL")); //로그인상태 리스트UL
      var bundleWishSelectLayer = $(document.createElement("DL")); //묶음상품 담기시 로그인상태 묶음상품선택DL
      var bundleWishFolderLayer = $(document.createElement("DL")); //묶음상품 담기시 로그인상태 관심폴더선택DL
      var wishFolderDivLayer = $(document.createElement("DIV")); //묶음상품 담기시 로그인상태 관심폴더선택Div
      var wishSaveLayer = $(document.createElement("DIV")); //묶음 상품 한개 저장 폴더 선택 div
      var wishAsideLayer = $(".aside.aside__bottom");
      var toastLayer = $(".snackbar.snackbar--toast");

      var mainTop = "";
      var mainLeft = "";
      var clickButtonTop = sel.clickButton.position().top;
      var clickButtonLeft = sel.clickButton.position().left;
      var clickButtonTopLength = sel.clickButton.innerHeight();
      var clickButtonWidthLength = sel.clickButton.innerWidth();

      //상품비교팝업에서 위치 찾기위한 변수
      var clickButtonOffsetTop = sel.clickButton.offset().top;
      var clickButtonOffsetLeft = sel.clickButton.offset().left;

      mainTop = clickButtonTop + clickButtonTopLength + 5 + "px";
      mainLeft = clickButtonLeft + "px";

      if (opt.servicePage == "gnb_recent") {
        //최근본상품은 코딩으로 설정되어있어 위치를 따로 잡지 않음
        mainTop = clickButtonTop + 88 + "px";
        mainLeft = clickButtonLeft + 7 + "px";
      } else if (opt.servicePage == "list_compare") {
        mainTop = clickButtonTop - 232 + "px";
        mainLeft = clickButtonLeft - 357 + clickButtonWidthLength + "px";
      } else if (opt.servicePage == "list_compare_popup") {
        //상품비교팝업에서 좌우구분을 위한 분기처리
        if ($(document).width() > clickButtonOffsetLeft + 336) {
          mainLeft = clickButtonLeft - 30 + "px";
        } else {
          mainLeft = clickButtonLeft - 336 + 98 + "px";
        }
        mainTop = clickButtonTop + clickButtonTopLength + 7 + "px";
      }

      if (!sel.parentLayer.has(".inte_folder_layer").length) {
        //최근본상품, 상품블로그(2018 개편)은 코딩으로 설정되어있어 위치를 따로 잡지 않음
        if (
          opt.servicePage != "gnb_recent" &&
          opt.servicePage != "info_new" &&
          opt.servicePage != "list" &&
          opt.servicePage != "list_bundle" &&
          opt.servicePage != "search_image" &&
          opt.servicePage != "search_bundle" &&
          opt.servicePage != "plan" &&
          opt.servicePage != "mplan" &&
          opt.servicePage != "search_company_image" &&
          opt.servicePage != "list_company_image"
        ) {
          mainLayer.css({
            top: mainTop,
            left: mainLeft,
            position: "absolute",
            "z-index": "999999999",
          });
        }

        sel.parentLayer.append(mainLayer);

        sel.mainLayer = mainLayer;
        sel.wishListLayer = wishListLayer;
        sel.wishListUlLayer = wishListUlLayer;
        sel.bundleWishSelectLayer = bundleWishSelectLayer;
        sel.bundleWishFolderLayer = bundleWishFolderLayer;
        sel.wishFolderDivLayer = wishFolderDivLayer;
        sel.wishSaveLayer = wishSaveLayer;
        sel.wishAsideLayer = wishAsideLayer;
        sel.toastLayer = toastLayer;

        this.getMemberInfo(opt.prodCode, true);
      } else {
        sel.parentLayer.remove(".inte_folder_layer");
      }
    },

    /*
     * 회원/비회원 구분후 레이어 호출
     */
    getMemberInfo: function (prodCode, bInit) {
      var sel = this.sel;
      var opt = this.opt;
      var $$ = this;
      //				var prodCode = this.prodCode;
      // 저장한 상품코드 삭제
      sessionStorage.removeItem("tempWishOtion");

      var authHost = "auth.danawa.com";
      if (
        location.host.indexOf("-local") > -1 ||
        location.host.indexOf("-t") > -1
      ) {
        authHost = "auth-t.danawa.com";
      }

      var loginUrl =
        "https://" +
        authHost +
        "/login/login?url=" +
        (encodeURIComponent(location.href) || "http://m.danawa.com/index.html");
      //비회원일때
      if ($("#memberSeq").val() === "") {
        if (confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?")) {
          // 저장한 상품코드 저장
          sessionStorage.setItem("tempWishOtion", JSON.stringify(opt));
          location.href = loginUrl;
        }
      } else {
        $.ajax({
          type: "post",
          url: getWishHost() + "/globalData/wishList/getWishListInfo.ajax.php",
          data: {
            prodCode: prodCode,
            type: "getInfo",
            serviceType: opt.serviceType,
            price: opt.price,
          },
          crossDomain: true,
          contentType: "application/x-www-form-urlencoded; charset=utf-8",
          xhrFields: {
            withCredentials: true,
          },
          success: function (data) {
            var resultArr = $.parseJSON(data);
            if (resultArr.status == "N") {
              var sAlert =
                "시스템 점검으로 " +
                resultArr.startDate +
                "부터 " +
                resultArr.endDate;
              sAlert += "까지 서비스 이용이 제한됩니다. 조금만 기다려 주세요.";
              alert(sAlert);
              return false;
            } else {
              //회원일때
              if (resultArr.sType == "folderSelect") {
                //첫호출때만 탭노출여부 조회
                if (bInit === true) {
                  $$.checkEstimateYN();
                }
                if (
                  opt.servicePage == "list_bundle" ||
                  opt.servicePage == "search_bundle"
                ) {
                  $$.displayBundleWishListLayer(
                    resultArr.aInterestProductList,
                    resultArr.nMemberSeq
                  );
                } else {
                  $$.displayWishListLayer(
                    resultArr.aInterestProductList,
                    resultArr.nMemberSeq
                  );
                }
              } else if (resultArr.sType === "nonMembers") {
                // 비회원인 경우
                if (
                  confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?")
                ) {
                  // 저장한 상품코드 저장
                  sessionStorage.setItem("tempWishOtion", JSON.stringify(opt));
                  location.href = loginUrl;
                }
              }
            }

            //인사이트 임플리멘테이션 스크립트 추가
            _TRK_PNC = "PC0001";
            _TRK_G4 = "1";
          },
        });
      }
    },

    /*
     * 일반 관심상품 폴더 불러오기
     */
    displayWishListLayer: function (aInterestProductList, nMemberSeq) {
      var sel = this.sel;
      var opt = this.opt;
      var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
      var productNameHtml = "";

      //IE오류로 영역초기화 분리
      sel.bundleWishSelectLayer.html("");
      sel.bundleWishFolderLayer.html("");
      sel.wishListUlLayer.html("");
      sel.wishListLayer.html("");
      sel.mainLayer.html("");
      sel.wishSaveLayer.html("");
      sel.wishAsideLayer.html("");

      if (special_pattern.test(opt.prodCode)) {
        productNameHtml += "";
      } else {
        var bundleData = $("#wishListBundleVal_" + opt.prodCode).val();

        if (bundleData) {
          var productName = bundleData.split("//")[1];

          productNameHtml += "<dt>" + productName + "</dt>";
          productNameHtml += "<dd></dd>";
        } else {
          var prodCode = opt.prodCode;
          var title = $("#title_" + prodCode).text();

          if (!title) {
            // 상품명이 공백이라면, 상위 엘리먼트 검색 시도
            title = $(sel.clickButton)
              .parents("li")
              .find(".prod_name > a")
              .text();
          }

          productNameHtml += "<dt>" + title + "</dt>";
          productNameHtml += "<dd></dd>";
        }
      }

      sel.bundleWishSelectLayer.addClass("wish_select").append(productNameHtml);

      var html = "";
      if (opt.servicePage == "mplan") {
        html =
          '<ul class="layer-sort__list">' +
          '<li class="layer-sort__item">' +
          '<div class="layer-sort__select">';

        var folderCount = 1;
        $.each(aInterestProductList, function () {
          html +=
            '<input type="radio" id="wishFolder_' +
            this.folderSeq +
            '" class="folder_name" name="checkRadioFolder" onClick="dnwLoggingApplicationClient(\'' +
            (opt.prodCode || "") +
            "', '" +
            (nMemberSeq || "") +
            "'); return false;\">";
          html +=
            '<label for="wishFolder_' +
            this.folderSeq +
            '">' +
            this.folderName +
            "</label>";

          ++folderCount;
        });

        html += "</div>" + "</li>" + "</ul>";

        sel.bundleWishFolderLayer.html(html);
      } else {
        html += "<dt>저장할 폴더</dt>";
        html += "<dd>";
        html += '<ul class="prod_list">';

        $.each(aInterestProductList, function () {
          html += '<li class="prod_folder">';
          html +=
            '<a href="#" onClick="dnwLoggingApplicationClient(\'' +
            (opt.prodCode || "") +
            "', '" +
            (nMemberSeq || "") +
            '\'); return false;" class="folder_name" id="wishFolder_' +
            this.folderSeq +
            '">' +
            this.folderName +
            "</a>";
          html += "</li>";
        });

        html += "</ul>";
        html += "</dd>";

        sel.bundleWishFolderLayer.addClass("wish_folder").append(html);
      }

      var tabItemHtml = "";
      if (opt.estimateYN == "Y") {
        if (opt.serviceType == 1) {
          var sWishClassHtml = "";
          var sEstiClassHtml = "on";
        } else {
          var sWishClassHtml = "on";
          var sEstiClassHtml = "";
        }
        tabItemHtml += '<div class="inte_tab">';
        tabItemHtml += "<ul>";
        tabItemHtml +=
          '<li class="tab_item ' +
          sWishClassHtml +
          '"><a href="#" class="wishFolderTab" onclick="return false;" data-serType="0">관심상품</a></li>';
        tabItemHtml +=
          '<li class="tab_item ' +
          sEstiClassHtml +
          '"><a href="#" class="wishFolderTab" onclick="return false;" data-serType="1">PC견적함</a></li>';
        tabItemHtml += "</ul>";
        tabItemHtml += "</div>";
      }

      if (opt.estimateYN == "Y") {
        sel.mainLayer
          .addClass("inte_folder_layer")
          .append('<h4 class="layer_title">관심상품 폴더 선택</h4>')
          .append(
            '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>'
          )
          .append(tabItemHtml)
          .append(sel.bundleWishSelectLayer)
          .append(sel.bundleWishFolderLayer);
      } else if (opt.servicePage == "plan") {
        sel.mainLayer
          .addClass("inte_folder_layer")
          .append('<h4 class="layer_title">관심상품 폴더 선택</h4>')
          .append(
            '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>'
          )
          .append(sel.bundleWishSelectLayer)
          .append(sel.bundleWishFolderLayer)
          .show();
      } else if (opt.servicePage == "mplan") {
        sel.wishAsideLayer
          .addClass("aside--open")
          .append(
            '<div class="aside__header">' +
              '<strong class="title"><span class="blind">관심상품</span>폴더 선택</strong>' +
              "</div>" +
              '<div class="aside__cont">' +
              sel.bundleWishFolderLayer.html() +
              "</div>" +
              '<button id="wishLayerCloseBtn" class="layer-basic__close">' +
              '<span class="blind">닫기</span>' +
              "</button>"
          );

        $("#dimmLayer").show();
      } else {
        sel.mainLayer
          .addClass("inte_folder_layer")
          .append('<h4 class="layer_title">관심상품 폴더 선택</h4>')
          .append(
            '<a href="#" id="wishCloseBtn"class="com_gnb btn_service_close">닫기</a>'
          )
          .append(sel.bundleWishSelectLayer)
          .append(sel.bundleWishFolderLayer);
      }

      var folderLayer;

      if (opt.servicePage == "mplan") {
        folderLayer = sel.wishAsideLayer;
      } else {
        folderLayer = sel.mainLayer;
      }
      // 관심 폴더 선택 이벤트
      $(folderLayer)
        .off("click", ".folder_name[id^=wishFolder_]")
        .delegate(".folder_name[id^=wishFolder_]", "click", function (e) {
          e.preventDefault();
          var folderSeq = $(this).attr("id").split("_")[1];
          var folderName = $(this).text();

          if (opt.servicePage == "mplan") {
            sel.wishAsideLayer.removeClass("aside--open");
            sel.wishAsideLayer.html("");
            $("#dimmLayer").hide();
          }

          $.ajax({
            type: "POST",
            url:
              getWishHost() + "/globalData/wishList/getWishListInfo.ajax.php",
            data: {
              folderSeq: folderSeq,
              prodCode: opt.prodCode,
              serviceType: opt.serviceType,
              linkProdCode: opt.linkProdCode,
              shopId: opt.shopId,
              type: "selectFolder",
              prodTitle: opt.prodTitle,
              price: opt.price,
            },
            crossDomain: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            xhrFields: {
              withCredentials: true,
            },
            success: function (data) {
              var resultArr = $.parseJSON(data);
              var sMoreComment = "";

              if (resultArr.status == "N") {
                var sAlert =
                  "시스템 점검으로 " +
                  resultArr.startDate +
                  "부터 " +
                  resultArr.endDate;
                sAlert +=
                  "까지 서비스 이용이 제한됩니다. 조금만 기다려 주세요.";
                alert(sAlert);
                return false;
              } else {
                //중복이나 PC견적 미허용카테고리일 경우 경고창에 내용 추가
                if (resultArr.nDuplicateCount > 0) {
                  sMoreComment +=
                    "중복상품 " + resultArr.nDuplicateCount + "개";
                }
                if (resultArr.nExceptCount > 0) {
                  if (sMoreComment.length > 0) {
                    sMoreComment += ", ";
                  }
                  sMoreComment +=
                    "PC견적 제외상품 " + resultArr.nExceptCount + "개";
                }
                if (sMoreComment.length > 0) {
                  sMoreComment = "\n (" + sMoreComment + ")";
                }

                if (resultArr.sSaveSuccess == "wish_full") {
                  alert("저장폴더당 관심상품 저장 개수는 최대 100개입니다.");
                } else if (resultArr.sSaveSuccess == "wish_failed") {
                  alert(
                    "죄송합니다. 관심상품 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
                  );
                } else if (resultArr.sSaveSuccess == "wish_success") {
                  var saveHtml = "";

                  if (opt.servicePage == "mplan") {
                    saveHtml +=
                      '<div class="snackbar__txt">관심상품 저장 완료</div>';

                    sel.toastLayer.find(".snackbar__wrap").append(saveHtml);
                    sel.toastLayer.addClass("snackbar--show");

                    setTimeout(function () {
                      sel.toastLayer.removeClass("snackbar--show");
                      sel.toastLayer.find(".snackbar__wrap").html("");
                    }, 1500);
                  } else {
                    saveHtml += '<h4 class="layer_title2">저장 완료</h4>';
                    saveHtml +=
                      '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>';
                    saveHtml += '<div class="folder_submit">';
                    saveHtml +=
                      '<span class="txt">마이페이지 &gt; 관심상품에서<br />확인할 수 있습니다.</span>';
                    saveHtml += "</div>";

                    sel.mainLayer
                      .addClass("inte_folder_layer done")
                      .html(saveHtml);

                    setTimeout(function () {
                      sel.mainLayer.remove();
                    }, 1500);
                  }

                  // 아이콘 활성화
                  if (
                    $('[data-productcode="' + opt.prodCode + '"]').length > 0
                  ) {
                    $('[data-productcode="' + opt.prodCode + '"]').addClass(
                      "on"
                    );
                  }

                  if ($('[code="' + opt.prodCode + '"]').length > 0) {
                    $('[code="' + opt.prodCode + '"]').addClass("on");
                  }

                  if (
                    $(`[code="${opt.shopId + "^" + opt.linkProdCode}"]`)
                      .length > 0
                  ) {
                    $(
                      `[code="${opt.shopId + "^" + opt.linkProdCode}"]`
                    ).addClass("on");
                  }

                  if (
                    sel.clickButton.hasClass("btn_zzim") &&
                    !sel.clickButton.hasClass("btn_zzim--select")
                  ) {
                    sel.clickButton.addClass("btn_zzim--select");
                    sel.clickButton
                      .parent()
                      .find("span.blind")
                      .html("찜하기 선택됨");
                  }

                  if (opt.servicePage == "list_compare_popup") {
                    if (
                      sel.clickButton.hasClass("btn_interest") &&
                      !sel.clickButton.hasClass("active")
                    ) {
                      sel.clickButton.addClass("active");
                      sel.clickButton
                        .find("span.blind")
                        .html("관심상품 저장 취소");
                    }
                  }

                  //인사이트 임플리멘테이션 스크립트 추가
                  _TRK_PNC = "PC0001";
                  _TRK_G4 = "1";
                } else if (resultArr.sSaveSuccess == "wish_dup") {
                  var folderSavedHtml = "";

                  folderSavedHtml += '<h4 class="layer_title2"></h4>';
                  folderSavedHtml +=
                    '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>';
                  folderSavedHtml += '<div class="folder_saved">';
                  folderSavedHtml +=
                    '<p class="text">"' +
                    folderName +
                    '"에 이미 저장되어 있는 상품입니다.<br />보관함으로 이동하시겠습니까?</p>';
                  folderSavedHtml += "</div>";
                  folderSavedHtml += '<div class="folder_submit">';
                  folderSavedHtml += '<div class="btn_center">';
                  folderSavedHtml +=
                    '<a href="http://www.danawa.com/myPage/wishList.html" class="btn_my_prod">보러가기</a>';
                  folderSavedHtml += "</div>";
                  folderSavedHtml += "</div>";

                  sel.mainLayer
                    .addClass("inte_folder_layer")
                    .html(folderSavedHtml);
                } else if (resultArr.sSaveSuccess == "esti_full") {
                  alert("저장폴더당 PC견적함 저장 개수는 최대 100개입니다.");
                } else if (resultArr.sSaveSuccess == "esti_failed") {
                  alert(
                    "죄송합니다. PC견적함 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
                  );
                } else if (resultArr.sSaveSuccess == "esti_success") {
                  var saveComplete = confirm(
                    folderName +
                      "에 " +
                      resultArr.nInsertCount +
                      "개 저장되었습니다.\nPC견적함으로 이동하시겠습니까?" +
                      sMoreComment
                  );
                  if (saveComplete == true) {
                    document.location.href =
                      "http://www.danawa.com/myPage/estimateList.php";
                  }
                  sel.parentLayer.find(".inte_folder_layer").remove();

                  //인사이트 임플리멘테이션 스크립트 추가
                  _TRK_PNC = "PC0001";
                  _TRK_G4 = "1";
                } else if (resultArr.sSaveSuccess == "esti_dup") {
                  var saveComplete = confirm(
                    folderName +
                      "에 이미 저장되어 있는 상품입니다.\nPC견적함으로 이동하시겠습니까?" +
                      sMoreComment
                  );
                  if (saveComplete == true) {
                    document.location.href =
                      "http://www.danawa.com/myPage/estimateList.php";
                  }
                  sel.parentLayer.find(".inte_folder_layer").remove();
                }
              }
            },
          });
        });
    },

    /*
     * 묶음상품용 관심상품 폴더 불러오기
     */
    displayBundleWishListLayer: function (aInterestProductList, nMemberSeq) {
      var sel = this.sel;
      var opt = this.opt;

      var html = "";

      sel.bundleWishSelectLayer.html("");
      sel.bundleWishFolderLayer.html("");
      sel.wishListLayer.html("");
      sel.mainLayer.html("");
      sel.wishFolderDivLayer.html("");

      var bundleProductSelectHtml = "";
      var bundleData = $("#wishListBundleVal_" + opt.prodCode).val();
      var bundleProduct = bundleData.split("//")[0];
      var productName = bundleData.split("//")[1];
      var nHighSaveQProdCode = bundleData.split("//")[2];

      //묶음상품 선택 HTML
      var aBundleProduct = bundleProduct.split("**");
      bundleProductSelectHtml += "<dt>" + productName + "</dt>";
      bundleProductSelectHtml +=
        '<dd><select id="bundleProductSel" title="상세 조건 선택">';
      $.each(aBundleProduct, function (index) {
        var sBundleName = this.split("^")[0];
        var nBundleCode = this.split("^")[1];
        var sSelectedOption = "";
        //인기도 1위인 묶음상품을 기본으로 설정
        if (nBundleCode == nHighSaveQProdCode) {
          sSelectedOption = "selected";
        }
        bundleProductSelectHtml +=
          '<option value="' +
          nBundleCode +
          '" ' +
          sSelectedOption +
          ">" +
          sBundleName +
          "</option>";
      });
      bundleProductSelectHtml += "</select></dd>";

      html += "<dt>저장할 폴더</dt>";
      html += "<dd>";
      html += "<ul>";
      $.each(aInterestProductList, function () {
        html +=
          '<li class="folder_name" id="wishFolder_' +
          this.folderSeq +
          '" onclick="return false;">';
        html += this.folderName;
        html += "</li>";
      });
      html += "</ul>";
      html += "</dd>";

      var aInteresthtml = "";

      aInteresthtml += '<div class="btn_center">';
      $.each(aInterestProductList, function () {
        aInteresthtml +=
          '<a href="#" class="btn_de_srch" id="wishFolders_' +
          this.folderSeq +
          '">저장하기</a>';
        aInteresthtml +=
          '<input type="hidden" id="folderName" value="' +
          this.folderName +
          '"/>';
        aInteresthtml +=
          '<input type="hidden" id="serviceType" value="' +
          opt.serviceType +
          '"/>';
      });
      aInteresthtml += "</div>";

      var tabItemHtml = "";
      if (opt.estimateYN == "Y") {
        if (opt.serviceType == 1) {
          var sWishClassHtml = "";
          var sEstiClassHtml = "on";
          opt.serviceTypName = "PC견적함";
        } else {
          var sWishClassHtml = "on";
          var sEstiClassHtml = "";
          opt.serviceTypName = "관심상품";
        }
        tabItemHtml += '<div class="inte_tab">';
        tabItemHtml += "<ul>";
        tabItemHtml +=
          '<li class="tab_item ' +
          sWishClassHtml +
          '"><a href="#" class="wishFolderTab" onclick="return false;" data-serType="0">관심상품</a></li>';
        tabItemHtml +=
          '<li class="tab_item ' +
          sEstiClassHtml +
          '" ><a href="#"  class="wishFolderTab" onclick="return false;" data-serType="1">PC견적함</a></li>';
        tabItemHtml += "</ul>";
        tabItemHtml += "</div>";
      }

      sel.bundleWishSelectLayer
        .addClass("wish_select")
        .append(bundleProductSelectHtml);

      if (aInterestProductList.length > 1) {
        sel.bundleWishFolderLayer.addClass("wish_folder").append(html);
      } else if (aInterestProductList.length == 1) {
        sel.wishFolderDivLayer.addClass("folder_submit").append(aInteresthtml);
      }

      sel.wishListLayer.addClass("inte_prod_list").append(sel.wishListUlLayer);

      if (aInterestProductList.length > 1) {
        sel.mainLayer
          .addClass("inte_folder_layer")
          .append('<h4 class="layer_title">관심상품 저장하기</h4>')
          .append(
            '<a href="#" id="wishCloseBtn"class="com_gnb btn_service_close">닫기</a>'
          )
          .append(tabItemHtml)
          .append(sel.bundleWishSelectLayer)
          .append(sel.bundleWishFolderLayer);
      } else if (aInterestProductList.length == 1) {
        sel.mainLayer
          .addClass("inte_folder_layer")
          .append('<h4 class="layer_title">관심상품 저장하기</h4>')
          .append(
            '<a href="#" id="wishCloseBtn"class="com_gnb btn_service_close">닫기</a>'
          )
          .append(tabItemHtml)
          .append(sel.bundleWishSelectLayer)
          .append(sel.wishFolderDivLayer);
      }

      $(sel.mainLayer).delegate(
        ".folder_name[id^=wishFolder_]",
        "mouseover",
        function (e) {
          $(this)
            .addClass("folder_select")
            .siblings()
            .removeClass("folder_select");
        }
      );

      $(sel.mainLayer)
        .off("click", ".folder_name[id^=wishFolder_]")
        .delegate(".folder_name[id^=wishFolder_", "click", function (e) {
          e.preventDefault();
          var selectedBundleProd = $(this)
            .parent()
            .parent()
            .parent()
            .parent()
            .find("#bundleProductSel option:selected")
            .val();
          if (selectedBundleProd == "") {
            alert("상품을 선택해주세요!");
            return false;
          } else {
            var folderSeq = $(this).attr("id").split("_")[1];

            if (aInterestProductList.length == 1) {
              var folderName = $("#folderName").val();
            } else {
              var folderName = $(this).text();
            }

            //						alert(opt.prodCode);
            $.ajax({
              type: "POST",
              url:
                getWishHost() + "/globalData/wishList/getWishListInfo.ajax.php",
              data: {
                folderSeq: folderSeq,
                prodCode: selectedBundleProd,
                serviceType: opt.serviceType,
                linkProdCode: opt.linkProdCode,
                shopId: opt.shopId,
                type: "selectFolder",
                price: opt.price,
              },
              crossDomain: true,
              contentType: "application/x-www-form-urlencoded; charset=utf-8",
              xhrFields: {
                withCredentials: true,
              },
              success: function (data) {
                var resultArr = $.parseJSON(data);
                if (resultArr.status == "N") {
                  var sAlert =
                    "시스템 점검으로 " +
                    resultArr.startDate +
                    "부터 " +
                    resultArr.endDate;
                  sAlert +=
                    "까지 서비스 이용이 제한됩니다. 조금만 기다려 주세요.";
                  alert(sAlert);
                  return false;
                } else {
                  if (resultArr.sSaveSuccess == "wish_full") {
                    alert("저장폴더당 관심상품 저장 개수는 최대 100개입니다.");
                  } else if (resultArr.sSaveSuccess == "wish_failed") {
                    alert(
                      "죄송합니다. 관심상품 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
                    );
                  } else if (resultArr.sSaveSuccess == "wish_success") {
                    var saveHtml = "";
                    saveHtml += '<h4 class="layer_title2">저장 완료</h4>';
                    saveHtml +=
                      '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>';
                    saveHtml += '<div class="folder_submit">';
                    saveHtml +=
                      '<span class="txt">마이페이지 &gt; 관심상품에서<br />확인할 수 있습니다.</span>';
                    saveHtml += "</div>";

                    sel.mainLayer
                      .addClass("inte_folder_layer done")
                      .html(saveHtml);

                    // 아이콘 활성화
                    if (
                      $('[data-productcode="' + opt.prodCode + '"]').length > 0
                    ) {
                      $('[data-productcode="' + opt.prodCode + '"]').addClass(
                        "on"
                      );
                    }

                    if ($('[code="' + opt.prodCode + '"]').length > 0) {
                      $('[code="' + opt.prodCode + '"]').addClass("on");
                    }

                    setTimeout(function () {
                      sel.mainLayer.remove();
                    }, 1500);

                    dnwLoggingApplicationClient(selectedBundleProd, nMemberSeq);
                    //									//인사이트 임플리멘테이션 스크립트 추가
                    _TRK_PNC = "PC0001";
                    _TRK_G4 = "1";
                  } else if (resultArr.sSaveSuccess == "wish_dup") {
                    var folderSavedHtml = "";
                    folderSavedHtml += '<h4 class="layer_title2"></h4>';
                    folderSavedHtml +=
                      '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>';
                    folderSavedHtml += '<div class="folder_saved">';
                    folderSavedHtml +=
                      '<p class="text">"' +
                      folderName +
                      '"에 이미 저장되어 있는 상품입니다.<br />보관함으로 이동하시겠습니까?</p>';
                    folderSavedHtml += "</div>";
                    folderSavedHtml += '<div class="folder_submit">';
                    folderSavedHtml += '<div class="btn_center">';
                    folderSavedHtml +=
                      '<a href="http://www.danawa.com/myPage/wishList.html" class="btn_my_prod">보러가기</a>';
                    folderSavedHtml += "</div>";
                    folderSavedHtml += "</div>";

                    sel.mainLayer
                      .addClass("inte_folder_layer")
                      .html(folderSavedHtml);
                  } else if (resultArr.sSaveSuccess == "esti_full") {
                    alert("저장폴더당 PC견적함 저장 개수는 최대 100개입니다.");
                  } else if (resultArr.sSaveSuccess == "esti_failed") {
                    alert(
                      "죄송합니다. PC견적함 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
                    );
                  } else if (resultArr.sSaveSuccess == "esti_success") {
                    var saveComplete = confirm(
                      folderName +
                        "에 저장되었습니다.\nPC견적함으로 이동하시겠습니까?"
                    );
                    if (saveComplete == true) {
                      document.location.href =
                        "http://www.danawa.com/myPage/estimateList.php";
                    }
                    sel.parentLayer.find(".inte_folder_layer").remove();
                    dnwLoggingApplicationClient(selectedBundleProd, nMemberSeq);
                    //									//인사이트 임플리멘테이션 스크립트 추가
                    _TRK_PNC = "PC0001";
                    _TRK_G4 = "1";
                  } else if (resultArr.sSaveSuccess == "esti_dup") {
                    var saveComplete = confirm(
                      folderName +
                        "에 이미 저장되어 있습니다.\nPC견적함으로 이동하시겠습니까?"
                    );
                    if (saveComplete == true) {
                      document.location.href =
                        "http://www.danawa.com/myPage/estimateList.php";
                    }
                    sel.parentLayer.find(".inte_folder_layer").remove();
                  }
                }
              },
            });
          }
        });

      $(sel.mainLayer)
        .off("click", ".btn_de_srch[id^=wishFolders_]")
        .delegate(".btn_de_srch[id^=wishFolders_]", "click", function (e) {
          e.preventDefault();
          var selectedBundleProd = $(this)
            .parent()
            .parent()
            .parent()
            .parent()
            .find("#bundleProductSel option:selected")
            .val();
          if (selectedBundleProd == "") {
            alert("상품을 선택해주세요!");
            return false;
          } else {
            var folderSeq = $(this).attr("id").split("_")[1];

            if (aInterestProductList.length == 1) {
              var folderName = $("#folderName").val();
            } else {
              var folderName = $(this).text();
            }

            //						alert(opt.prodCode);
            $.ajax({
              type: "POST",
              url:
                getWishHost() + "/globalData/wishList/getWishListInfo.ajax.php",
              data: {
                folderSeq: folderSeq,
                prodCode: selectedBundleProd,
                serviceType: opt.serviceType,
                linkProdCode: opt.linkProdCode,
                shopId: opt.shopId,
                type: "selectFolder",
                price: opt.price,
              },
              crossDomain: true,
              contentType: "application/x-www-form-urlencoded; charset=utf-8",
              xhrFields: {
                withCredentials: true,
              },
              success: function (data) {
                var resultArr = $.parseJSON(data);
                if (resultArr.status == "N") {
                  var sAlert =
                    "시스템 점검으로 " +
                    resultArr.startDate +
                    "부터 " +
                    resultArr.endDate;
                  sAlert +=
                    "까지 서비스 이용이 제한됩니다. 조금만 기다려 주세요.";
                  alert(sAlert);
                  return false;
                } else {
                  if (resultArr.sSaveSuccess == "wish_full") {
                    alert("저장폴더당 관심상품 저장 개수는 최대 100개입니다.");
                  } else if (resultArr.sSaveSuccess == "wish_failed") {
                    alert(
                      "죄송합니다. 관심상품 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
                    );
                  } else if (resultArr.sSaveSuccess == "wish_success") {
                    var saveHtml = "";
                    saveHtml += '<h4 class="layer_title2">저장 완료</h4>';
                    saveHtml +=
                      '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>';
                    saveHtml += '<div class="folder_submit">';
                    saveHtml +=
                      '<span class="txt">마이페이지 &gt; 관심상품에서<br />확인할 수 있습니다.</span>';
                    saveHtml += "</div>";

                    sel.mainLayer
                      .addClass("inte_folder_layer done")
                      .html(saveHtml);

                    // 아이콘 활성화
                    if (
                      $('[data-productcode="' + opt.prodCode + '"]').length > 0
                    ) {
                      $('[data-productcode="' + opt.prodCode + '"]').addClass(
                        "on"
                      );
                    }

                    if ($('[code="' + opt.prodCode + '"]').length > 0) {
                      $('[code="' + opt.prodCode + '"]').addClass("on");
                    }

                    setTimeout(function () {
                      sel.mainLayer.remove();
                    }, 1500);

                    dnwLoggingApplicationClient(selectedBundleProd, nMemberSeq);
                    //									//인사이트 임플리멘테이션 스크립트 추가
                    _TRK_PNC = "PC0001";
                    _TRK_G4 = "1";
                  } else if (resultArr.sSaveSuccess == "wish_dup") {
                    var folderSavedHtml = "";
                    folderSavedHtml += '<h4 class="layer_title2"></h4>';
                    folderSavedHtml +=
                      '<a href="#" id="wishCloseBtn" class="com_gnb btn_service_close">닫기</a>';
                    folderSavedHtml += '<div class="folder_saved">';
                    folderSavedHtml +=
                      '<p class="text">"' +
                      folderName +
                      '"에 이미 저장되어 있는 상품입니다.<br />보관함으로 이동하시겠습니까?</p>';
                    folderSavedHtml += "</div>";
                    folderSavedHtml += '<div class="folder_submit">';
                    folderSavedHtml += '<div class="btn_center">';
                    folderSavedHtml +=
                      '<a href="http://www.danawa.com/myPage/wishList.html" class="btn_my_prod">보러가기</a>';
                    folderSavedHtml += "</div>";
                    folderSavedHtml += "</div>";

                    sel.mainLayer
                      .addClass("inte_folder_layer")
                      .html(folderSavedHtml);
                  } else if (resultArr.sSaveSuccess == "esti_full") {
                    alert("저장폴더당 PC견적함 저장 개수는 최대 100개입니다.");
                  } else if (resultArr.sSaveSuccess == "esti_failed") {
                    alert(
                      "죄송합니다. PC견적함 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
                    );
                  } else if (resultArr.sSaveSuccess == "esti_success") {
                    var saveComplete = confirm(
                      folderName +
                        "에 저장되었습니다.\nPC견적함으로 이동하시겠습니까?"
                    );
                    if (saveComplete == true) {
                      document.location.href =
                        "http://www.danawa.com/myPage/estimateList.php";
                    }
                    sel.parentLayer.find(".inte_folder_layer").remove();
                    dnwLoggingApplicationClient(selectedBundleProd, nMemberSeq);
                    //									//인사이트 임플리멘테이션 스크립트 추가
                    _TRK_PNC = "PC0001";
                    _TRK_G4 = "1";
                  } else if (resultArr.sSaveSuccess == "esti_dup") {
                    var saveComplete = confirm(
                      folderName +
                        "에 이미 저장되어 있습니다.\nPC견적함으로 이동하시겠습니까?"
                    );
                    if (saveComplete == true) {
                      document.location.href =
                        "http://www.danawa.com/myPage/estimateList.php";
                    }
                    sel.parentLayer.find(".inte_folder_layer").remove();
                  }
                }
              },
            });
          }
        });
    },

    /*
     * 비회원 저장완료
     */
    displayNonLoginSave: function (resultArr) {
      var sel = this.sel;
      var opt = this.opt;

      var nonLoginHtml = "";
      if (
        resultArr.sSaveSuccess == "wish_failed" ||
        resultArr.sSaveSuccess == "wish_full"
      ) {
        if (opt.servicePage == "plan" || opt.servicePage == "mplan") {
          alert(
            "관심상품 저장실패\n죄송합니다. 관심상품 저장하기를 실패 하였습니다.\n다시한번 저장해 주십시오."
          );
        } else {
          nonLoginHtml +=
            '<div class="folder_saved"><p class="text">관심상품 저장에 실패하였습니다.</p></div>';
          nonLoginHtml +=
            '<div class="folder_submit"><a href="https://auth.danawa.com/login" target="_blank" class="btn_link_login">로그인</a></div>';
          nonLoginHtml +=
            '<div class="folder_guide"><p class="text">' +
            resultArr.sMessage +
            "</p></div>";

          sel.mainLayer
            .addClass("inte_folder_layer")
            .append('<h4 class="layer_title">관심상품 저장 실패</h4>')
            .append(
              '<a href="#" id="wishCloseBtn"class="com_gnb btn_service_close">닫기</a>'
            )
            .append(nonLoginHtml);
        }
      } else {
        if (opt.servicePage == "plan") {
          nonLoginHtml =
            '<div class="inte_folder_layer" style="display:block">' +
            '<h3 class="layer_title2">관심상품으로 저장되었습니다.</h3>' +
            '<a id="wishCloseBtn" href="javascript:void(0);" class="com_gnb btn_service_close">닫기</a>' +
            '<div class="folder_saved">' +
            '<p class="text">브라우저&nbsp;종료&nbsp;시 관심상품이 삭제됩니다． <br>로그인하시면&nbsp;관심상품을&nbsp;계속&nbsp;저장할&nbsp;수&nbsp;있습니다.</p>' +
            "</div>" +
            '<div class="folder_submit">' +
            '<div class="btn_center">' +
            '<a href="https://auth.danawa.com/login" class="btn_de_cls">로그인</a>' +
            '<a href="http://www.danawa.com/myPage/wishList.html" class="btn_my_prod">보러가기</a>' +
            "</div>" +
            "</div>" +
            "</div>";

          sel.mainLayer.addClass("layer-save").append(nonLoginHtml).show();

          if ($('[data-productcode="' + opt.prodCode + '"]').length > 0) {
            $('[data-productcode="' + opt.prodCode + '"]').addClass("on");
          }
        } else if (opt.servicePage == "mplan") {
          var authHost = "auth.danawa.com";
          if (
            location.host.indexOf("-local") > -1 ||
            location.host.indexOf("-t") > -1
          ) {
            authHost = "auth-t.danawa.com";
          }

          var loginUrl =
            "https://" +
            authHost +
            "/login/login?url=" +
            (encodeURIComponent(location.href) ||
              "http://m.danawa.com/index.html");

          nonLoginHtml =
            '<div class="layer-save__wrap">' +
            '<div class="layer-save__title"><strong>저장 완료</strong></div>' +
            '<button class="layer-save__btn"><span class="blind">닫기</span></button>' +
            '<div class="layer-save__desc">' +
            "<p>브라우저 종료 시  관심상품이 삭제됩니다.</p>" +
            "<p>로그인하시면 관심상품을 계속 저장할 수 있습니다.</p>" +
            "</div>" +
            '<a href="' +
            loginUrl +
            '" class="layer-save__link"><span>로그인</span></a>' +
            '<a href="http://www.danawa.com/myPage/wishList.html" class="layer-save__link2"><span>보러가기</span></a>' +
            "</div>";

          sel.mainLayer.addClass("layer-save").append(nonLoginHtml).show();

          if (
            sel.clickButton.hasClass("btn_zzim") &&
            !sel.clickButton.hasClass("btn_zzim--select")
          ) {
            sel.clickButton.addClass("btn_zzim--select");
            sel.clickButton.find("span.blind").html("찜하기 선택됨");
          }
        } else {
          var backwardUrl = "https://auth.danawa.com/login";
          var alinkTarget = "_blank";

          if (opt.servicePage == "info_new") {
            if (sLoginUrl) {
              if (sLoginUrl.match(/(https:)?\/\/auth[a-z\-]*.danawa.com/g)) {
                backwardUrl = sLoginUrl;
              } else {
                backwardUrl += "?url=" + sLoginUrl;
              }
            }

            alinkTarget = "_self";
          }

          nonLoginHtml +=
            '<div class="folder_saved"><p class="text">브라우저 종료 시 관심상품이 삭제됩니다.<br />로그인하시면 관심상품을 계속 저장할 수 있습니다.</p></div>' +
            '<div class="folder_submit">' +
            '<div class="btn_center">' +
            '<a href="' +
            backwardUrl +
            '" target="' +
            alinkTarget +
            '" class="btn_de_cls">로그인</a>' +
            '<a href="http://www.danawa.com/myPage/wishList.html" target="_blank" class="btn_my_prod">보러가기</a>' +
            "</div>" +
            "</div>";

          sel.mainLayer
            .addClass("inte_folder_layer")
            .append(
              '<h4 class="layer_title2">관심상품으로 저장되었습니다.</h4>'
            )
            .append(
              '<a href="#" id="wishCloseBtn"class="com_gnb btn_service_close">닫기</a>'
            )
            .append(nonLoginHtml);

          if (
            (sel.clickButton.hasClass("btn_interest") ||
              sel.clickButton.hasClass("interest")) &&
            !sel.clickButton.hasClass("on")
          ) {
            sel.clickButton.addClass("on").addClass("active");
          } else if (
            sel.clickButton.attr("id") == "interest" &&
            !sel.clickButton.closest(".interest").hasClass("on")
          ) {
            sel.clickButton.closest(".interest").addClass("on");
          } else if (
            sel.clickButton.hasClass("click_wish_prod") &&
            !sel.clickButton.hasClass("on")
          ) {
            sel.clickButton.addClass("on");
          } else if (
            sel.clickButton.hasClass("click_wish_companyProd") &&
            !sel.clickButton.hasClass("on")
          ) {
            sel.clickButton.addClass("on");
          }
        }

        // 사용자 경험 로깅 스크립트 추가
        dnwLoggingApplicationClient(opt.prodCode);
      }
    },

    /**
     * 상품코드로 PC견적함 탭 노출여부 조회
     * 일반적으로 상품코드 한개일때는 해당 상품코드로 물리카테고리를 조회하여 체크하고,
     * 상품리스트 상품비교 레이어처럼 여러 상품일때는 기준 물리카테고리를 설정하여 체크해야함 (상품리스트는 대표물리카테고리)
     */
    checkEstimateYN: function () {
      var sel = this.sel;
      var opt = this.opt;
      var $$ = this;

      $.ajax({
        type: "GET",
        dataType: "text",
        async: false,
        url:
          getWishHost() + "/globalData/wishList/checkEstimateCategory.ajax.php",
        data: {
          prodCode: opt.prodCode,
          cate_c1: opt.cate_c1,
          cate_c2: opt.cate_c2,
        },
        success: function (data) {
          if (data == "Y") {
            opt.estimateYN = "Y";
          }
        },
      });

      $(sel.mainLayer).delegate(
        ".tab_item a.wishFolderTab",
        "click",
        function (e) {
          if (!$(this).hasClass("on")) {
            var nChangeServiceType = $(this).attr("data-serType");
            opt.serviceType = nChangeServiceType;
            $$.getMemberInfo(opt.prodCode, false);
          }
        }
      );
    },

    /*
     * 레이어 닫기
     */
    closeLayer: function () {},
  };

  var dWL = (deleteProductToWishList = function (
    selector,
    wishCode,
    prodCode,
    cate_c1,
    cate_c2
  ) {
    var selectors = {
      clickButton: null,
    };

    var options = {
      memberId: null,
      prodCode: null,
      wishCode: null,
      serviceType: 0,
      serviceTypName: "관심상품",
      estimateYN: "N",
      cate_c1: cate_c1,
      cate_c2: cate_c2,
    };

    options.prodCode = prodCode;
    options.wishCode = wishCode;
    selectors.clickButton = selector;

    // 협력사 상품인 경우 예외 처리 ex)업체코드^업체상품코드
    var productCodeStr = options.prodCode;
    if (typeof options.prodCode === "number") {
      productCodeStr = options.prodCode.toString();
    }
    if (productCodeStr.includes("^")) {
      const prodInfo = productCodeStr.split("^");
      options.shopId = prodInfo[0];
      options.linkProdCode = prodInfo[1];
      options.prodCode = 0;
      options.cate_c1 = 0;
      options.cate_c2 = 0;
    }

    this.sel = selectors;
    this.opt = options;

    this.init();
  });

  dWL.prototype = {
    init: function () {
      this.doWishProductDelete();
    },

    doWishProductDelete: function () {
      var sel = this.sel;
      var opt = this.opt;
      var $$ = this;

      $.ajax({
        type: "post",
        url: getWishHost() + "/globalData/wishList/getWishListInfo.ajax.php",
        data: {
          prodCode: opt.prodCode,
          wishCode: opt.wishCode,
          shopId: opt.shopId,
          linkProdCode: opt.linkProdCode,
          type: "delInfo",
          serviceType: opt.serviceType,
        },
        crossDomain: true,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        xhrFields: {
          withCredentials: true,
        },
        success: function (data) {
          var resultArr = $.parseJSON(data);
          if (resultArr.status == "N") {
            var sAlert =
              "시스템 점검으로 " +
              resultArr.startDate +
              "부터 " +
              resultArr.endDate;
            sAlert += "까지 서비스 이용이 제한됩니다. 조금만 기다려 주세요.";
            alert(sAlert);
            return false;
          } else {
            $$.displayWishProductDelete(resultArr);
          }
        },
      });
    },

    displayWishProductDelete: function (resultArr) {
      var sel = this.sel;

      if (resultArr.sDeleteSuccess == "wish_del_success") {
        if (
          sel.clickButton.hasClass("btn_interest") &&
          sel.clickButton.hasClass("on")
        ) {
          sel.clickButton.removeClass("on");
        } else if (sel.clickButton.closest(".item.interest").hasClass("on")) {
          sel.clickButton.closest(".item.interest").removeClass("on");
        } else if (sel.clickButton.hasClass("btn_int")) {
          sel.clickButton.removeClass("on");
          sel.clickButton.attr("data-key", "");
          sel.clickButton.removeData("key");
        } else if (sel.clickButton.hasClass("btn_zzim--select")) {
          sel.clickButton.removeClass("btn_zzim--select");
          sel.clickButton.attr("data-key", "");
          sel.clickButton.removeData("key");
          sel.clickButton.find("span.blind").html("찜하기");
        } else if (
          sel.clickButton.hasClass("click_wish_prod") &&
          sel.clickButton.hasClass("on")
        ) {
          sel.clickButton.removeClass("on");
        } else if (
          sel.clickButton.hasClass("click_wish_companyProd") &&
          sel.clickButton.hasClass("on")
        ) {
          sel.clickButton.removeClass("on");
        }
      }
    },
  };

  $.danawaAddProductToWishList = function (
    selector,
    prodCode,
    servicePage,
    cate_c1,
    cate_c2,
    price
  ) {
    new addProductToWishList(
      $(selector),
      prodCode,
      servicePage,
      cate_c1,
      cate_c2,
      price
    );
  };

  $.fn.danawaAddProductToWishList = function (
    prodCode,
    servicePage,
    cate_c1,
    cate_c2,
    price
  ) {
    new addProductToWishList(
      this,
      prodCode,
      servicePage,
      cate_c1,
      cate_c2,
      price
    );
  };

  $.danawaDeleteProductToWishList = function (
    selector,
    wishCode,
    prodCode,
    cate_c1,
    cate_c2
  ) {
    new deleteProductToWishList(
      $(selector),
      wishCode,
      prodCode,
      cate_c1,
      cate_c2
    );
  };

  $.fn.danawaDeleteProductToWishList = function (
    wishCode,
    prodCode,
    cate_c1,
    cate_c2
  ) {
    new deleteProductToWishList(this, wishCode, prodCode, cate_c1, cate_c2);
  };

  $(document).ready(function () {
    $(document).delegate(".save_wishList", "click", function (event) {
      event.preventDefault();
    });

    // 상품리스트에서 닫기시 삭제
    $(document).delegate("#wishCloseBtn", "click", function (event) {
      event.preventDefault();

      $(this)
        .parents(".inte_folder_layer")
        .parent()
        .find(".save_wishList ")
        .removeClass("opt_checked_on");
      $(this).parents(".inte_folder_layer").remove();
    });

    // 모바일 기획전 닫기
    $(document).delegate(
      "#wishLayerCloseBtn, #dimmLayer",
      "click",
      function (event) {
        event.preventDefault();

        $(".aside.aside__bottom").removeClass("aside--open");
        $(".aside.aside__bottom").html("");
        $("#dimmLayer").hide();
      }
    );

    // 레이어 이외 영역 클릭시 닫기
    $(document).on("click", function (event) {
      if ($(event.target).hasClass("layer-save")) {
        $(event.target).remove();
      } else if (
        $(event.target).hasClass("layer-save__btn") &&
        $(event.target).closest(".layer-save").length > 0
      ) {
        $(event.target).closest(".layer-save").remove();
      } else if ($(event.target).closest(".inte_folder_layer").length > 0) {
        return;
      } else {
        $(".inte_folder_layer").remove();
      }
    });
    // 로그인 후 클릭한 상품 관심상품에 저장
    if (
      sessionStorage.getItem("tempWishOtion") &&
      parseInt($("#memberSeq").val()) > 0
    ) {
      var tempWishOtion = JSON.parse(sessionStorage.getItem("tempWishOtion"));

      $.ajax({
        type: "post",
        url: getWishHost() + "/globalData/wishList/getWishListInfo.ajax.php",
        data: {
          prodCode: tempWishOtion.prodCode,
          type: "saveAfterLogin",
          serviceType: tempWishOtion.serviceType,
          price: tempWishOtion.price,
          linkProdCode: tempWishOtion.linkProdCode,
          shopId: tempWishOtion.shopId,
        },
        crossDomain: true,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        xhrFields: {
          withCredentials: true,
        },
        success: function (data) {
          var resultArr = $.parseJSON(data);
          if (resultArr.status == "N") {
            var sAlert =
              "시스템 점검으로 " +
              resultArr.startDate +
              "부터 " +
              resultArr.endDate;
            sAlert += "까지 서비스 이용이 제한됩니다. 조금만 기다려 주세요.";
            alert(sAlert);
            return false;
          } else {
            if (resultArr.sSaveSuccess == "wish_full") {
              alert("저장폴더당 관심상품 저장 개수는 최대 100개입니다.");
            } else if (resultArr.sSaveSuccess == "wish_failed") {
              alert(
                "죄송합니다. 관심상품 저장에 실패하였습니다.\n다시 한 번 저장해 주십시오."
              );
            } else if (resultArr.sSaveSuccess == "wish_success") {
              var tempWishOtionList = tempWishOtion.prodCode
                .toString()
                .split("|");

              for (const key in tempWishOtionList) {
                var prodCode = tempWishOtionList[key];
                // 아이콘 활성화
                // 상품블로그
                if ($(`[data-productcode="${prodCode}"]`).length > 0) {
                  $(`[data-productcode="${prodCode}"]`).addClass("on");
                }

                // [비동기] 연관상품
                if ($("#relationProductListArea").length > 0) {
                  let observer = new MutationObserver((mutations) => {
                    if ($(`[code="${prodCode}"]`).length > 0) {
                      $(`[code="${prodCode}"]`).addClass("on");
                    }
                  });
                  observer.observe($("#relationProductListArea")[0], {
                    attributes: true,
                    childList: true,
                    characterData: true,
                  });
                }

                // 상품리스트 , 통합검색
                if ($(`[code="${prodCode}"]`).length > 0) {
                  $(`[code="${prodCode}"]`).addClass("on");
                }

                // 상품비교 영역
                if (
                  $(`.btn_interest[data-prod-code="${prodCode}"]`).length > 0
                ) {
                  $(`.btn_interest[data-prod-code="${prodCode}"]`).addClass(
                    "active"
                  );
                }

                // 기획전
                if ($(`.btn_int[data-productcode="${prodCode}"]`).length > 0) {
                  $(`.btn_int[data-productcode="${prodCode}"]`).addClass("on");
                }

                // VS검색
                if (
                  $(`.button__wish[data-prod-code="${prodCode}"]`).length > 0
                ) {
                  $(`.button__wish[data-prod-code="${prodCode}"]`).addClass(
                    "on"
                  );
                }

                var wishCount = parseInt(
                  $(".btn_user.btn_user--wish .badge").text()
                );
                if (wishCount <= 100) {
                  // 100 까지만 허용
                  $(".btn_user.btn_user--wish .badge").text(
                    parseInt($(".btn_user.btn_user--wish .badge").text()) + 1
                  );
                }
              }

              // 검색상품
              if (
                $(
                  `[code="${
                    tempWishOtion.shopId + "^" + tempWishOtion.linkProdCode
                  }"]`
                ).length > 0
              ) {
                $(
                  `[code="${
                    tempWishOtion.shopId + "^" + tempWishOtion.linkProdCode
                  }"]`
                ).addClass("on");
              }
            }
          }
          sessionStorage.removeItem("tempWishOtion");
        },
      });
    }
  });
})(jQuery);

function dnwLoggingApplicationClient(prodCode, memberCode) {
  var prodCodes = prodCode
    ? prodCode
        .toString()
        .split("|")
        .filter(function (code) {
          return code;
        })
    : [];
  var requestParams = {
    uxid: "P21004",
    parameter: {
      products: [],
      memberCode: parseInt(memberCode) || undefined,
    },
  };

  prodCodes.forEach(function (code) {
    if ($("#min_price_" + code).length) {
      var minPrice = $("#min_price_" + code).val() || "";
      if (minPrice) {
        requestParams.parameter.products.push({
          pcode: parseInt(code) || 0,
          minPrice: parseInt(minPrice.replace(/,/g, "")) || 0,
        });
      }
    }
  });

  if (
    typeof DSAC === "object" &&
    DSAC !== null &&
    requestParams.parameter.products.length > 0
  ) {
    DSAC.execute(JSON.stringify(requestParams));
  }
}
function getWishHost() {
  var host = location.host;
  if (
    location.host.indexOf("dpg") > -1 ||
    location.host.indexOf("shoppingguide") > -1
  ) {
    host = "www.danawa.com";
    if (
      location.host.indexOf("-local") > -1 ||
      location.host.indexOf("-t") > -1
    ) {
      host = "www-t.danawa.com";
    }
  }
  return location.protocol + "//" + host;
}
