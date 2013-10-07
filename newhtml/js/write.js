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

    $.ajax({
        type: 'POST',
        url: '/service/submit/poem',
        data: {
            author: author,
            text: poem
        },
        success: function () {
            console.log('success');
            $('#submitpage form').remove();
            $('#submitpage').html('thankyou for submitting a poem');
        },
        error: function () {
            console.log('errror');
            console.log($('#submitpage form'));
            $('#submitpage form').remove();
            $('#submitpage').html('Sorry, there was a problem submitting the poem');
        }
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

