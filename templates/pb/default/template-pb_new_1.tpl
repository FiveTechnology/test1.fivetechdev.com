<!-- generate_new.tpl -->

<div class="panel-body">
  <div class="heading"><h4><i class="glyphicon glyphicon-plus"></i> SMC User <small>NEW</small></h4></div>
  <div class="panel-heading">
    <ul class="nav nav-tabs">
                  <li class="active">
        <a href="#section1" class="glyphicons user" data-toggle="tab"><i></i><span>main</span></a>
      </li>
                </ul>
  </div>
  <div class="container-fluid well">

    <form action="" class="form-horizontal">
    {pb_field base=$schema}
    {*
      Possibly from an inline list will have these request params
      parent_id: 806
      parent_field: adv_clients
      local_field: pb_client_advisor
    *}
    {if $smarty.request.parent_id && $smarty.request.local_field}
      {pb_field field="`$smarty.request.local_field`" value=$smarty.request.parent_id type="hidden"}
    {/if}
    <div class="tab-content">

          
      <div id="section1" class="tab-pane profile-tab active">
        <div class="row">
          <div class="col-md-12 col-lg-12">
                      
                        {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if $smarty.request.local_field != "pb_first_name"}
                                              <div class="form-group">
                  <label class="col-md-4">First Name:</label>
                  <div class="col-md-8">
                                                                
                      
                      {pb_field field="pb_first_name" style="" template="" class="form-control"}
                                      </div>
                </div>
                                          {/if}
                      
                        {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if $smarty.request.local_field != "pb_last_name"}
                                              <div class="form-group">
                  <label class="col-md-4">Last Name:</label>
                  <div class="col-md-8">
                                                                
                      
                      {pb_field field="pb_last_name" style="" template="" class="form-control"}
                                      </div>
                </div>
                                          {/if}
                      
                        {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if $smarty.request.local_field != "pb_release"}
                                              <div class="form-group">
                  <label class="col-md-4">Release:</label>
                  <div class="col-md-8">
                                                                
                      
                      {pb_field field="pb_release" style="" template="" class="form-control"}
                                      </div>
                </div>
                                          {/if}
                      
                        {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if $smarty.request.local_field != "pb_groups"}
                                              <div class="form-group">
                  <label class="col-md-4">Groups:</label>
                  <div class="col-md-8">
                                                                
                                                                                            
                      {pb_field field="pb_groups" style="" template="/pb/editor/templates/default_bootstrap1/field_output_checkbox.tpl" class=""}
                                      </div>
                </div>
                                          {/if}
                      
                        {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if $smarty.request.local_field != "pb_authentication"}
                                              <div class="form-group">
                  <label class="col-md-4">authentication:</label>
                  <div class="col-md-8">
                                                                
                      
                      {pb_field field="pb_authentication" style="" template="" class="form-control"}
                                      </div>
                </div>
                                          {/if}
                    </div>
          {* Was meant to be second column of fields
          <div class="col-md-12 col-lg-6">
            <div class="form-group">
              <label for="" class="col-md-4">Sample Field:</label>
              <div class="col-md-8">
                  <input type="text" class="form-control" value="example">
              </div>
            </div>
          </div>
          *}
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group text-center">
              <button type="button" class="btn btn-default btn-cancel-smc_user">Cancel</button>
              <button type="button" class="btn btn-primary btn-save-smc_user">Save &amp; Close</button>
            </div>
          </div>
        </div>

      </div> <!-- section end -->
      
        
    </div> <!-- tab end -->
    </form>
  </div> <!-- container-fluid end -->
</div>


  <script type="text/javascript">
    var pageId = '{$smarty.request.pageid}';
{literal}
    function destroy_ck() {
      try {
        for(editorName in CKEDITOR.instances) {
          CKEDITOR.instances[editorName].destroy();
        }
      } catch(e) {
        // Skip
      }
    }

    function update_ck() {
      try {
        for(editorName in CKEDITOR.instances) {
          CKEDITOR.instances[editorName].updateElement();
        }
      } catch(e) {
        // Skip
      }
    }

    $(function() {

      // Automate page association maybe
      if (pageId != '') {
        $('select[name^="smc_associated_pages"]').val(pageId);
        $('select[name^="smc_associated_pages"]').trigger('chosen:updated');
        $('select[name^="smc_associated_pages"]').trigger('liszt:updated');
      }

      $('.btn-cancel-smc_user').on('click', function() {
        $(this).closest('.action-div').slideUp().empty();
      });

      $('.btn-save').on('click', function() {
        $(this).closest('form').submit();
      });

      $('.btn-save-smc_user').on('click', function() {
        var $button = $(this);
        $button.html('Saving...');
        update_ck();
        $.ajax({
          type: 'POST',
          url: '/pb/plugin/form_submit.php',
          data: $(this).closest('form').append('<input type="hidden" name="no_redirect" value="1">').serialize(),
          dataType: 'html'
        }).done(function(response) {
          // Notification maybe then close
          //$.gritter.add({title: 'Success', text: "Baaaaamm!!! Client was updated"});
          $button.closest('.list').trigger('reload');
          destroy_ck();
          $button.closest('.action-div').slideUp().empty();
          // Refresh the closest list
        });
      });
    });
  </script>
{/literal}

