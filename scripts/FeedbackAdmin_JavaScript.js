$(document).ready(function () {
    
    $(function(){

    //open pop-up by clicking content button

        if ($('.reza').click) {
            $('.selectView').show();
        }
        else {
            $('.selectView').hide();
        }
    });

    //close pop-up by clicking close button
    $("[id*=btn_cancelView]").click(function () {
        $('.selectView').hide();
    });

    //if user clicks anywhere in the page it doesn't close
    $('.selectView').click(function () {
        return false;
    });
});