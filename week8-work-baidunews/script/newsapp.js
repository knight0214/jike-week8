$(function() {
    // $(window).load(function() {
    //用于调整页面高度
    var screenHeight = $(window).height();
    var headerHeight = $('header').height();
    $('.con').css('min-height', screenHeight);
    $('article').css('min-height', screenHeight - headerHeight);
    //用于刷新news数据
    $.ajax({
        url: './news.php',
        data: [{name:'newsKey',value: 'all'}],
        type:'get',
        dataType:'json',
        success: function(data) {
            var newsData = data;
            console.log(data);
            $.each(newsData, function(index) {
                var newsTr = $('<tr>').appendTo($('.news-body'));
                var newsid = $('<td>').addClass('newsid').appendTo(newsTr);
                var idcheck = $('<input>').attr({
                        id: 'newsid[]',
                        name: 'newsid[]',
                        type: 'checkbox',
                        value: newsData[index].newsid
                    })
                    .appendTo(newsid);
                var idlabel = $('<label>').attr('for', newsData[index].newsid).append(newsData[index].newsid)
                    .appendTo(newsid);
                var newsclass = $('<td>').addClass('newsclass').appendTo(newsTr);
                if (newsData[index].newsclass == 'rec') {
                    newsclass.append('百度推荐');
                } else if (newsData[index].newsclass == 'baijia') {
                    newsclass.append('百度百家');
                } else if (newsData[index].newsclass == 'bendi') {
                    newsclass.append('百度本地');
                }
                var newshref = $('<td>').append(newsData[index].newshref).appendTo(newsTr);
                var newstitle = $('<td>').addClass('newstitle').append(newsData[index].newstitle).appendTo(newsTr);
                var newstext = $('<td>').addClass('newstext').append(newsData[index].newstext).appendTo(newsTr);
                // var newsimg1=$('<td>').append(newsData[index].newsimg1).appendTo(newsTr);
                // var newsimg2=$('<td>').append(newsData[index].newsimg2).appendTo(newsTr);
                // var newsimg3=$('<td>').append(newsData[index].newsimg3).appendTo(newsTr);
                var newstype = $('<td>').addClass('newstype').append(newsData[index].newstype).appendTo(newsTr);
                var addtime = $('<td>').addClass('addtime').append(newsData[index].addtime).appendTo(newsTr);
                var newstag = $('<td>').addClass('newstag').append(newsData[index].newstag).appendTo(newsTr);
                var tagcolor = $('<td>').addClass('tagcolor').append(newsData[index].tagcolor).appendTo(newsTr);
                // var newsbtn = $('<td>').appendTo(newsTr);
                // var newsid = $('<button>').addClass('btn btn-primary btn-xs edit-btn').attr('id', newsData[index].newsid)
                //     .append('编辑').appendTo(newsbtn);
                // var newsid = $('<button>').addClass('btn btn-danger btn-xs del-btn').attr('value', newsData[index].newsid)
                //     .append('删除').appendTo(newsbtn);

            });
        },
        error: function(data) {
            console.log(data);
        }
    });
    //用于添加数据
    $('.submit-btn').click(function(e) {
        e.preventDefault();
        var addData = $('#addform').serializeArray();
        if (addData[0].value == '') {
            alert('请选择新闻归属');
            return false;
        } else if (addData[1].value == '') {
            alert('请填写新闻链接');
            return false;
        } else if (addData[2].value == '') {
            alert('请填写新闻标题');
            return false;
        } else if (addData[7].value == '') {
            alert('请选择新闻排版模式');
            return false;
        } else if (addData[8].value == '') {
            alert('请输入时间');
            return false;
        }
        var newsKey = {
            name: 'newsKey',
            value: 'add'
        };
        addData.push(newsKey);
        console.log(addData);
        $.ajax({
            url: 'operation.php',
            data: addData,
            type: 'get',
            success: function(data) {
                alert(data);
                window.location.href = "./homepage.html";
            },
            error: function() {

                console.log('回传数据失败!');

            }
        });

    });

    //用于删除多个数据
    $('.del-btn').click(function() {
        var delData = $('#newsform').serializeArray();
        if (delData == '') {
            alert('请选择你要删除的文件');
        } else {
            $('.pro-con').css('height', $(document).height());
            $('.pro-con').show();

        }

    });
    $('#godel-btn').click(function() {
        var delData = $('#newsform').serializeArray();
        var newsKey = {
            name: 'newsKey',
            value: 'del'
        };
        delData.push(newsKey);
        console.log(delData);
        $.ajax({
            url: 'operation.php',
            data: delData,
            type: 'post',
            success: function(data) {
                alert(data);
                $('.pro-con').hide();
                window.location.reload();
            },
            error: function() {

                console.log('回传数据失败!');

            }

        });
    });
    $('#goback-btn').click(function() {
        $('.pro-con').hide();
    });
    // 用于修改数据
    //从服务器中获取相应数据赋值给修改页面
    $('.edit-btn').click(function() {
        var editData = $('#newsform').serializeArray();

        if (editData == '') {
            alert('请选择需要编辑的项目');
        } else if (editData.length > 1) {
            alert('只能选择一项进行编辑');
        } else {
            var newsKey = {
                name: 'newsKey',
                value: 'edit'
            };
            editData.push(newsKey);
            $.ajax({
                url: 'news.php',
                data: editData,
                type: 'get',
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    var newsData = data;
                    console.log(newsData[0].addtime);
                    console.log($('#addtime').val());
                    $('.control-btn').hide();
                    $('.edit-con').show();
                    $('#newsid').attr('value', newsData[0].newsid);
                    $('#newsclass').val(newsData[0].newsclass);
                    $('#newshref').val(newsData[0].newshref);
                    $('#newstitle').val(newsData[0].newstitle);
                    $('#newstext').val(newsData[0].newstext);
                    $('#newsimg1').val(newsData[0].newsimg1);
                    $('#newsimg2').val(newsData[0].newsimg2);
                    $('#newsimg3').val(newsData[0].newsimg3);
                    $('#newstype').val(newsData[0].newstype);
                    $('#retime').append('本记录于' + newsData[0].addtime + '添加，请确认修改时间');
                    $('#newstag').val(newsData[0].newstag);
                    $('#tagcolor').val(newsData[0].tagcolor);
                },
                error: function(data) {
                    console.log(data);
                }

            });

        }
    });
    //将修改好的数据传给数据库用于更新
    $('.update-btn').click(function(e) {
        e.preventDefault();
        var updateData = $('#editform').serializeArray();
        if (updateData[0].value == '') {
            alert('请选择新闻归属');
            return false;
        } else if (updateData[1].value == '') {
            alert('请填写新闻链接');
            return false;
        } else if (updateData[2].value == '') {
            alert('请填写新闻标题');
            return false;
        } else if (updateData[7].value == '') {
            alert('请选择新闻排版模式');
            return false;
        } else if (updateData[8].value == '') {
            alert('请输入时间');
            return false;
        }
        var newsArr = [{
            name: 'newsid',
            value: $('#newsid').attr('value')
        }, {
            name: 'newsKey',
            value: 'update'
        }];
        updateData = updateData.concat(newsArr);
        console.log(updateData);
        $.ajax({
            url: 'operation.php',
            data: updateData,
            type: 'get',
            success: function(data) {
                alert(data);

                window.location.reload();
            },
            error: function() {

                console.log('回传数据失败!');

            }
        });

    });

});
