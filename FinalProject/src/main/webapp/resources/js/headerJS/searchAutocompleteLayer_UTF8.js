(function ($) {
    // í†µí•©ë©”ì¸ ì—¬ë¶€
    var isMain = /^(www|)+(-local|-t|-s)?(-branch)?(\.|)danawa/.test(location.hostname);

    // ìžë™ì™„ì„± í‚¤ì›Œë“œ ì „ì—­ë³€ìˆ˜ ìºì‹œ
    var ack_cache = {};
    // ì¶”ì²œ ì¹´í…Œê³ ë¦¬ ì „ì—­ë³€ìˆ˜ ìºì‹œ
    var acc_cache = {};

    //ì´ì „í‚¤ í™•ì¸ìš© ë³€ìˆ˜
    var checkLastKeyPress = null;

    //ìžë™ì™„ì„± ê¸°ëŠ¥ ìœ ì§€ë¥¼ ìœ„í•´ ì‚¬ìš©ì—¬ë¶€ë¥¼ ì¿ í‚¤ì— ì €ìž¥
    var isUsingAKCByCookie = $.cookie('isUsingAKCService');
    if (isUsingAKCByCookie === 'N') {
        isUsingAKCByCookie = false;
    } else {
        isUsingAKCByCookie = true;
    }

    var debounce = function (callback, wait) {
        var timeout;

        return function () {
            var _this = this;

            for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
                args[_key] = arguments[_key];
            }

            clearTimeout(timeout);
            timeout = setTimeout(function () {
                callback.apply(_this, args);
            }, wait);
        };
    };

    var Fn = (autocomplete = function (el, opt) {
        var options = {
            isUsingAKCService: isUsingAKCByCookie, // ìžë™ì™„ì„± ì„œë¹„ìŠ¤ ì‚¬ìš© ìœ ë¬´.
            isDisplayAKCService: false, // ìžë™ì™„ì„± ì„œë¹„ìŠ¤ display ìœ ë¬´
            isMyKeywordService: false, // ìµœê·¼ ê²€ìƒ‰ì–´ ë ˆì´ì–´ ì‚¬ìš© ì—¬ë¶€
            isAKCArea: false, // ë§ˆìš°ìŠ¤ ì»¤ì„œ ìœ„ì¹˜ê°€ ìžë™ì™„ì„± ì˜ì—­ì¸ì§€.
            akcSourceKeyword: '', // ìž…ë ¥ í‚¤ì›Œë“œ.
            transformAKCSourceKeyword: '', // ìžë™ì™„ì„± ë³€í™˜ í‚¤ì›Œë“œ.
            akcListCurrentLine: 0, // ìžë™ì™„ì„± ë¦¬ìŠ¤íŠ¸ ë¼ì¸ ìœ„ì¹˜
            akcListTotalLine: 0, // ìžë™ì™„ì„± ë¦¬ìŠ¤íŠ¸ ì´ ë¼ì¸ ìˆ˜
            myKeywordCurrentLine: 0, // ìµœê·¼ ê²€ìƒ‰ì–´ ë¦¬ìŠ¤íŠ¸ ë¼ì¸ ìœ„ì¹˜
            myKeywordTotalLine: 0, // ìµœê·¼ ê²€ìƒ‰ì–´ ë¦¬ìŠ¤íŠ¸ ì´ ë¼ì¸ ìˆ˜
            akcServiceType: '', // ìžë™ì™„ì„± ì„œë¹„ìŠ¤ íƒ€ìž… êµ¬ë¶„ : í†µí•©ê²€ìƒ‰ / ë©”ì¸ ë° ì„¹ì…˜.
            akcLinkDomain: '', // ìžë™ì™„ì„± ìš”ì²­ ë„ë©”ì¸
            akcLinkPathname: '', // ìžë™ì™„ì„± ë§í¬ path
            akcLinkUrl: '', // ìžë™ì™„ì„± ë§í¬ ì£¼ì†Œ
            staticUrl: '',
            searchUrl: '',
            gnbCode: 0, // GNB code
            siteCode: 0, // SITE code
            isAkcListTimeout: false,
            recommendCategoryCount: 0, //ì¶”ì²œì¹´í…Œê³ ë¦¬ ê°¯ìˆ˜
            recommendCategoryCurrentLine: 0, //ì¶”ì²œì¹´í…Œê³ ë¦¬ ë¦¬ìŠ¤íŠ¸ ë¼ì¸ ìœ„ì¹˜
            recommendCategoryHtml: '', //ì¶”ì²œì¹´í…Œê³ ë¦¬ HTML
            recommendCategoryStringLength: 0 //ì‚¬ì´íŠ¸ë³„ ì¶”ì²œì¹´í…Œê³ ë¦¬ ë¬¸ìžì—´ ê°€ëŠ¥ ê¸¸ì´(í†µí•©ë©”ì¸,ìž¥í„°,ê·¸ì´ì™¸)
        };

        var selectors = {
            akcSearchForm: null, // ê²€ìƒ‰í¼
            akcFieldSet: null, // ê²€ìƒ‰í¼ > í•„ë“œì…‹
            akcContentWrap: null, // ìžë™ì™„ì„± ì „ì²´ ê°ì‹¸ëŠ” Element(Layer or Iframe),
            akcKeywordInput: null,
            akcKeywordLayer: null,
            akcLayerContent: null, // ê²€ìƒ‰ì„œë²„ì˜ ìžë™ì™„ì„± ë°ì´íƒ€ ë””ìŠ¤í”Œë ˆì´ ë ˆì´ì–´
            serviceCtrlLayer: null, // "ê¸°ëŠ¥ë„ê¸°" ë²„íŠ¼ ë ˆì´ì–´
            recomCateLayer: null,
            akcGoodsLayer: null, // ìžë™ì™„ì„± ìƒí’ˆ ì¶œë ¥ ë ˆì´ì–´
            akcArrowLayer: null,
            iframe: null, // backgroundìš© iframe
            searchKeywordLayer: null
        };

        this.arrowOpenClose = {
            className: {
                0: 'auto_arrow_top',
                1: 'auto_arrow_top',
                2: 'auto_arrow_top',
                3: 'auto_arrow_top',
                4: 'auto_arrow_top',
                5: 'auto_arrow_top',
                6: 'auto_arrow_top'
            },
            imageUp: {
                0: '//img.danawa.com/new/newmain/img/btn_auto_up.gif',
                1: '//img.danawa.com/new/newmain/img/btn_auto_up.gif',
                2: '//img.danawa.com/new/newmain/img/btn_auto_up.gif',
                3: '//img.danawa.com/new/newmain/img/btn_auto_up.gif',
                4: '//img.danawa.com/new/newmain/img/btn_auto_up.gif',
                5: '//img.danawa.com/new/newmain/img/btn_auto_up.gif',
                6: '//img.danawa.com/new/newmain/img/btn_auto_up.gif'
            },
            imageDown: {
                0: '//img.danawa.com/new/newmain/img/btn_auto_down.gif',
                1: '//img.danawa.com/new/newmain/img/btn_auto_down.gif',
                2: '//img.danawa.com/new/newmain/img/btn_auto_down.gif',
                3: '//img.danawa.com/new/newmain/img/btn_auto_down.gif',
                4: '//img.danawa.com/new/newmain/img/btn_auto_down.gif',
                5: '//img.danawa.com/new/newmain/img/btn_auto_down.gif',
                6: '//img.danawa.com/new/newmain/img/btn_auto_down.gif'
            }
        };

        selectors.akcSearchForm = el;
        selectors.akcFieldSet = $('>FIELDSET', el);
        selectors.akcKeywordInput = $('input#AKCSearch', selectors.akcFieldSet);
        selectors.akcArrowLayer = $('span.auto_arrow_top', selectors.akcFieldSet);

        this.opt = $.extend(options, opt || {});
        this.sel = selectors;

        this.init();
    });

    Fn.prototype = {
        empty: function () {},

        init: function () {
            var $$ = this;
            var sel = this.sel;
            var opt = this.opt;

            BrowserDetect.init();

            // ê´‘ê³  í‚¤ì›Œë“œ ì—¬ë¶€
            var bAdKeyword = false;

            var searchUrl = '//search.danawa.com';
            var isBranch = location.hostname.indexOf('-branch') > -1;
            if (location.hostname.indexOf('-local') > -1) {
                searchUrl = '//search-local.danawa.com';
            } else if (location.hostname.indexOf('-t') > -1) {
                searchUrl = isBranch ? '//search-t-branch.danawa.com' : '//search-t.danawa.com';
            } else if (location.hostname.indexOf('-s') > -1) {
                searchUrl = '//search-s.danawa.com';
            }
            opt.searchUrl = searchUrl;

            $(function () {
                $(this).on('keydown', function (event) {
                    $$.searchEventkeyHandler(event);
                });

                // ê²€ìƒ‰ì°½ ì˜ì—­ ì™¸ì— í´ë¦­ì‹œ ìžë™ì™„ì„± ì˜ì—­ ë‹«ê¸°
                $(document).on('mouseup', function (event) {
                    if (
                        !$('.search .search__box').has(event.target).length &&
                        !$('.auto_complete_area').has(event.target).length
                    ) {
                        $$.akcDisplayControl(0);
                    }
                });
            });

            this.akcLayerCreateLayer();

            // adv_srch_obj : ê´‘ê³  í‚¤ì›Œë“œ
            if (typeof adv_srch_obj === 'string' && !sel.akcKeywordInput.is(':focus')) {
                bAdKeyword = true;
                sel.akcKeywordInput.val(adv_srch_obj);
            }

            sel.akcKeywordInput
                .on('focus click', function () {
                    if (bAdKeyword) {
                        $(this).val('');

                        $('#srchFRM_TOP').attr('action', opt.searchUrl + '/dsearch.php');

                        $(this).removeClass('search_ad');
                    }

                    bAdKeyword = false;

                    $('.search .search__box').addClass('box--focused');
                })
                .on('blur', function () {
                    $('.search .search__box').removeClass('box--focused');
                });

            // ê²€ìƒ‰ ë§í¬
            opt.akcLinkDomain = '//' + location.host;
            if (location.host.indexOf('localhost') > -1) {
                opt.akcServiceType = 'local';
                opt.akcLinkPathname = '/search/dsearch.php';
                opt.akcLinkUrl = `${opt.akcLinkDomain + opt.akcLinkPathname}?query=`;
            } else if (location.host.indexOf('search') > -1) {
                opt.akcServiceType = 'search';
                opt.akcLinkPathname = '/dsearch.php';
                opt.akcLinkUrl = `${opt.akcLinkDomain + opt.akcLinkPathname}?query=`;
            } else if (location.host.indexOf('dmall') > -1) {
                opt.akcServiceType = 'mall';
                opt.akcLinkPathname = '/sale/saleSearchListTotal.php';
                opt.akcLinkUrl = `${opt.akcLinkDomain + opt.akcLinkPathname}?sMarkKetOptFeild=prodN&nLocaleC1=0&k1=`;
            } else if (location.host.indexOf('market') > -1) {
                opt.akcServiceType = 'mall';
                opt.akcLinkDomain = '//dmall.danawa.com';
                opt.akcLinkPathname = '/sale/saleSearchListTotal.php';
                opt.akcLinkUrl = `${opt.akcLinkDomain + opt.akcLinkPathname}?sMarkKetOptFeild=prodN&nLocaleC1=0&k1=`;
            } else if (location.host.indexOf('-local') > -1 || location.host.indexOf('-t') > -1) {
                if (location.host.indexOf('-local') > -1) {
                    opt.akcLinkDomain = '//search-local.danawa.com';
                } else {
                    opt.akcLinkDomain = '//search-t.danawa.com';
                }

                opt.akcServiceType = 'section';
                opt.akcLinkPathname = '/dsearch.php';
                opt.akcLinkUrl = opt.akcLinkDomain + opt.akcLinkPathname + '?k1=';

                if (bAdKeyword) {
                    opt.akcLinkDomain =
                        typeof adv_srch_url === 'string' ? adv_srch_url.replace('http://', 'https://') : '';
                    opt.akcLinkPathname = '';
                }
            } else if (location.host.indexOf('-s') > -1) {
                opt.akcServiceType = 'section';
                opt.akcLinkDomain = '//search-s.danawa.com';
                opt.akcLinkPathname = '/dsearch.php';
                opt.akcLinkUrl = opt.akcLinkDomain + opt.akcLinkPathname + '?k1=';

                if (bAdKeyword) {
                    opt.akcLinkDomain =
                        typeof adv_srch_url === 'string' ? adv_srch_url.replace('http://', 'https://') : '';
                    opt.akcLinkPathname = '';
                }
            } else {
                opt.akcServiceType = 'section';
                opt.akcLinkDomain = '//search.danawa.com';
                opt.akcLinkPathname = '/dsearch.php';
                opt.akcLinkUrl = opt.akcLinkDomain + opt.akcLinkPathname + '?k1=';

                if (bAdKeyword) {
                    opt.akcLinkDomain =
                        typeof adv_srch_url === 'string' ? adv_srch_url.replace('http://', 'https://') : '';
                    opt.akcLinkPathname = '';
                }
            }

            opt.staticUrl = '//static.danawa.com';
            if (location.hostname.indexOf('-local') > -1) {
                opt.staticUrl = '//static-local.danawa.com';
            } else if (location.hostname.indexOf('-t') > -1) {
                opt.staticUrl = '//static-t.danawa.com';
            } else if (location.hostname.indexOf('-s') > -1) {
                opt.staticUrl = '//static-s.danawa.com';
            }

            // submit check
            $(sel.akcSearchForm)
                .attr({
                    method: 'GET',
                    action: opt.akcLinkDomain + opt.akcLinkPathname
                })
                .on('submit', function () {
                    var isKeywordValid = $$.checkKeywordValidation();
                    if (!isKeywordValid) {
                        alert('2ìž ì´ìƒ í‚¤ì›Œë“œë¥¼ ìž…ë ¥í•˜ì„¸ìš”.');
                        sel.akcKeywordInput.blur();
                        return false;
                    } else {
                        if (opt.gnbCode == 6 || opt.gnbCode == 7) {
                            return $$.doSearch();
                        } else {
                            return $$.doSubmit();
                        }
                    }
                });

            // ìžë™ì™„ì„± ë‹«ê¸°/ì—´ê¸°
            opt.arrowImg1 = '<a href="#"><span class="btn_auto_open">ìžë™ì™„ì„± ë‹«ê¸°</span></a>';
            opt.arrowImg2 = '<a href="#"><span class="btn_auto_close">ìžë™ì™„ì„± ì—´ê¸°</span></a>';

            $(sel.akcArrowLayer)
                .addClass($$.arrowOpenClose.className[opt.gnbCode])
                .toggle(
                    function () {
                        $$.akcDisplayControl(1);
                    },
                    function () {
                        $$.akcDisplayControl(0);
                    }
                )
                .show();

            // ê²°ê³¼ë‚´ ê²€ìƒ‰ ì²´í¬ ì—¬ë¶€
            $(':checkbox#result_search').on('click', function () {
                var beforeKeyword = ($('input#beforeKeyword').val() || '').trim();

                if ($(this).attr('checked')) {
                    sel.akcKeywordInput.val('').focus();
                } else {
                    sel.akcKeywordInput.val(beforeKeyword).focus();
                }
            });

            var keyEvent = 'keyup';
            if (BrowserDetect.browser === 'Opera') {
                keyEvent = 'keypress';
            } else if (BrowserDetect.browser === 'Explorer') {
                keyEvent = 'keydown';
            }

            sel.akcKeywordInput
                .attr('autocomplete', 'off')
                .on('mousedown', function () {
                    $$.AKCOpenClose();

                    $$.trkEventLog(isMain ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ë°°ë„ˆë…¸ì¶œ' : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ë°°ë„ˆë…¸ì¶œ');
                })
                .on(keyEvent, function (event) {
                    $$.akcKeyEventAction(event);
                })
                .on('blur', function () {
                    $$.AKCFocusOut();
                });

            //íŒŒí­ í•œê¸€ ìž…ë ¥ ì´ë²¤íŠ¸ ë™ìž‘í•˜ì§€ ì•Šì•„ ë°˜ë³µíŠ¸ë¦¬ê±° ì²˜ë¦¬ - í‚¤ì›Œë“œê°€ ê°™ì„ë•ŒëŠ” í˜¸ì¶œí•˜ì§€ ì•ŠìŒ
            if (BrowserDetect.browser === 'Firefox') {
                setInterval(function () {
                    if (opt.akcSourceKeyword !== sel.akcKeywordInput.val()) {
                        opt.akcSourceKeyword = sel.akcKeywordInput.val();
                        sel.akcKeywordInput.filter('[value!=""]:focus').trigger('keyup');
                    }
                }, 1000);
            }
        },

        // ì¼ë°˜ì ì¸ search.danawa.comì˜ submit
        doSubmit: function () {
            var sel = this.sel;

            var inputKeyword = (sel.akcKeywordInput.val() || '').trim();

            // ìžë™ì™„ì„± ë°”ë¡œê°€ê¸°ì¸ ê²½ìš° ì˜ˆì™¸
            if ($('#akcSearchResult_0').length && $('#akcSearchResult_0').is('.shortcut_url.hover')) {
                return false;
            } else if (inputKeyword === '') {
                alert('ê²€ìƒ‰ì–´ë¥¼ ìž…ë ¥í•´ ì£¼ì„¸ìš”.');

                sel.akcKeywordInput.val('').focus();

                return false;
            }
            return true;
        },

        // search.danawa.comì˜ submit
        doSearch: function () {
            var sel = this.sel;

            var inputKeyword = (sel.akcKeywordInput.val() || '').trim();

            // ìžë™ì™„ì„± ë°”ë¡œê°€ê¸°ì¸ ê²½ìš° ì˜ˆì™¸
            if ($('#akcSearchResult_0').length && $('#akcSearchResult_0').is('.shortcut_url.hover')) {
                return false;
            } else if (inputKeyword === '') {
                alert('ê²€ìƒ‰ì–´ë¥¼ ìž…ë ¥í•´ ì£¼ì„¸ìš”.');

                sel.akcKeywordInput.val('').focus();

                return false;
            } else {
                var tab = $('#tab').val();
                // íƒ­ ì„ íƒì— ë”°ë¥¸ ì•¡ì…˜ ì„ íƒ
                if (($('#tab', sel.akcSearchForm).val() || '').trim() === '' || tab !== 'tour') {
                    $('#tab', sel.akcSearchForm).val('main');
                }

                // ê¸°ë³¸ ê²€ìƒ‰ì¼ ê²½ìš° ì˜µì…˜ ë¶€ë¶„ ê°’ ì‚­ì œ
                if ($('#isOptionSearch', sel.akcSearchForm).val() !== 'Y') {
                    if (tab === 'tour') {
                        //ì—¬í–‰íƒ­ ê²°ê³¼ë‚´ ê²€ìƒ‰ì‹œ ì´ì „ íŒŒë¼ë¯¸í„° ìœ ì§€
                        // ê²°ê³¼ë‚´ ê²€ìƒ‰
                        if ($(':checkbox#result_search').attr('checked')) {
                            $('input#addSearchKeyword').val(inputKeyword);
                            sel.akcKeywordInput.val($('input#beforeKeyword').val() + ' ' + inputKeyword);
                        } else {
                            $(
                                '#list, #cate_c1, #cate_c2, #cate_c3, #cate_c4, #cate_c5, #minPrice, #maxPrice, #sort, #result_search, #beforeKeyword, #partnerId, #volumeType',
                                sel.akcSearchForm
                            ).attr('disabled', true);
                        }
                    } else {
                        $(
                            '#list, #cate_c1, #cate_c2, #cate_c3, #cate_c4, #cate_c5, #minPrice, #maxPrice, #sort, #result_search, #beforeKeyword, #partnerId, #volumeType',
                            sel.akcSearchForm
                        ).attr('disabled', true);
                        // ê²°ê³¼ë‚´ ê²€ìƒ‰
                        if ($(':checkbox#result_search').attr('checked')) {
                            $('input#addSearchKeyword').val(inputKeyword);
                            sel.akcKeywordInput.val($('input#beforeKeyword').val() + ' ' + inputKeyword);
                        }
                    }
                } else {
                    $('#isOptionSearch', sel.akcSearchForm).val('');
                }
                return true;
            }
        },

        checkKeywordValidation: function () {
            var sel = this.sel;

            var inputKeyword = (sel.akcKeywordInput.val() || '').trim();
            var keywordLength = inputKeyword.length;

            if (keywordLength < 2) {
                if (keywordLength === 0) {
                    return true;
                } else {
                    var firstChar = inputKeyword.charAt(0);
                    if (firstChar < 'ê°€' || firstChar > 'íž£') {
                        return false;
                    } else {
                        return true;
                    }
                }
            } else {
                return true;
            }
        },

        // ìžë™ì™„ì„± ì°½ ìƒì„±(Layer)
        akcLayerCreateLayer: function () {
            var $$ = this;
            var opt = this.opt;
            var sel = this.sel;

            var postionObj = $('>DIV:first', sel.akcFieldSet);

            var w = 0;
            var l = 0;
            var t = postionObj.height() + 20;
            var bottomWidth = 580;
            var recomWidth = 0;

            if (opt.gnbCode == 4) {
                // ìž¥í„°
                w = sel.akcKeywordInput.width() + 39;
                t = postionObj.height() + 25;
                l = 150;
                recomWidth = bottomWidth - 85;
            } else if (opt.gnbCode == 0) {
                //í†µí•©ë©”ì¸
                w = postionObj.width() - 79;
                t = postionObj.height() + 53;
                l = 20;
                recomWidth = bottomWidth + 52;
            } else if (opt.gnbCode == 7) {
                // í†µí•©ê²€ìƒ‰ ê°œíŽ¸
                w = postionObj.width() - 22;
                t = postionObj.height() + 14;
                l = 18;
                recomWidth = bottomWidth + 52;
            } else {
                w = postionObj.width() - 58;
                l = 15;
                recomWidth = bottomWidth;
            }

            var akcContentWrap = document.createElement('DIV'); // ìžë™ì™„ì„± ì „ì²´ ê°ì‹¸ëŠ” ë ˆì´ì–´
            var akcKeywordLayer = document.createElement('DIV'); // ìžë™ì™„ì„± í‚¤ì›Œë“œ ë¦¬ìŠ¤íŠ¸ ê°ì‹¸ëŠ” ë ˆì´ì–´ (akcLayerContent + serviceCtrlLayer)
            var akcLayerContent = document.createElement('UL'); // ìžë™ì™„ì„± í‚¤ì›Œë“œ ë ˆì´ì–´
            var serviceCtrlLayer = document.createElement('DIV');
            var searchKeywordLayer = document.createElement('DIV'); // ìµœê·¼ ê²€ìƒ‰ì–´ ë ˆì´ì–´
            var akcGoodsLayer = document.createElement('DIV'); // ìžë™ì™„ì„± ìƒí’ˆ ì¶œë ¥ ë ˆì´ì–´
            var recomCateLayer = document.createElement('DIV'); // ì¶”ì²œì¹´í…Œê³ ë¦¬ ì¶œë ¥ ë ˆì´ì–´

            $(serviceCtrlLayer)
                .attr('id', 'switch_autocomplete')
                .addClass('func_opt')
                .append(
                    '<a href="" class="com_gnb keyword_all_delete" ' +
                        (opt.isUsingAKCService ? '' : 'style="display: none;"') +
                        '>ì „ì²´ ì‚­ì œ</a>'
                )
                .append(
                    '<a href="" id="function_switch_keyword" class="com_gnb auto_function_switch">' +
                        (opt.isUsingAKCService ? 'ìžë™ì™„ì„± ë„ê¸°' : 'ê¸°ëŠ¥ì¼œê¸°') +
                        '</a>'
                )
                .on('click', '.keyword_all_delete, .auto_function_switch', function (event) {
                    event.preventDefault();

                    if (this.classList.contains('keyword_all_delete')) {
                        $$.setCookieMySearchKeyword(null);
                    } else if (this.classList.contains('auto_function_switch')) {
                        $$.akcServiceControl();
                    }
                });

            // ìµœê·¼ ê²€ìƒ‰ì–´ ì¶œë ¥
            $(searchKeywordLayer).attr('id', 'mySearchKeywordBlockArea').hide();

            // ìžë™ì™„ì„± í‚¤ì›Œë“œ ë¶€ë¶„ ê°ì‹¸ê¸°
            $(akcKeywordLayer)
                .attr('id', 'akcLayer')
                .addClass('auto_word_list')
                .append($(akcLayerContent))
                .append($(searchKeywordLayer))
                .append($(serviceCtrlLayer));

            // ìžë™ì™„ì„± ìƒí’ˆ
            $(akcGoodsLayer).addClass('auto_product_list').append(`
                <ul id="auto_goods_list" class="auto_goods_list" style="display: none;"></ul>
                <ul id="auto_banner_layer" class="goods_banner">
                    <li>
                        <iframe 
                            width="300" 
                            height="250"
                            marginheight="0" 
                            marginwidth="0"
                            title="ìžë™ì™„ì„± ê´‘ê³ ì˜ì—­" 
                            scrolling="no" 
                            frameborder="0" 
                            src="//ad.danawa.com/RealMedia/ads/adstream_sx.ads/www.danawa.com/main@Top1"
                        ></iframe>
                    </li>
                </ul>
            `);

            // ìžë™ì™„ì„± ì „ì²´ ê°ì‹¸ê¸°
            $(akcContentWrap)
                .attr({ id: 'auto_area2', class: 'auto_complete_area' })
                .append($(akcKeywordLayer))
                .append($(akcGoodsLayer))
                .append($(recomCateLayer))
                .on('mouseenter mouseleave', function (event) {
                    if (event.type === 'mouseenter') {
                        opt.isAKCArea = true;
                    } else if (event.type === 'mouseleave') {
                        opt.isAKCArea = false;
                    }
                })
                .hide();

            $(sel.akcFieldSet).append(akcContentWrap);

            // ì „ì—­ë³€ìˆ˜ì— ë‹´ëŠ”ë‹¤.
            sel.akcContentWrap = akcContentWrap;
            sel.akcKeywordLayer = akcKeywordLayer;
            sel.akcLayerContent = akcLayerContent;
            sel.akcGoodsLayer = akcGoodsLayer;
            sel.serviceCtrlLayer = serviceCtrlLayer;
            sel.recomCateLayer = recomCateLayer;
            sel.searchKeywordLayer = searchKeywordLayer;
        },

        //ìžë™ì™„ì„± ìž…ë ¥ í‚¤ ì´ë²¤íŠ¸ ì²˜ë¦¬
        akcKeyEventAction: function (event) {
            var opt = this.opt;
            var sel = this.sel;
            var $$ = this;

            var akcItem = null;
            var insertKeyCode = event.keyCode;

            // esc key : close akc window
            if (insertKeyCode === 27) {
                opt.isAKCArea = false;
                $$.akcDisplayControl(0);
                return;
            }

            // akc ì°½ì´ ì—´ë ¤ìžˆì§€ ì•Šë‹¤ë©´  open
            if (!opt.isDisplayAKCService) {
                $$.akcDisplayControl(1);
            }

            // tab key : non action
            if (insertKeyCode === 9) {
                event.returnValue = false;
                return;
            }

            var tagRemovedKeyword = '';

            // key down : move down
            if (insertKeyCode === 40) {
                if (opt.isMyKeywordService) {
                    // ìµœê·¼ ê²€ìƒ‰ì–´
                    if (opt.myKeywordTotalLine > 0) {
                        //ì´ì „í‚¤ê°€ move upì¼ë•Œ ì²˜ë¦¬(ì•ˆí•˜ë©´ ë‘ë²ˆëˆŒëŸ¬ì•¼ í•˜ì´ë¼ì´íŠ¸ ì´ë™)
                        if (checkLastKeyPress === 2) {
                            ++opt.myKeywordCurrentLine;
                        }

                        if (opt.myKeywordCurrentLine > opt.myKeywordTotalLine) {
                            opt.myKeywordCurrentLine = 1;
                        }

                        akcItem = $('#mySearchKeywordListArea li').eq(opt.myKeywordCurrentLine - 1);

                        // ìµœê·¼ ê²€ìƒ‰ì–´ ê°œë³„ì‚­ì œë¥¼ í•  ìˆ˜ ìžˆê¸° ë•Œë¬¸ì— idë¡œ ì„ íƒí•˜ì§€ ë§ê³  eqë¡œ ë…¸ë“œë¥¼ ì„ íƒí•´ì•¼í•¨
                        $$.akcHighlight(akcItem, true);

                        // í‚¤ì›Œë“œ ìž…ë ¥
                        tagRemovedKeyword = $$.removeStrongTag(akcItem.attr('text'));

                        if (tagRemovedKeyword !== '') {
                            sel.akcKeywordInput.val(tagRemovedKeyword);
                        }

                        opt.myKeywordCurrentLine++;
                        checkLastKeyPress = 1;
                    }
                } else if (opt.isDisplayAKCService) {
                    // ìžë™ì™„ì„±
                    if (opt.akcListTotalLine > 0) {
                        //ì´ì „í‚¤ê°€ move upì¼ë•Œ ì²˜ë¦¬(ì•ˆí•˜ë©´ ë‘ë²ˆëˆŒëŸ¬ì•¼ í•˜ì´ë¼ì´íŠ¸ ì´ë™)
                        if (checkLastKeyPress === 2) {
                            ++opt.akcListCurrentLine;
                        }

                        if (opt.akcListCurrentLine > opt.akcListTotalLine) {
                            opt.akcListCurrentLine = 1;
                        }

                        akcItem = $('[id^="akcSearchResult_"]').eq(opt.akcListCurrentLine - 1);
                        opt.recommendCategoryCurrentLine = opt.akcListCurrentLine;

                        $$.akcHighlight(akcItem, true);

                        // í‚¤ì›Œë“œ ìž…ë ¥
                        if (akcItem.hasClass('recommandCategory')) {
                            tagRemovedKeyword = $$.removeStrongTag($('#akcSearchResult_1').attr('text'));
                        } else {
                            tagRemovedKeyword = $$.removeStrongTag(akcItem.attr('text'));
                        }

                        if (tagRemovedKeyword !== '') {
                            sel.akcKeywordInput.val(tagRemovedKeyword);
                        }

                        opt.akcListCurrentLine++;
                        $$.makeGoodsListData();
                        checkLastKeyPress = 1;
                    }
                }
            }
            // key up : move up
            else if (insertKeyCode === 38) {
                if (opt.isMyKeywordService) {
                    // ìµœê·¼ ê²€ìƒ‰ì–´
                    if (opt.myKeywordTotalLine > 0) {
                        //ì´ì „í‚¤ê°€ move downì¼ë•Œ ì²˜ë¦¬(ì•ˆí•˜ë©´ ë‘ë²ˆëˆŒëŸ¬ì•¼ í•˜ì´ë¼ì´íŠ¸ ì´ë™)
                        if (checkLastKeyPress === 1) {
                            --opt.myKeywordCurrentLine;
                        }
                        opt.myKeywordCurrentLine--;

                        if (opt.myKeywordCurrentLine < 1) {
                            opt.myKeywordCurrentLine = opt.myKeywordTotalLine;
                        }

                        akcItem = $('#mySearchKeywordListArea li').eq(opt.myKeywordCurrentLine - 1);

                        // ìµœê·¼ ê²€ìƒ‰ì–´ ê°œë³„ì‚­ì œë¥¼ í•  ìˆ˜ ìžˆê¸° ë•Œë¬¸ì— idë¡œ ì„ íƒí•˜ì§€ ë§ê³  eqë¡œ ë…¸ë“œë¥¼ ì„ íƒí•´ì•¼í•¨
                        $$.akcHighlight(akcItem, true);

                        // í‚¤ì›Œë“œ ìž…ë ¥
                        tagRemovedKeyword = $$.removeStrongTag(akcItem.attr('text'));

                        if (tagRemovedKeyword !== '') {
                            sel.akcKeywordInput.val(tagRemovedKeyword);
                        }

                        checkLastKeyPress = 2;
                    }
                } else if (opt.isDisplayAKCService) {
                    //ìžë™ì™„ì„±
                    if (opt.akcListTotalLine > 0) {
                        //ì´ì „í‚¤ê°€ move downì¼ë•Œ ì²˜ë¦¬(ì•ˆí•˜ë©´ ë‘ë²ˆëˆŒëŸ¬ì•¼ í•˜ì´ë¼ì´íŠ¸ ì´ë™)
                        if (checkLastKeyPress === 1) {
                            --opt.akcListCurrentLine;
                        }
                        opt.akcListCurrentLine--;

                        if (opt.akcListCurrentLine < 1) {
                            opt.akcListCurrentLine = opt.akcListTotalLine;
                        }

                        akcItem = $('[id^="akcSearchResult_"]').eq(opt.akcListCurrentLine - 1);
                        opt.recommendCategoryCurrentLine = opt.akcListCurrentLine;

                        $$.akcHighlight(akcItem, true);

                        // í‚¤ì›Œë“œ ìž…ë ¥
                        if (akcItem.hasClass('recommandCategory')) {
                            tagRemovedKeyword = $$.removeStrongTag($('#akcSearchResult_1').attr('text'));
                        } else {
                            tagRemovedKeyword = $$.removeStrongTag(akcItem.attr('text'));
                        }

                        if (tagRemovedKeyword !== '') {
                            sel.akcKeywordInput.val(tagRemovedKeyword);
                        }

                        $$.makeGoodsListData();
                        checkLastKeyPress = 2;
                    }
                }
            } else if (insertKeyCode === 13) {
                var recommendCategoryItem = $('[id^="akcSearchResult_"]').eq(opt.recommendCategoryCurrentLine - 1);
                var shortcutItem = $('[id^="akcSearchResult_0"]');
                var linkUrl = '';

                if (
                    // ì¶”ì²œì¹´í…Œê³ ë¦¬ ì´ë™
                    opt.recommendCategoryCount > 0 &&
                    recommendCategoryItem.is('.recommandCategory.hover')
                ) {
                    linkUrl = recommendCategoryItem.find('a').data('url') || '';

                    if (linkUrl) {
                        $$.doUxlogging('A0002-A-AB-0002', {
                            autoComplete: 'category',
                            memberCode: parseInt($('#memberSeq').val()) || undefined
                        });
                        $$.trkEventLog(
                            isMain ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ì¶”ì²œì¹´í…Œê³ ë¦¬' : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ì¶”ì²œì¹´í…Œê³ ë¦¬'
                        );

                        location.href = linkUrl;
                    }
                } else if (
                    // ë°”ë¡œê°€ê¸° ì´ë™
                    shortcutItem.is('.shortcut_url.hover')
                ) {
                    linkUrl = shortcutItem.find('a').data('url') || '';
                    var siteName = shortcutItem.find('.url_title').text();

                    if (linkUrl) {
                        $$.trkEventLog(
                            (isMain ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ë°”ë¡œê°€ê¸°_' : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ë°”ë¡œê°€ê¸°_') + siteName
                        );

                        location.href = linkUrl;
                    }
                }
            } else {
                // etc key input action
                opt.akcListCurrentLine = 0;
                opt.akcListTotalLine = 0;
                opt.recommendCategoryCurrentLine = 0;
                opt.recommendCategoryCount = 0;
                checkLastKeyPress = 0;

                $$.akcDisplayControl(1);
            }
        },

        // ìžë™ì™„ì„± ì°½ ì»¨íŠ¸ë¡¤ëŸ¬.
        // ìžë™ì™„ì„± ì°½ ë³´ì—¬ì£¼ê¸°/ë³´ì—¬ì£¼ì§€ ì•Šê¸°ì— ëŒ€í•œ ê¸°ëŠ¥ë§Œ ìˆ˜í–‰.
        // flag : ìžë™ì™„ì„± ì°½ ì œì–´ í”Œëž˜ê·¸. 1ì´ë©´ display, 0ì´ë©´ non display.
        akcDisplayControl: function (flag) {
            var sel = this.sel;
            var opt = this.opt;
            var $$ = this;

            if (flag) {
                opt.isDisplayAKCService = true;

                $$.akcArrowDisplay();
                $$.akcDataDisplay();
                $$.showIframe();

                var iframeBanner = $('#auto_banner_layer > li > iframe');
                if (iframeBanner.length && iframeBanner.attr('src') === 'about:blank') {
                    iframeBanner.attr('src', '//ad.danawa.com/RealMedia/ads/adstream_sx.ads/www.danawa.com/main@Top1');
                }

                $(sel.akcContentWrap).show();
            } else if (!flag && (!$('.search .search__box').hasClass('box--focused') || !opt.isUsingAKCService)) {
                opt.isDisplayAKCService = false;

                $$.hideIframe();

                $(sel.akcContentWrap).hide();

                $$.akcArrowDisplay();
            }
        },

        // ìžë™ì™„ì„± arrow ë²„íŠ¼ ì»¨íŠ¸ë¡¤ëŸ¬. arrow ì´ë¯¸ì§€ ë° ì´ë¯¸ì§€ í´ëž™ ì•¡ì…˜ ë³€ê²½ì— ëŒ€í•œ ê¸°ëŠ¥ë§Œ ìˆ˜í–‰.
        // isDisplayServiceê°€ trueì´ë©´ ìžë™ì™„ì„± ì°½ ë³´ì—¬ì£¼ì§€ ì•Šê¸°ì— ëŒ€í•œ ì•¡ì…˜ìœ¼ë¡œ ë³€ê²½, falseì´ë©´ ë³´ì—¬ì£¼ê¸° ì•¡ì…˜ìœ¼ë¡œ ë³€ê²½.
        akcArrowDisplay: function () {
            if (this.opt.isDisplayAKCService) {
                $(this.sel.akcArrowLayer).find('a span').attr('class', 'btn_auto_open').text('ìžë™ì™„ì„± ë‹«ê¸°');
            } else {
                $(this.sel.akcArrowLayer).find('a span').attr('class', 'btn_auto_close').text('ìžë™ì™„ì„± ì—´ê¸°');
            }
        },

        akcDataDisplay: function () {
            var opt = this.opt;
            var sel = this.sel;
            var $$ = this;

            // ìžë™ì™„ì„± ë° ìžë™ì™„ì„± ì•ˆë‚´ ë¬¸êµ¬ ì„ íƒ
            if (opt.isUsingAKCService) {
                // ìžë™ì™„ì„± í˜¸ì¶œ
                $$.makeAKCData();
            } else {
                // ìžë™ì™„ì„± ì•ˆë‚´ë¬¸êµ¬(ê¸°ëŠ¥ ë„ê¸° ìƒíƒœ)
                var infoHtml = $$.getAKCInfo(false);
                $(sel.akcLayerContent).html(infoHtml).show();
            }
        },

        makeAKCData: debounce(function () {
            var opt = this.opt;
            var sel = this.sel;
            var $$ = this;

            opt.akcSourceKeyword = (sel.akcKeywordInput.val() || '').trim();

            if (opt.akcSourceKeyword === '') {
                $$.changeSearchedKeywordView(true);
                $$.showIframe();

                return;
            }
            $$.changeSearchedKeywordView(false);

            // ìžë™ì™„ì„±
            var akcRequestUrl = '//www.danawa.com';
            var isBranch = location.hostname.indexOf('-branch') > -1;
            if (location.hostname.indexOf('-local') > -1) {
                akcRequestUrl = '//www-local.danawa.com';
            } else if (location.hostname.indexOf('-t') > -1) {
                akcRequestUrl = isBranch ? '//www-t-branch.danawa.com' : '//www-t.danawa.com';
            } else if (location.hostname.indexOf('-s') > -1) {
                akcRequestUrl = '//www-s.danawa.com';
            }

            //dmallì—ì„œ ìžë™ì™„ì„± SIMPLEXMLì´ í˜¸ì¶œ ì•ˆë˜ì„œ ì¶”ê°€ì ìœ¼ë¡œ ë³€ìˆ˜ ì„¤ì •
            var akcReferer = '';
            if (opt.gnbCode == 4) {
                akcReferer = 'dmall';
            }

            var keyword = encodeURIComponent(opt.akcSourceKeyword.replace("'", '||'));

            if (
                typeof ack_cache[keyword] === 'object' &&
                ack_cache[keyword] !== null &&
                Object.keys(ack_cache[keyword]).length > 0
            ) {
                $$.akcSearchResult(ack_cache[keyword]);
            } else {
                $.ajax({
                    type: 'GET',
                    url: akcRequestUrl + '/globaljs/com/danawa/common/searchAutocompleteResult.json.php',
                    dataType: 'jsonp',
                    jsonp: 'callback',
                    cache: false,
                    timeout: 1000,
                    data: {
                        q: decodeURIComponent(keyword),
                        referer: akcReferer
                    },
                    success: function (responseData) {
                        // ìºì‹œ ë“±ë¡(ë©”ëª¨ì´ì œì´ì…˜)
                        ack_cache[keyword] = responseData;

                        $$.akcSearchResult(responseData);
                    }
                });
            }
        }, 100),

        akcSearchResult: function (autoCompleteData) {
            var opt = this.opt;
            var sel = this.sel;
            var $$ = this;

            var autoCompleteResultHtml = '';
            var autoCompleteKeywordData = Array.isArray(autoCompleteData.keyword) ? autoCompleteData.keyword : [];
            var autoCompleteShortcutData = Array.isArray(autoCompleteData.shortcut) ? autoCompleteData.shortcut : [];

            // ìžë™ì™„ì„± ë°”ë¡œê°€ê¸°
            // ìžë™ì™„ì„±ìœ¼ë¡œ ë…¸ì¶œí•˜ë„ë¡ ì„¤ì •í•œ í‚¤ì›Œë“œë§Œ í•´ë‹¹
            if (autoCompleteShortcutData.length > 0 && autoCompleteShortcutData[0].autocompleteYN === 'Y') {
                autoCompleteResultHtml += `
                    <li id="akcSearchResult_0" class="shortcut_url">
                        <a href="" data-url="${autoCompleteShortcutData[0].linkUrl}">
                            <div class="url_area">
                                <span class="url_logo">${
                                    autoCompleteShortcutData[0].imageUrl
                                        ? `<img 
                                                class="image"
                                                src="${autoCompleteShortcutData[0].imageUrl}&shrink=40:40"
                                                alt=""
                                                onerror="this.onerror=null; this.remove();"
                                            />`
                                        : ''
                                }</span>
                                <span class="url_title">${autoCompleteShortcutData[0].sitename}</span>
                                <span class="url_link">${autoCompleteShortcutData[0].exposureUrl}</span>
                            </div>
                            <span class="etc_text">ë°”ë¡œê°€ê¸°</span>
                        </a>
                    </li>`;
            }

            // ìžë™ì™„ì„± í‚¤ì›Œë“œ & ì¶”ì²œ ì¹´í…Œê³ ë¦¬
            if (autoCompleteKeywordData.length === 0) {
                autoCompleteResultHtml += `
                    <div class="no_result">
                        <p class="auto_word_information">í•´ë‹¹ ë‹¨ì–´ ê´€ë ¨ ì¶”ì²œì–´ê°€ ì—†ìŠµë‹ˆë‹¤.</p>
                    </div>`;

                $(sel.akcLayerContent).html(autoCompleteResultHtml);

                $$.printBanner(); // ë°°ë„ˆ ì¶œë ¥
            } else {
                // ìµœê·¼ ê²€ìƒ‰ì–´ ì¿ í‚¤
                var searchKeywordCookieList = $$.getCookieMySearchKeyword();
                // í‚¤ì›Œë“œ/ë‚ ì§œ ë¶„ë¦¬
                var keywordList = searchKeywordCookieList.map(function (value) {
                    return value.split('>')[0] || '';
                });
                var dateList = searchKeywordCookieList.map(function (value) {
                    return value.split('>')[1] || '';
                });

                // ì²« ë²ˆì§¸ ìžë™ì™„ì„± í‚¤ì›Œë“œ
                var firstKeyword = '';
                if (autoCompleteKeywordData.length > 0 && typeof autoCompleteKeywordData[0] === 'string') {
                    firstKeyword = encodeURIComponent($$.removeStrongTag(autoCompleteKeywordData[0]));
                }

                // ìž¥í„°, í†µí•©ë©”ì¸, ê·¸ ì´ì™¸ ì¸ê¸°í‚¤ì›Œë“œ width ê¸¸ì´ì— ë”°ë¥¸ ì¶”ì²œ ì¹´í…Œê³ ë¦¬ ë¬¸ìžì—´ ê¸¸ì´ ì •ì˜
                var widthStyle = '';
                if (opt.gnbCode == 4) {
                    widthStyle = ' style="width:115px !important;"';
                    opt.recommendCategoryStringLength = 10;
                } else if (opt.gnbCode == 0) {
                    opt.recommendCategoryStringLength = 35;
                } else {
                    opt.recommendCategoryStringLength = 20;
                }

                // ì¶”ì²œ ì¹´í…Œê³ ë¦¬
                $$.getRecommendCategoryData(firstKeyword).always(function (recommendCategoryData) {
                    if (recommendCategoryData.length > 0) {
                        opt.recommendCategoryCount = recommendCategoryData.length;

                        var recommendCategoryHtml = '';

                        for (var i = 0; i < opt.recommendCategoryCount; i++) {
                            if (!recommendCategoryData[i] || Object.keys(recommendCategoryData[i]).length === 0) {
                                continue;
                            }

                            var linkUrl = recommendCategoryData[i].url;
                            var innerKeyword = recommendCategoryData[i].innerKeyword;

                            if (innerKeyword) {
                                linkUrl += '&searchOption=/innerSearchKeyword=' + encodeURIComponent(innerKeyword);
                            }

                            recommendCategoryHtml += `
                                <li id="akcSearchResult_${i + 2}" class="recommandCategory">
                                    <a href="" data-url="${linkUrl}">`;

                            if (
                                Array.isArray(recommendCategoryData[i].categoryList) &&
                                recommendCategoryData[i].categoryList.length > 0
                            ) {
                                recommendCategoryHtml += '<span class="label_cate">ì¹´í…Œê³ ë¦¬</span>';
                                recommendCategoryData[i].categoryList.forEach(function (category) {
                                    recommendCategoryHtml += `<span class="text_cate">${category}</span>`;
                                });
                            }
                            recommendCategoryHtml += '</a></li>';
                        }

                        opt.recommendCategoryHtml = recommendCategoryHtml;
                    } else {
                        opt.recommendCategoryHtml = '';
                        opt.recommendCategoryCount = 0;
                        opt.recommendCategoryCurrentLine = 0;
                    }

                    // ìžë™ì™„ì„± í‚¤ì›Œë“œ + ì¶”ì²œ ì¹´í…Œê³ ë¦¬ : ìµœëŒ€ 10ê°œ
                    // ìžë™ì™„ì„± ë°”ë¡œê°€ê¸° : ìµœëŒ€ 1ê°œ
                    var overCount = 0;
                    if (autoCompleteKeywordData.length + opt.recommendCategoryCount > 10) {
                        overCount = autoCompleteKeywordData.length + opt.recommendCategoryCount - 10;
                    }

                    opt.akcListTotalLine = autoCompleteKeywordData.length + autoCompleteShortcutData.length - overCount;

                    for (var j = 0; j < opt.akcListTotalLine - autoCompleteShortcutData.length; j++) {
                        var line = j + 1;
                        if (line > 1) {
                            line = line + opt.recommendCategoryCount;
                        }

                        var recentKeywordIndex = keywordList.indexOf(autoCompleteKeywordData[j]);

                        // ìžë™ì™„ì„± í‚¤ì›Œë“œê°€ ìµœê·¼ ê²€ìƒ‰ì–´ì™€ ì¼ì¹˜í•˜ëŠ” ê²½ìš° ì•„ì´ì½˜ í™œì„±í™”
                        // ìžë™ì™„ì„± í‚¤ì›Œë“œê°€ ìµœê·¼ ê²€ìƒ‰ì–´ì™€ ì¼ì¹˜í•˜ëŠ” ê²½ìš° ë‚ ì§œ ë…¸ì¶œ (MM.DD.)
                        autoCompleteResultHtml += `
                            <li 
                                id="akcSearchResult_${line}" 
                                class="${recentKeywordIndex > -1 ? 'recent' : ''}" 
                                value="" 
                                text="${autoCompleteKeywordData[j] || ''}" 
                                data-seq="${line}"
                            >
                                <a href="">
                                    <span 
                                        class="auto_keyword_name"
                                        ${widthStyle}
                                    >${$$.getAKCKeywordMatch(autoCompleteKeywordData[j] || '')}</span>
                                </a>
                                <span class="etc">
                                    <em class="date">${
                                        recentKeywordIndex > -1 ? dateList[recentKeywordIndex] + '.' : ''
                                    }</em>
                                    <a href="" role="button" class="btn_word_move">
                                        <span class="blind">ê²€ìƒ‰ì–´ ìž…ë ¥ ì˜ì—­ì— ìž…ë ¥</span>
                                    </a>
                                </span>
                            </li>\n`;

                        if (j === 0 && opt.recommendCategoryCount > 0) {
                            autoCompleteResultHtml += opt.recommendCategoryHtml;
                        }
                    }

                    $(sel.akcLayerContent)
                        .html(autoCompleteResultHtml)
                        .find('li[id^="akcSearchResult_"]')
                        .off('mouseenter mouseleave click')
                        .on('mouseenter mouseleave click', function (event) {
                            if (event.type === 'mouseenter') {
                                opt.akcListCurrentLine =
                                    parseInt(event.currentTarget.id.replace('akcSearchResult_', '')) || 0;
                                $$.akcHighlight(event.currentTarget, true);
                            } else if (event.type === 'mouseleave') {
                                $$.akcHighlight(event.currentTarget, false);
                            } else if (event.type === 'click') {
                                event.preventDefault();

                                var linkUrl = '';
                                if (event.currentTarget.classList.contains('shortcut_url')) {
                                    // ìžë™ì™„ì„± ë°”ë¡œê°€ê¸°
                                    linkUrl = event.currentTarget.querySelector('a').dataset.url || '';
                                    var siteName = event.currentTarget.querySelector('.url_title').innerText;

                                    if (linkUrl) {
                                        $$.trkEventLog(
                                            isMain
                                                ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ë°”ë¡œê°€ê¸°_'
                                                : `í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ë°”ë¡œê°€ê¸°_${siteName}`
                                        );

                                        location.href = linkUrl;
                                    }
                                } else {
                                    // ìžë™ì™„ì„± í‚¤ì›Œë“œ & ì¶”ì²œ ì¹´í…Œê³ ë¦¬
                                    var tagRemovedKeyword = $$.removeStrongTag(
                                        event.currentTarget.getAttribute('text')
                                    );

                                    if (event.target.classList.contains('btn_word_move')) {
                                        // ìžë™ ìž…ë ¥ ë²„íŠ¼
                                        sel.akcKeywordInput.val(tagRemovedKeyword).focus();

                                        $$.akcDataDisplay();

                                        $$.trkEventLog(
                                            isMain
                                                ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ê²€ìƒ‰ì°½ìž…ë ¥'
                                                : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ê²€ìƒ‰ì°½ìž…ë ¥'
                                        );
                                    } else if (
                                        opt.recommendCategoryCount > 0 &&
                                        event.currentTarget.classList.contains('recommandCategory')
                                    ) {
                                        // ì¶”ì²œ ì¹´í…Œê³ ë¦¬
                                        linkUrl = event.currentTarget.querySelector('a').dataset.url || '';

                                        if (linkUrl) {
                                            $$.doUxlogging('A0002-A-AB-0002', {
                                                autoComplete: 'category',
                                                memberCode: parseInt($('#memberSeq').val()) || undefined
                                            });
                                            $$.trkEventLog(
                                                isMain
                                                    ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ì¶”ì²œì¹´í…Œê³ ë¦¬'
                                                    : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ì¶”ì²œì¹´í…Œê³ ë¦¬'
                                            );

                                            location.href = linkUrl;
                                        }
                                    } else if (tagRemovedKeyword !== '') {
                                        var typingKeyword = ($(sel.keywordInput).val() || '').trim();

                                        $$.doUxlogging('A0002-A-AB-0001', {
                                            autoComplete: 'keyword',
                                            typingKeyword: typingKeyword,
                                            clickKeyword: tagRemovedKeyword,
                                            memberCode: parseInt($('#memberSeq').val()) || undefined
                                        });
                                        $$.trkEventLog(
                                            isMain ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_í‚¤ì›Œë“œ' : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_í‚¤ì›Œë“œ'
                                        );

                                        location.href = opt.akcLinkUrl + encodeURIComponent(tagRemovedKeyword);
                                    }
                                }
                            }
                        });

                    if (opt.akcListTotalLine > 0) {
                        opt.akcListCurrentLine = 1;
                        $$.makeGoodsListData();
                    }

                    if (opt.recommendCategoryCount > 0) {
                        opt.akcListTotalLine = opt.akcListTotalLine + opt.recommendCategoryCount;
                    }
                });
            }

            $(sel.akcLayerContent).show();

            //ê°„í˜¹ í…ìŠ¤íŠ¸ ê´‘ê³ ê°€ ì œëŒ€ë¡œ ì œê±°ë˜ì§€ ì•Šì•„ì„œ í‚¤ë³´ë“œ ì´ë²¤íŠ¸ ë°œìƒì‹œ í…ìŠ¤íŠ¸ ê´‘ê³  ì œê±°í•˜ê¸° ìœ„í•œ ì²˜ë¦¬
            if (sel.akcKeywordInput.hasClass('search_ad')) {
                if (typeof adv_srch_obj === 'string') {
                    sel.akcKeywordInput.val(sel.akcKeywordInput.val().replace(adv_srch_obj, ''));
                    sel.akcKeywordInput.removeClass('search_ad');
                }

                $('#srchFRM_TOP').attr('action', `${opt.searchUrl}/dsearch.php`);
            }

            //iframe ë°±ê·¸ë¼ìš´ë“œ ì²˜ë¦¬
            $$.showIframe();
        },

        getRecommendCategoryData: function (firstKeyword) {
            var opt = this.opt;
            var deferred = $.Deferred();

            if (
                acc_cache[firstKeyword] &&
                Array.isArray(acc_cache[firstKeyword]) &&
                acc_cache[firstKeyword].length > 0
            ) {
                // ìºì‹œ ì¡°íšŒ
                deferred.resolve(acc_cache[firstKeyword]);
            } else {
                $.ajax({
                    type: 'GET',
                    url: opt.staticUrl + '/globalData/searchAKC/acc_UTF8.php',
                    dataType: 'jsonp',
                    jsonp: 'callback',
                    cache: false,
                    timeout: 1000,
                    data: {
                        Name: decodeURIComponent(firstKeyword)
                    },
                    success: function (responseData) {
                        if (responseData && Array.isArray(responseData) && responseData.length > 0) {
                            // ìºì‹œ ë“±ë¡(ë©”ëª¨ì´ì œì´ì…˜)
                            acc_cache[firstKeyword] = responseData;

                            deferred.resolve(responseData);
                        } else {
                            deferred.reject([]);
                        }
                    },
                    error: function () {
                        deferred.reject([]);
                    }
                });
            }

            return deferred.promise();
        },

        showIframe: function () {
            var opt = this.opt;
            var sel = this.sel;

            if (!opt.isDisplayAKCService) {
                this.hideIframe();
                return false;
            }

            var w = `${$(sel.akcContentWrap).width()}px`;
            var h = `${$(sel.akcContentWrap).height() - 1}px`;

            $(sel.iframe)
                .css({
                    backgroundColor: 'white',
                    width: w,
                    height: h
                })
                .show();

            $(sel.iframe)
                .off('load')
                .on('load', function () {
                    $('#searchKeywordPrint', sel.iframe.contentWindow.document).html($(sel.akcLayerContent).html());
                });
        },

        hideIframe: function () {
            $(this.sel.iframe).hide();
        },

        // ìžë™ì™„ì„± í‚¤ì›Œë“œ ë¦¬ìŠ¤íŠ¸ ë§¤ì¹­.
        // @param keywordList ìžë™ì™„ì„± í‚¤ì›Œë“œ ë¦¬ìŠ¤íŠ¸.
        // @return returnKeyword string ë§¤ì¹­ëœ í‚¤ì›Œë“œ.
        getAKCKeywordMatch: function (akcKeyword) {
            var akcTargetKeyword = akcKeyword.replace(/\s+/g, ''); // akc í‚¤ì›Œë“œ ê³µë°± ì œê±°
            var targetAkcSourceKeyword = this.opt.akcSourceKeyword; // ìž…ë ¥ í‚¤ì›Œë“œ ê³µë°± ì œê±°
            var targetAkcSourceTrimmedKeyword = targetAkcSourceKeyword.replace(/\s+/g, ''); // ìž…ë ¥ í‚¤ì›Œë“œ ê³µë°± ì œê±°
            var returnAKCKeyword = ''; // ë§¤ì¹­ ê²°ê³¼ í‚¤ì›Œë“œ

            if (akcTargetKeyword === targetAkcSourceTrimmedKeyword) {
                returnAKCKeyword += '<strong>' + akcKeyword + '</strong>';
            } else {
                // í‚¤ì›Œë“œ ì²«ë¶€ë¶„ ë§¤ì¹­ë§Œ ë˜ì„œ ê¸°ì¡´ ë§¤ì¹­ë°©ë²• ì œê±°í•˜ê³  ì •ê·œì‹ìœ¼ë¡œ ë³¼ë“œì²˜ë¦¬í•˜ê²Œë” ë³€ê²½
                var escapeTargetSourceKeyword = targetAkcSourceKeyword.replace(/[\\"'.]/g, '\\$&');

                returnAKCKeyword += akcKeyword.replace(
                    new RegExp(escapeTargetSourceKeyword, ''), //ì²«ë²ˆì§¸ë¡œ ë§¤ì¹­ë˜ëŠ” í‚¤ì›Œë“œë§Œ í•˜ì´ë¼ì´íŒ… ì²˜ë¦¬
                    `<strong>${targetAkcSourceKeyword}</strong>`
                );
            }

            if (returnAKCKeyword === '') {
                returnAKCKeyword = akcKeyword;
            }

            return returnAKCKeyword;
        },

        // ìžë™ì™„ì„± ë¦¬ìŠ¤íŠ¸ ë¼ì¸ í•˜ì´ë¼ì´íŒ…
        akcHighlight: function (target, flag) {
            $(this.sel.akcKeywordLayer).find('li').removeClass('hover');

            if (flag) {
                $(target).addClass('hover');
            } else {
                $(target).removeClass('hover');
            }
        },

        // ìžë™ì™„ì„± ì•ˆë‚´ ë¬¸êµ¬
        getAKCInfo: function (flag) {
            var infoMessageHtml = '<div class="no_result"><p class="auto_word_information">';
            if (flag) {
                infoMessageHtml +=
                    'ê²€ìƒ‰ì–´ ìžë™ì™„ì„± ê¸°ëŠ¥ì„ ì‚¬ìš©í•˜ê³  ìžˆìŠµë‹ˆë‹¤.<br />' +
                    'ì‚¬ìš©ì„ ì›í•˜ì‹œì§€ ì•ŠëŠ”ë‹¤ë©´ <strong>ìžë™ì™„ì„± ë„ê¸°</strong>ë¥¼ í´ë¦­í•´ ì£¼ì„¸ìš”.';
            } else {
                infoMessageHtml +=
                    'ê²€ìƒ‰ì–´ ìžë™ì™„ì„± ê¸°ëŠ¥ì´ ì¤‘ì§€ë˜ì—ˆìŠµë‹ˆë‹¤.<br />' +
                    'ì‚¬ìš©ì„ ì›í•˜ì‹œë©´ <strong>ê¸°ëŠ¥ì¼œê¸°</strong>ë¥¼ í´ë¦­í•´ ì£¼ì„¸ìš”.';
            }
            infoMessageHtml += '</p></div>';

            return infoMessageHtml;
        },

        AKCFocusOut: function () {
            if (!this.opt.isAKCArea) {
                this.akcDisplayControl(0);
            }
        },

        AKCOpenClose: function () {
            if (this.opt.isDisplayAKCService) {
                this.akcDisplayControl(0);
            } else {
                this.akcDisplayControl(1);
            }
        },

        // ìžë™ì™„ì„± ì„œë¹„ìŠ¤ ì»¨íŠ¸ë¡¤ëŸ¬. ìžë™ì™„ì„± ê¸°ëŠ¥ ì‚¬ìš©/ë¯¸ì‚¬ìš©ì— ëŒ€í•œ ê¸°ëŠ¥ë§Œ ìˆ˜í–‰.
        // isUsingAKCServiceê°€ trueì´ë©´ ê¸°ëŠ¥ ë¯¸ìƒìš©ìœ¼ë¡œ ì „í™˜, falseì´ë©´ ì‚¬ìš©ìœ¼ë¡œ ì „í™˜.
        akcServiceControl: function () {
            var opt = this.opt;
            var sel = this.sel;
            var $$ = this;

            if (opt.isUsingAKCService) {
                opt.isUsingAKCService = false;

                this.akcDisplayControl(0);
                this.akcServiceCtrlLayer();
                this.akcServiceCtrlLayer_new();
                this.changeSearchedKeywordView(false);

                $('#auto_goods_list', sel.akcGoodsLayer).hide();
                $('#auto_banner_layer', sel.akcGoodsLayer).show();

                $.cookie('isUsingAKCService', 'N', { expires: 365, path: '/', domain: 'danawa.com' });

                $$.trkEventLog(isMain ? '21í†µí•©ê²€ìƒ‰_ìžë™ì™„ì„±_ê¸°ëŠ¥ë„ê¸°' : 'í†µí•©ê²€ìƒ‰_global_ìžë™ì™„ì„±_ê¸°ëŠ¥ë„ê¸°');
            } else {
                opt.isUsingAKCService = true;

                this.akcServiceCtrlLayer();
                this.akcServiceCtrlLayer_new();
                this.changeSearchedKeywordView(opt.akcSourceKeyword === '');
                this.akcDisplayControl(1);

                $.cookie('isUsingAKCService', 'Y', { expires: 365, path: '/', domain: 'danawa.com' });
            }
        },

        // ìžë™ì™„ì„± ê¸°ëŠ¥ ë²„íŠ¼ ë ˆì´ì–´ ë™ìž‘.
        akcServiceCtrlLayer: function () {
            if (this.opt.isUsingAKCService) {
                $(this.sel.serviceCtrlLayer).html('<a href="#" class="com_gnb auto_function_switch">ìžë™ì™„ì„± ë„ê¸°</a>');
            } else {
                $(this.sel.serviceCtrlLayer).html('<a href="#" class="com_gnb auto_function_switch">ê¸°ëŠ¥ì¼œê¸°</a>');
            }
        },

        // ìžë™ì™„ì„± ê¸°ëŠ¥ ë²„íŠ¼ ë ˆì´ì–´ ë™ìž‘. (ìµœê·¼ ê²€ìƒ‰ì–´)
        akcServiceCtrlLayer_new: function () {
            if (this.opt.isUsingAKCService) {
                $(this.sel.serviceCtrlLayer).html(
                    '<a href="#" class="com_gnb keyword_all_delete">ì „ì²´ ì‚­ì œ</a><a href="#" class="com_gnb auto_function_switch">ìžë™ì™„ì„± ë„ê¸°</a>'
                );
            } else {
                $(this.sel.serviceCtrlLayer).html('<a href="#" class="com_gnb auto_function_switch">ê¸°ëŠ¥ì¼œê¸°</a>');
            }
        },

        // ê²€ìƒ‰ë°•ìŠ¤ ë°–ì—ì„œ keydown ì´ë²¤íŠ¸ ë°œìƒì‹œ ê²€ìƒ‰ë°•ìŠ¤ë¡œ í¬ì»¤ìŠ¤
        searchEventkeyHandler: function (event) {
            var sel = this.sel;

            var nodeName = event.target.nodeName;
            var keyCode = event.keyCode;

            if (
                !(
                    nodeName === 'INPUT' ||
                    nodeName === 'SELECT' ||
                    nodeName === 'TEXTAREA' ||
                    nodeName === 'OBJECT' ||
                    (event.ctrlKey && keyCode !== 86)
                )
            ) {
                //F5(116) ëˆ„ë¥¼ë•Œ ìžë™ì™„ì„± ëœ¨ì§€ì•Šë„ë¡ ì˜ˆì™¸ì²˜ë¦¬ 15.06.24
                if (
                    keyCode === 8 ||
                    (keyCode > 32 && keyCode < 41) ||
                    (keyCode !== 21 && keyCode < 32) ||
                    (keyCode > 90 && keyCode < 94) ||
                    event.altKey ||
                    keyCode === 116 ||
                    event.metaKey
                ) {
                    //
                } else if (keyCode === 32) {
                    if (event.shiftKey) {
                        sel.akcKeywordInput.val('').focus();
                        event.returnValue = false;
                    }
                } else if (keyCode === 21) {
                    sel.akcKeywordInput.val('').focus();
                    event.returnValue = false;
                } else if (nodeName != sel.akcKeywordInput) {
                    sel.akcKeywordInput.val('').focus();
                }
            }
        },

        // ìžë™ì™„ì„± ìƒí’ˆ ê°€ì ¸ì˜¤ê¸°
        makeGoodsListData: function () {
            var rankValue = parseInt($(`#akcSearchResult_${this.opt.akcListCurrentLine}`).attr('value'));

            if (rankValue < 1) {
                return;
            }

            $('#auto_banner_layer', this.sel.akcGoodsLayer).show();
        },

        // í‚¤ì›Œë“œì— ë§žëŠ” ì¶”ì²œìƒí’ˆì´ ì—†ì„ ë•Œ ë°°ë„ˆ ì¶œë ¥
        printBanner: function () {
            $('#auto_banner_layer', this.sel.akcGoodsLayer).show();
            $('#auto_goods_list', this.sel.akcGoodsLayer).hide();
        },

        // ìµœê·¼ ê²€ìƒ‰ì–´ ê°€ì ¸ì˜¤ê¸°
        makeSearchedKeywordList: function () {
            var opt = this.opt;
            var sel = this.sel;
            var $$ = this;

            var searchKeywordCookieList = $$.getCookieMySearchKeyword();

            if (searchKeywordCookieList.length > 0) {
                var searchKeywordHtml = `
                    <dl class="searched_keyword">
                        <dt>ìµœê·¼ ê²€ìƒ‰ì–´</dt>
                        <dd>
                            <ul id="mySearchKeywordListArea" class="searched_keyword_info">`;

                searchKeywordCookieList.forEach(function (value, index) {
                    var searchKeyword = '';
                    var searchDate = '';
                    if (typeof value === 'string') {
                        searchKeyword = value.split('>')[0] || '';
                        searchDate = value.split('>')[1] || '';
                    }
                    var searchKeywordId = `mySearchKeyword_${index + 1}`;
                    var deleteKeywordId = `deleteSearchKeyword_${index + 1}`;

                    if (searchKeyword !== '') {
                        searchKeywordHtml += `
                            <li id="${searchKeywordId}" text="${searchKeyword}">
                                <a href="${opt.akcLinkUrl + encodeURIComponent(searchKeyword)}">${searchKeyword}</a>
                                <span class="etc">
                                    <span class="date">${searchDate ? searchDate + '.' : ''}</span>
                                    <input type="button" id="${deleteKeywordId}" class="btn btn_delete" title="ê²€ìƒ‰í•œ í‚¤ì›Œë“œ ì‚­ì œ" />
                                </span>
                            </li>`;
                    }
                });

                searchKeywordHtml += '</ul></dd></dl>';

                $(sel.searchKeywordLayer)
                    .html(searchKeywordHtml)
                    .find('[id^="mySearchKeyword_"]')
                    .off('mouseenter mouseleave')
                    .on('mouseenter mouseleave', function (event) {
                        if (event.type === 'mouseenter') {
                            opt.myKeywordCurrentLine = $(event.currentTarget).attr('id')
                                ? parseInt($(event.currentTarget).attr('id').replace('mySearchKeyword_', '')) || 0
                                : 0;
                            $$.akcHighlight(event.currentTarget, true);
                        } else if (event.type === 'mouseleave') {
                            opt.myKeywordCurrentLine = 1;
                            $$.akcHighlight(event.currentTarget, false);
                        }
                    });

                if (opt.myKeywordTotalLine > 0) {
                    opt.myKeywordCurrentLine = 1;
                    $$.akcHighlight($('#mySearchKeyword_1'), false);
                }

                // ìµœê·¼ ê²€ìƒ‰ì–´ ê°œë³„ í´ë¦­
                $(sel.searchKeywordLayer)
                    .find('li[id^=mySearchKeyword_] a')
                    .off('click')
                    .on('click', function (event) {
                        var searchKeyword = $(event.currentTarget).parent('li').attr('text') || '';
                        if (searchKeyword) {
                            sel.akcKeywordInput.val(searchKeyword);
                        }

                        $$.trkEventLog(
                            isMain ? '21í†µí•©ê²€ìƒ‰_ë‚´ê°€ê²€ìƒ‰í•œí‚¤ì›Œë“œ_í‚¤ì›Œë“œ' : 'í†µí•©ê²€ìƒ‰_global_ë‚´ê°€ê²€ìƒ‰í•œí‚¤ì›Œë“œ_í‚¤ì›Œë“œ'
                        );
                    });

                // ìµœê·¼ ê²€ìƒ‰ì–´ ê°œë³„ ì‚­ì œ
                $(sel.searchKeywordLayer)
                    .find('input[id^="deleteSearchKeyword_"]')
                    .off('click')
                    .on('click', function (event) {
                        var searchKeyword = $(event.currentTarget).parents('li').attr('text') || '';
                        var searchKeywordCookieList = $$.getCookieMySearchKeyword();

                        if (searchKeywordCookieList.length > 0) {
                            var hasRemoveItem = false;
                            var removeItemIndex = 0;

                            searchKeywordCookieList.forEach(function (value, index) {
                                if ($$.decodeHtmlEntities(value.split('>')[0]) === searchKeyword) {
                                    removeItemIndex = index;
                                    hasRemoveItem = true;
                                }
                            });

                            if (hasRemoveItem) {
                                searchKeywordCookieList.splice(removeItemIndex, 1);
                            }

                            if (searchKeywordCookieList.length > 0) {
                                searchKeywordCookieList = searchKeywordCookieList.join('|');
                            } else {
                                searchKeywordCookieList = null;
                            }

                            $$.setCookieMySearchKeyword(searchKeywordCookieList);

                            $('[id^="mySearchKeyword_"], [id^="myFixedSearchKeyword_"]').each(function () {
                                if ($(this).attr('text') === searchKeyword) {
                                    $(this).remove();
                                }
                            });
                        }
                    });
            } else {
                $$.setCookieMySearchKeyword(null);
            }

            $(sel.searchKeywordLayer).show();
        },

        //ìµœê·¼ ê²€ìƒ‰ì–´ ì¿ í‚¤ ì €ìž¥
        setCookieMySearchKeyword: function (searchKeywordCookieValue) {
            var opt = this.opt;
            var sel = this.sel;

            if (searchKeywordCookieValue === null) {
                opt.myKeywordCurrentLine = 0;
                opt.myKeywordTotalLine = 0;

                $(sel.searchKeywordLayer).html(`
                    <div class="no_result">
                        <p class="auto_word_information">ìµœê·¼ ê²€ìƒ‰í•œ í‚¤ì›Œë“œê°€ ì—†ìŠµë‹ˆë‹¤.</p>
                    </div>
                `);
            } else {
                searchKeywordCookieValue =
                    typeof searchKeywordCookieValue === 'string' ? searchKeywordCookieValue.trim() : '';

                var searchKeywordCookieList = searchKeywordCookieValue.split('|').filter(function (value) {
                    return value.trim() !== '';
                });

                searchKeywordCookieValue = searchKeywordCookieList.join('|');

                opt.myKeywordTotalLine = searchKeywordCookieList.length;
                opt.myKeywordCurrentLine = 1;
            }

            $.cookie('cookNewSearchKeyword', searchKeywordCookieValue, {
                expires: 730,
                path: '/',
                domain: 'danawa.com'
            });
        },

        // ìµœê·¼ ê²€ìƒ‰ì–´ ì¿ í‚¤ ì¡°íšŒ
        getCookieMySearchKeyword: function () {
            var opt = this.opt;

            var searchKeywordCookieList = [];
            var searchKeywordCookieValue = $.cookie('cookNewSearchKeyword') || '';

            if (searchKeywordCookieValue) {
                searchKeywordCookieList = searchKeywordCookieValue
                    .trim()
                    .split('|')
                    .filter(function (value) {
                        return value.trim() !== '';
                    });

                opt.myKeywordTotalLine = searchKeywordCookieList.length;
                opt.myKeywordCurrentLine = 1;
            }

            return searchKeywordCookieList;
        },

        // ìµœê·¼ ê²€ìƒ‰ì–´ ì œì–´
        changeSearchedKeywordView: function (flag) {
            var $$ = this;
            var opt = this.opt;
            var sel = this.sel;

            if (flag) {
                $(sel.akcLayerContent).empty().hide();
                $$.makeSearchedKeywordList();
                this.akcServiceCtrlLayer_new();
            } else {
                $(sel.searchKeywordLayer).empty().hide();
                this.akcServiceCtrlLayer();
                $('li[id^="mySearchKeyword_"]').removeClass('hover');
                opt.myKeywordCurrentLine = 1;
            }

            opt.isMyKeywordService = flag;
        },

        //insight
        trkEventLog: function (message) {
            if (typeof _trk_clickTrace === 'function') {
                try {
                    _trk_clickTrace('EVT', message);
                } catch (error) {
                    console.error(error);
                }
            }
        },

        //ì‚¬ìš©ìž íŒ¨í„´ ë¶„ì„ UXLOG
        doUxlogging: function (uxId, logData) {
            if (typeof DSAC === 'object' && DSAC !== null && uxId && logData) {
                DSAC.execute(
                    JSON.stringify({
                        uxid: uxId,
                        parameter: logData
                    })
                );
            }
        },

        removeStrongTag: function (str) {
            if (typeof str === 'string') {
                return str.replace(/<+(\/)?strong>/g, '').trim();
            } else {
                return '';
            }
        },

        decodeHtmlEntities: function (decodeString) {
            if (decodeString && typeof decodeString === 'string') {
                var element = document.createElement('div');
                decodeString = decodeString.replace(/<script[^>]*>([\S\s]*?)<\/script>/gim, '');
                decodeString = decodeString.replace(/<\/?\w(?:[^"'>]|"[^"]*"|'[^']*')*>/gim, '');
                element.innerHTML = decodeString;
                decodeString = element.textContent;
                element.textContent = '';
            } else {
                decodeString = '';
            }

            return decodeString;
        }
    };

    $.danawaSearchAutoComplete = function (selector, settings) {
        new autocomplete(selector, settings);
    };
    $.fn.danawaSearchAutoComplete = function (settings) {
        return this.each(function () {
            new $.danawaSearchAutoComplete(this, settings);
        });
    };

    /**
     * $.browser ëŒ€ì²´ í•¨ìˆ˜
     */
    var BrowserDetect = {
        init: function () {
            this.browser = this.searchString(this.dataBrowser) || 'Other';
            this.version = this.searchVersion(navigator.userAgent) || 'Unknown';
        },
        searchString: function (data) {
            var dataLength = data.length;

            for (var i = 0; i < dataLength; i++) {
                var dataString = data[i].string;
                this.versionSearchString = data[i].subString;

                if (dataString.indexOf(data[i].subString) !== -1) {
                    return data[i].identity;
                }
            }
        },
        searchVersion: function (dataString) {
            var index = dataString.indexOf(this.versionSearchString);
            if (index === -1) {
                return;
            }

            var rv = dataString.indexOf('rv:');
            if (this.versionSearchString === 'Trident' && rv !== -1) {
                return parseFloat(dataString.substring(rv + 3));
            } else {
                return parseFloat(dataString.substring(index + this.versionSearchString.length + 1));
            }
        },

        dataBrowser: [
            {
                string: navigator.userAgent,
                subString: 'Edge',
                identity: 'MS Edge'
            },
            {
                string: navigator.userAgent,
                subString: 'MSIE',
                identity: 'Explorer'
            },
            {
                string: navigator.userAgent,
                subString: 'Trident',
                identity: 'Explorer'
            },
            {
                string: navigator.userAgent,
                subString: 'Firefox',
                identity: 'Firefox'
            },
            {
                string: navigator.userAgent,
                subString: 'Opera',
                identity: 'Opera'
            },
            {
                string: navigator.userAgent,
                subString: 'OPR',
                identity: 'Opera'
            },
            {
                string: navigator.userAgent,
                subString: 'Chrome',
                identity: 'Chrome'
            },
            {
                string: navigator.userAgent,
                subString: 'Safari',
                identity: 'Safari'
            }
        ]
    };
})(jQuery);
