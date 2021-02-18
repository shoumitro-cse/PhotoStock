

<div id="add_image_form_container" class="form-container">
    <form id="add_form_id" action="" method="get">
        <%@include file="../form_content.jsp" %>
        <input type="hidden" id="add_form" name="view_create" value="view_create" />
        <p class="submit-content">
            <input onclick="addImageForm('add_image_form_container')" type="submit" value="Continue to submit">
        </p>
    </form>
    <form id="image_picture_upload_form" action="picture_upload.jsp" method="post" enctype="multipart/form-data">

    </form>
</div>