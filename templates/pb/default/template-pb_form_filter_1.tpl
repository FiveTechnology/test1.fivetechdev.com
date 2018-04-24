{pb_auth_role roles='any' smc_roles=''}
<div class="panel-body">
  <!-- h4 class="heading"><i class="icon-edit"></i> SMC User <small>FILTER</small></h4 -->
  <div class="container-fluid well">
    <form action="" class="form-horizontal">
      {pb_field base="smc_user"}
      {* Inline list filter by parent id *}
      {if $smarty.request.parent_id}
        {pb_field field="`$smarty.request.local_field`" value=$smarty.request.parent_id type="hidden"}
      {/if}
      <div class="row">
        <div class="col-md-12 col-lg-6">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          </div>
        {*
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
            <button type="button" class="btn btn-warning btn-reset">Reset</button>
            <button type="button" class="btn btn-default btn-cancel">Cancel</button>
            <button type="button" class="btn btn-primary btn-search">Apply Search</button>
          </div>
        </div>
      </div>

    </form>
  </div>
</div>
