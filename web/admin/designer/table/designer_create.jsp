

<div id="create_form_container" class="form-container">
    <form id="main_form" action="insert.jsp" method="get">
        <%@include file="../form_content.jsp" %>
        <p class="submit-content">
            <input onclick="formSubmit('create_form_container')" id="image_submit_btn" type="submit" value="Continue to submit">
        </p>
    </form>
    <input type="hidden" id="view_create" name="view_create" value="view_create" form="main_form"/>
    <form id="picture_upload_form" action="picture_upload.jsp" method="post" enctype="multipart/form-data">

    </form>
</div>