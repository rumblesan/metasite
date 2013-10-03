/*jslint browser: true */
/*global $ */

'use strict';

var PoemFuncs = function () {
    console.log('Created Poem Functions');
};

PoemFuncs.prototype.updatePoems = function (newpoems) {

    var i, poemlist, poem, author, text;

    $('#content .poems li').remove();

    poemlist = $('#content .poems ul');

    for (i = 0; i < newpoems.length; i += 1) {
        author = newpoems[i].author;
        text = newpoems[i].text;
        poem = $('<li></li>')
            .append('<div class="col-sm-2">' + author + '</div>')
            .append('<div class="col-sm-10">' + text + '</div>');
        poemlist.append(poem);
    }

};

$(document).ready(function () {

    var currentid, poemfuncs;

    currentid = null;

    poemfuncs = new PoemFuncs();

    $('#nextpoems').click(function () {
        var url;
        console.log('next');

        if (currentid) {
            url = '/service/poems/site?latestId=' + currentid.toString();
        } else {
            url = '/service/poems/site';
        }

        $.get('/service/poems/site', function (data) {
            currentid = data[data.length].id;
            poemfuncs.updatePoems(data);
        }).fail(function () {
            console.log('failure');
        });
    });

    $('#backpoems').click(function () {
        var url;
        if (currentid) {
            currentid -= 10;
            url = '/service/poems/site?latestId=' + currentid.toString();
        } else {
            url = '/service/poems/site';
        }

        $.get('/service/poems/site', function (data) {
            currentid = data[data.length].id;
            poemfuncs.updatePoems(data);
        }).fail(function () {
            console.log('failure');
        });

    });

});

