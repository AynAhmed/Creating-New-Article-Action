$(document).ready(function () {

    // alert("jquery is working ")

    $("#comment-body").on("input", function () {
        const value = $(this).val().trim();
        const submitButton = $(this).closest("form").find('input[type ="submit"]');

        if (value === '') {
            $(this).css("border-color", "red");
            submitButton.prop("disabled", true);
        } else {
            $(this).css("border-color", "");
            submitButton.prop("disabled", false);
        }
    });

    $('#load-comments').on('click', function () {
        const categoryId = $('#category-id').data('category');
        const articleId = $('#load-comments').data('article');

        console.log(articleId)
        console.log(categoryId)

        const url = `/categories/${categoryId}/articles/${articleId}/comments`;

        $.getJSON(url, function (data) {
            console.log(data);

            data.forEach(function (c) {

            let commenter =  `<p><strong>Commenter: </strong>${c.commenter }</p>`
            let comment =  `<p><strong>Comment: </strong>${c.body }</p>`
             // Append the "the comment and commenter as well as the like button" to the page 
            const likeButton = "<button class = 'like-button'> 👍</button>"
            $("#comments").append(commenter, comment, likeButton)
        })

            $(".like-button").on("click", function(){
                let likeCount = parseInt($(this).data("like-count")) || 0; 
                likeCount++;
                $(this).text(`👍 ${likeCount}`).data("like-count", likeCount);

                
            })

            
            });
            fail(function (jqXHR, textStatus, errorThrown) {
                console.error('Ajax error:', errorThrown);
                alert('Failed to load comments.');
    });

    
});

});