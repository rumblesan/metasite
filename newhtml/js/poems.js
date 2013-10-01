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
        console.log('next');
    });

    $('#backpoems').click(function () {
        console.log('last');

        var data = [
            {
                author: 'Guy',
                text: 'Some text'
            },
            {
                author: 'Foo    jj',
                text: 'Some text'
            },
            {
                author: 'aegwegeg',
                text: 'kl;adjgh;oearhgo;aehrgoeg'
            },
        ];
        poemfuncs.updatePoems(data);

        /*
        $.get({
            url: '/service/poems',
            success: function () {
                console.log('success');
            },
            failure: function () {
                console.log('failure');
            }
        });
        */
    });

});

