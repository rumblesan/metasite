/*jslint browser: true */
/*global $ */

'use strict';

var WriteFuncs = function () {
    console.log('Created Write Functions');
};

WriteFuncs.prototype.submitPoem = function (newpoems) {

    var author, poem;
    author = $('#author').val();
    poem = $('#poem').val();

    $.post('/service/submit/poem', {
        author: author,
        text: poem
    }, function () {
        console.log(author, poem);
    });

};

$(document).ready(function () {

    var writeFuncs;

    writeFuncs = new WriteFuncs();

    $('button').click(function (e) {
        console.log(e);
        e.preventDefault();
        writeFuncs.submitPoem();
        return false;
    });

});

