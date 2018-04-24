{pb_auth_role roles='any' smc_roles=''}<!-- list_inline - SMC User(1) -->
{*
  parent_id, parent_field, local_field are passed via for inline_list
*}

{preprocess}
      {pb_params limit=200}
    {if $smarty.request.parent_id}
    {pb_params filter="`$smarty.request.local_field` = array[`$smarty.request.parent_id`]"}
  {elseif $smarty.request.pageid !== "" && $schema->is_column('smc_associated_pages')}
    {pb_params filter="(smc_associated_pages @> array[`$smarty.request.pageid`])"}
  {/if}
  {pb_params sort="id DESC" ignore_associations=1}
{/preprocess}

{pb_better_paging limit=30}

{*
{if $pb_last_page > 1}
  <ul class="pagination">
    <li class="arrow {if $pb_current_page == 1}unavailable{/if}"><a href="#" class="btn-prev-page">&laquo;</a></li>
    {section start=1 loop=$pb_last_page name="page"}
      <li {if $pb_current_page == $smarty.section.page.iteration}class="active"{/if}><a href="#" class="btn-goto-page" data-page="{$smarty.section.page.iteration}">{$smarty.section.page.iteration}</a></li>
    {/section}
    <li class="arrow {if $pb_current_page == $pb_last_page}unavailable{/if}"><a href="#" class="btn-next-page">&raquo;</a></li>
  </ul>
{/if}
*}

{if $pb_last_page > 1}
  <ul class="pagination pagination-sm" style="padding-left: 40px">
    <li class="arrow {if $pb_current_page == 1}unavailable{/if}"><a href="#" class="btn-prev-page">&laquo;</a></li>
    {foreach from=$pages item="page"}
      <li {if $pb_current_page == $page}class="active"{/if}><a href="#" {if $page != '...'}class="btn-goto-page"{/if} data-page="{$page}">{$page}</a></li>
    {/foreach}
    <li class="arrow {if $pb_current_page == $pb_last_page}unavailable{/if}"><a href="#" class="btn-next-page">&raquo;</a></li>
  </ul>
{/if}

<table class="table table-striped">
  <thead>
  <tr>
                    <th data-sort="pb_first_name">First Name</th>
        <th data-sort="pb_last_name">Last Name</th>
      </tr>
  </thead>
  <tbody>
  {foreach from=$items item="item"}
  <tr class="editable-row" data-id="{$item->id}">
                                <td>{$item->pb_first_name->value}</td>
                          <td>{$item->pb_last_name->value}</td>
                  </tr>
      {/foreach}
  </tbody>
</table>

{literal}
  <script>
    $(function() {

      function updateShowOrder(el) {
        var $listDiv = $(el).closest('.list');
        var data = {
          no_redirect: 1,
          commtypeid: $listDiv.data('plugin'),
          item_id: $(el).closest('.editable-row').data('id')
        };

        if ($(el).attr('type') == 'checkbox') {
          data[$(el).attr('name')] = $(el).prop('checked') ? 'on' : '';
          data[$(el).attr('name') + 'pb_checkbox'] = $(el).attr('name');
        } else {
          data[$(el).attr('name')] = $(el).val();
        }

        $.ajax({
          url: '/pb/plugin/form_submit.php',
          type: 'POST',
          data: data
        });
      }

      $('.btn-prev-page').on('click', function() {
        $(this).closest('.list').trigger('prev');
      });

      $('.btn-next-page').on('click', function() {
        $(this).closest('.list').trigger('next');
      });

      $('.btn-goto-page').on('click', function() {
        var listDataDiv = $(this).closest('.list-data');
        listDataDiv.data('pb_page', $(this).data('page'));
        $(this).closest('.list').trigger('reload');
      });

      $('th[data-sort]').on('click', function() {
        var $listDiv = $(this).closest('.list');
        if ($listDiv.data('sort') == $(this).data('sort')) {
          // Reverse it
          $listDiv.data('sort', '-' + $(this).data('sort'));
        } else {
          $listDiv.data('sort', $(this).data('sort'));
        }

        $(this).closest('.list').trigger('reload');
      });

      $('.editable-row a').on('click', function(event) {
        window.location.assign($(this).attr('href'));
        event.stopPropagation();
      });

      $('tr.editable-row input[type="checkbox"][name^="show"], tr.editable-rowinput[type="checkbox"][name^="active"], tr.editable-rowinput[name^="sort_order"], tr.editable-row input[name^="show_order"]').on('click', function() {
        event.stopPropagation();
        if ($(this).attr('type') == 'text') return;
        updateShowOrder(this);
      });

      $('tr.editable-rowinput[name^="sort_order"], tr.editable-row input[name^="show_order"]').on('change', function() {
        updateShowOrder(this);
      });

      initializeEditable($('.list-smc_user'));
    });
  </script>
{/literal}
