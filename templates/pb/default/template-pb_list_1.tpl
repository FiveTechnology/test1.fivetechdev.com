{pb_auth_role roles='any' smc_roles=''}{if ! $inline}{include file="template-pb_header_1.tpl"}{/if}
<!-- list - SMC User(1) -->
{pb_params no_items=1}
{pb_create_breadcrumb name="SMC User List"}

  <script>
    {if ! $inline}
      var itemId = '{$smarty.request.item_id}';
    {else}
      var itemId = 0;
    {/if}

    {literal}
      $(function() {
        initializeList2($('.list-smc_user'), itemId);
      });
    {/literal}
  </script>

{*
  parent_id, parent_field, local_field are passed via include for inline list
*}
<div class="list list-smc_user panel panel-default" style="margin-top: 15px;" data-pageid="{$smarty.request.pageId}" data-parent_id="{$parent_id}" data-parent_field="{$parent_field}" data-local_field="{$local_field}" data-plugin="smc_user" data-list="list_inline" data-new="default_new" data-edit="default_form_edit" data-filter="default_form_filter">
  <div class="panel-heading">
    <h3 class="text-primary inline-h3"><!-- i class="glyphicon glyphicon-list"></i --> SMC User <small>LIST</small>
      <button type="button" class="btn btn-icon btn-default pull-right btn-csv" style="margin-left:15px;"><span class="glyphicon glyphicon-download-alt text-primary"> CSV</span></button>
      <button type="button" class="btn btn-icon btn-default pull-right btn-new" style="margin-left:15px;"><span class="glyphicon glyphicon-plus text-primary"> New</span></button>
      <button type="button" class="btn btn-icon btn-default pull-right btn-filter"><span class="glyphicon glyphicon-search text-primary"> Filter</span></button>
    </h3>
  </div>
  <div class="new action-div load-form"></div>
  <div class="filter load-form"></div>
  <div class="list-data"></div>
</div>

<script>
  var csvUrl = '/pb/plugin/par.php?commtypeid=1&template=default_export_csv&pageId={$smarty.request.pageId}';
  var openNew = '{$smarty.get.open_new}';
  var referrer = '{$smarty.get.referrer}';
  {literal}

  $(function() {

    if (openNew) {
      $('button.btn-new').click();
    }

    $('.btn-csv').on('click', function() {
      window.location = csvUrl;
    });

    $('.btn-cancel').on('click', function() {
      $(this).closest('.action-div').slideUp().empty();
    });

  });
  {/literal}
</script>

{if ! $inline}{include file="template-pb_footer_1.tpl"}{/if}
