

<div class="update-box-content">
    <div id="update_form_container" class="form-container">
        <p style="text-align: center;margin: 0 0 20px 0;background-color: forestgreen;color: #fff" class="form-panel-head">
            Update Form
            <span onclick="updateImageFormBoxClose()" style="float: right;cursor: pointer;" class="fa fa-close"></span>
        </p>
        <form style="padding: 0 10px 3px 10px" id="image_update_form" action="update.jsp" method="get" >
            <%@include file="form_content.jsp" %>
            <p  class="submit-content">
                <input onclick="addImageForm('update_form_container')"  type="submit" value="Continue to submit">
            </p>
        </form>
        <form id="image_picture_upload_form" action="picture_upload.jsp" method="post" enctype="multipart/form-data">

        </form>
    </div>
</div>

