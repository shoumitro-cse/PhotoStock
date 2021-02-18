<div class="p_row">
    <div class="col-content m-20">
        <p class="col-heading">Admin Information</p> 
        <div class="m-20"> 
            <input type="hidden" id="admin_id"  name="admin_id" value="0">

            <label for="fullname">Fullname </label>
            <input type="text" id="fullname"  name="fullname" placeholder="Fullname..">

            <br/>
            <label for="email">Email </label>
            <input type="email" id="email" name="email" placeholder="john12@gmail.com">
            <br/>
            <label for="password">Password </label>
            <input type="password" id="password" name="password" placeholder="Password..">
        </div>
    </div>
</div>
<div class="f-submit-content">
    <input onclick="adminFormValidation('insert_form_container')" id="submit_btn" class="btn-active" type="submit" value="Save">
    <span class="text-success-msg">Updated successfully</span>
</div>