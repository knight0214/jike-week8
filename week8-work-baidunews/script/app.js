$(function() {
    //用来控制main-left-nav部分的菜单切换事件
    $('.news-list').each(function(index) {
        var liNode = $(this);
        liNode.click(function() {
            $('.actived-list').removeClass('actived-list');
            liNode.addClass('actived-list');
            $('.actived-news-content').removeClass('actived-news-content');
            $('.news-content').eq(index).addClass('actived-news-content');
        });
    });
    //用来控制各个news-content的新闻加载事件
    $('#rec-news').click(function() {
        newsShow('rec', '.rec-ul');
    });
    $('#baijia-news').click(function() {
        newsShow('baijia', '.baijia-ul');
    });
    $('#bendi-news').click(function() {
        newsShow('bendi', '.bendi-ul');
    });
    // 页面加载是先载入#rec的数据
    // $(window).load(function(){
    newsShow('rec', '.rec-ul');
    // });

    //用来确定轮播图片的宽度
    var screenWidth = $(window).width();
    var imgWidth = screenWidth - 20;
    $('.viwepager-wrap').css('width', imgWidth);
    $('.banner-list img').css('width', imgWidth);
    var imgHeight = $('.rec-list img').height();
    $('.banner-ul').css('height', imgHeight);
    $('.banner-list').css('height', imgHeight);
    //用来定义图片轮播
    bannerControl(".rec-viwepager", ".rec-banner-left", ".rec-banner-right", ".rec-pagination span");
    bannerControl(".bendi-viwepager", ".bendi-banner-left", ".bendi-banner-right", ".bendi-pagination span");
    //用来定义热点走马灯
    hotWordBanner();

});
//用来控制图片轮播
// bannerCon:轮播的容器,prevBtn:上一个的按钮,nextBtn:下一个的按钮,point:焦点
function bannerControl(bannerCon, prevBtn, nextBtn, point) {
    $dragBln = false;

    $(bannerCon).touchSlider({
        flexible: true,
        speed: 500,
        btn_prev: $(prevBtn),
        btn_next: $(nextBtn),
        paging: $(point),
        counter: function(e) {
            $(point).removeClass("actived-switch").eq(e.current - 1).addClass("actived-switch");
        }
    });

    $(bannerCon).bind("mousedown", function() {
        $dragBln = false;
    });

    $(bannerCon).bind("dragstart", function() {
        $dragBln = true;
    });

    $(point).click(function() {
        if ($dragBln) {
            return false;
        }
    });

    var timer = setInterval(function() {
        $(nextBtn).click();
    }, 5000);

    $(bannerCon).bind("touchstart", function() {
        clearInterval(timer);
    }).bind("touchend", function() {
        timer = setInterval(function() {
            $(nextBtn).click();
        }, 5000);
    });
}
//用来定义热点走马灯事件
function hotWordBanner() {
    var liHeight = $('.ui-hotword-item').height();
    var len = $('.ui-hotword-item').length;
    var index = 0;
    var timer = setInterval(function() {
        index += 1;
        if (index == len - 1) {
            $('.ui-hotword-content').css('margin-top', '0px');
            index = 0;
        }
        wordMove(index);

    }, 2000);

    function wordMove(index) {
        var nowTop = -index * liHeight;
        $('.ui-hotword-content').animate({
            'margin-top': nowTop
        }, 800);
    }
}
//用来控制各个news页面的新闻加载
function newsShow(key, newsUl) {
    $.ajax({
        url: './news.php',
        data: [{name:'newsKey',value: key}],
        type:'get',
        dataTYpe:'json',
        success: function(data) {
            var newsData = data;
            console.log(newsData);
            $(newsUl).empty();
            $.each(newsData, function(index) {
                var newsList = $('<li>').addClass('news-card').appendTo($(newsUl));
                if (newsData[index].newstype == 'img-text-show') {
                    newsList.addClass('img-text-show');
                    var newsA = $('<a>').attr('href', newsData[index].newshref).appendTo(newsList);
                    var img1 = $('<img>').attr('src', newsData[index].newsimg1).appendTo(newsA);
                    var mainTextBox = $('<div>').addClass('card-main-text').appendTo(newsA);
                    var newsTitle = $('<h1>').addClass('card-title').append(newsData[index].newstitle).appendTo(mainTextBox);
                    var newsText = $('<p>').addClass('card-text').append(newsData[index].newstext).appendTo(mainTextBox);
                    var addTime = $('<span>').addClass('add-time').append(timeSet(newsData[index].addtime)).appendTo(newsA);
                    var newsTag = $('<i>').addClass('card-tag').append(newsData[index].newstag).appendTo(newsA);
                    if (newsData[index].tagcolor == 'red') {
                        newsTag.addClass('red-tag');
                    } else if (newsData[index].tagcolor == 'blue') {
                        newsTag.addClass('blue-tag');
                    }
                } else if (newsData[index].newstype == 'img-show') {
                    newsList.addClass('img-show');
                    var newsA = $('<a>').attr('href', newsData[index].newshref).appendTo(newsList);
                    var newsTitle = $('<h1>').addClass('card-title').append(newsData[index].newstitle).appendTo(newsA);
                    var imgGroup = $('<div>').addClass('img-group').appendTo(newsA);
                    var imgBox1 = $('<div>').addClass('img-box').appendTo(imgGroup);
                    var imgBox2 = $('<div>').addClass('img-box').appendTo(imgGroup);
                    var imgBox3 = $('<div>').addClass('img-box').appendTo(imgGroup);
                    var imgWrap1 = $('<div>').addClass('img-wrap').appendTo(imgBox1);
                    var imgWrap2 = $('<div>').addClass('img-wrap').appendTo(imgBox2);
                    var imgWrap3 = $('<div>').addClass('img-wrap').appendTo(imgBox3);
                    var img1 = $('<img>').attr('src', newsData[index].newsimg1).appendTo(imgWrap1);
                    var img2 = $('<img>').attr('src', newsData[index].newsimg2).appendTo(imgWrap2);
                    var img3 = $('<img>').attr('src', newsData[index].newsimg3).appendTo(imgWrap3);
                    var addTime = $('<span>').addClass('add-time').append(timeSet(newsData[index].addtime)).appendTo(newsA);
                    var newsTag = $('<i>').addClass('card-tag').append(newsData[index].newstag).appendTo(newsA);
                    if (newsData[index].tagcolor == 'red') {
                        newsTag.addClass('red-tag');
                    } else if (newsData[index].tagcolor == 'blue') {
                        newsTag.addClass('blue-tag');
                    }
                } else if (newsData[index].newstype == 'text-show') {
                    newsList.addClass('text-show');
                    var newsA = $('<a>').attr('href', newsData[index].newshref).appendTo(newsList);
                    var newsTitle = $('<h1>').addClass('card-title').append(newsData[index].newstitle).appendTo(newsA);
                    var newsText = $('<p>').addClass('card-text').append(newsData[index].newstext).appendTo(newsA);
                    var addTime = $('<span>').addClass('add-time').append(timeSet(newsData[index].addtime)).appendTo(newsA);
                    var newsTag = $('<i>').addClass('card-tag').append(newsData[index].newstag).appendTo(newsA);
                    if (newsData[index].tagcolor == 'red') {
                        newsTag.addClass('red-tag');
                    } else if (newsData[index].tagcolor == 'blue') {
                        newsTag.addClass('blue-tag');
                    }
                }
            });
        },
        error: function(data) {
            console.log(data);
        }
    });
}


//用来计算各个新闻的时间差
function timeSet(addTime) {
    var today = new Date;
    var result = (Date.parse(today) - Date.parse(addTime)) / 1000 / 60 / 60 / 24;
    var days = parseInt(result);
    var hours = parseInt(result * 24);
    var minutes = parseInt(result * 24 * 60);
    var seconds = parseInt(result * 24 * 60 * 60);
    var resultTime;
    if (seconds <= 60) {
        resultTime = '刚刚';
    } else if (seconds > 60 && minutes < 60) {
        resultTime = minutes + '分钟前';
    } else if (minutes > 60 && hours < 24) {
        resultTime = hours + '小时前';
    } else if (hours > 24) {
        resultTime = days + '天前';
    }
    return resultTime;
}
