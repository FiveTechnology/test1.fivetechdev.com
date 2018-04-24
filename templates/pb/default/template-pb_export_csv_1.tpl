{pb_auth_role roles='any' smc_roles=''}{pb_params content_type="csv" filter="1=1" output_file="smc_user"}

{assign var=csv_header value="Id"}

          {append var=csv_header value="First Name"}
          {append var=csv_header value="Last Name"}
          {append var=csv_header value="Release"}
          {append var=csv_header value="Groups"}
          {append var=csv_header value="authentication"}
  

{$csv_header|@to_csv}
{foreach from=$items item="my_item"}
  {assign var="csv_line" value=$my_item->id}
                  {if $my_item->pb_first_name->value}
        {append var="csv_line" value=$my_item->pb_first_name->value}
      {else}
        {append var="csv_line" value=''}
      {/if}
                    {if $my_item->pb_last_name->value}
        {append var="csv_line" value=$my_item->pb_last_name->value}
      {else}
        {append var="csv_line" value=''}
      {/if}
                  {if $my_item->pb_release->value}
      {append var="csv_line" value=1}
    {else}
      {append var="csv_line" value=0}
    {/if}
                    {if $my_item->pb_groups->value}
        {append var="csv_line" value=$my_item->pb_groups->value}
      {else}
        {append var="csv_line" value=''}
      {/if}
                    {if $my_item->pb_authentication->value}
        {assign var=app value=''}
        {append var="csv_line" value=$my_item->pb_authentication->lookupValue()}
      {else}
        {append var="csv_line" value=''}
      {/if}
              {$csv_line|@to_csv}
{/foreach}
