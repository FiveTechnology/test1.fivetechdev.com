<!-- generate_form_edit.tpl -->

{pb_params ignore_associations=1}

<div class="panel-body">
  <!-- div class="heading"><h4 class="heading"><i class="icon-edit"></i> SMC User</h4></div -->
  <div class="panel-heading">
    <ul class="nav nav-tabs">
                  <li class="active">
        <a href="#section1" class="glyphicons user" data-toggle="tab"><i></i><span>main</span></a>
      </li>
                </ul>
  </div>
  <div class="container-fluid well">

    <form action="" class="form-horizontal">
      <input type="hidden" name="no_redirect" value="1">
    {pb_field base=$item}

    <div class="tab-content">

        
      <div id="section1" class="tab-pane active">

        <div class="row">
          <div class="col-md-12 col-lg-12">
                      
                                    {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if "pb_`$smarty.request.local_field`" != "pb_first_name"}
                              <div class="form-group">
                  <label class="col-md-3">First Name:</label>
                  <div class="col-md-9">
                                                                
                                            {pb_field field="pb_first_name" template=""  style="" class="form-control" }
                                      </div>
                </div>
                          {/if}{* related field *}
            
                      
                                    {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if "pb_`$smarty.request.local_field`" != "pb_last_name"}
                              <div class="form-group">
                  <label class="col-md-3">Last Name:</label>
                  <div class="col-md-9">
                                                                
                                            {pb_field field="pb_last_name" template=""  style="" class="form-control" }
                                      </div>
                </div>
                          {/if}{* related field *}
            
                      
                                    {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if "pb_`$smarty.request.local_field`" != "pb_release"}
                              <div class="form-group">
                  <label class="col-md-3">Release:</label>
                  <div class="col-md-9">
                                                                
                                            {pb_field field="pb_release" template=""  style="" class="form-control" }
                                      </div>
                </div>
                          {/if}{* related field *}
            
                      
                                    {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if "pb_`$smarty.request.local_field`" != "pb_groups"}
                              <div class="form-group">
                  <label class="col-md-3">Groups:</label>
                  <div class="col-md-9">
                                                                
                                                                                                                  {pb_field field="pb_groups" template="/pb/editor/templates/default_bootstrap1/field_output_checkbox.tpl"  style="" class="" }
                                      </div>
                </div>
                          {/if}{* related field *}
            
                      
                                    {*
              Skip the field if it's passed as parent_id from inline_list
            *}
            {if "pb_`$smarty.request.local_field`" != "pb_authentication"}
                              <div class="form-group">
                  <label class="col-md-3">authentication:</label>
                  <div class="col-md-9">
                                                                
                                            {pb_field field="pb_authentication" template=""  style="" class="form-control" }
                                      </div>
                </div>
                          {/if}{* related field *}
            
                    </div>
          
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="form-group text-center">
              {if $item->id}<button type="button" class="btn btn-danger btn-delete" data-id="{$item->id}" data-hash="{pb_item_hash id=$item->id}">Delete</button>{/if}
              <button type="button" class="btn btn-default btn-cancel-smc_user">Cancel</button>
              <button type="button" class="btn btn-primary btn-save-smc_user">Save &amp; Close</button>
            </div>
          </div>
        </div>

      </div> <!-- section end -->
        
    </div> <!-- tab-content end -->
    </form>
  </div> <!-- container-fluid end -->
</div> <!-- panel-body end -->


{literal}
  <script type="text/javascript">
    function destroy_ck() {
      try {
        for (var editorName in CKEDITOR.instances) {
          CKEDITOR.instances[editorName].destroy();
        }
      } catch(e) {

      }
    }

    function update_ck() {
      try {
        for (var editorName in CKEDITOR.instances) {
          CKEDITOR.instances[editorName].updateElement();
        }
      } catch(e) {

      }
    }

    $(function() {
      $('.btn-cancel-smc_user').on('click', function() {
        // TODO: This seems to mess up the smc_content iframe
        destroy_ck();

        actionTR = $(this).closest('.action-div');

        // Scroll to the row we clicked on

        $('html, body').animate({
          scrollTop: actionTR.prev().fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500, function() {
            $(this).removeClass('success');
          }).offset().top - 50
        }, 500);

        $(this).closest('.action-div').slideUp().empty();
      });

      /*
      $('.btn-save').on('click', function() {
        $(this).closest('form').submit();
      });
      */

      // There are show checkboxes and possibly show order input fields in inline lists, excluded those
      $('.btn-save-smc_user').on('click', function() {
        var $button = $(this);
        $button.html('Saving...');
        update_ck();
        $.ajax({
          type: 'POST',
          url: '/pb/plugin/form_submit.php',
          data: $(this).closest('form').find('input, select, textarea').not('input.inline-show').serialize(),
          dataType: 'html'
        }).done(function() {
          $button.closest('div.list').trigger('reload');
          //$button.closest('.action-div').slideUp().empty();
        });
      });
    });
  </script>
{/literal}

