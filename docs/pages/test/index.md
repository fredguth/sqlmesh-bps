```sql tables
    select distinct table_name, '/'|| schema_name || '/' || table_name as table_url, table_description from metadata where schema_name = '${params.dataset}'
``` 
```sql columns
    select distinct * from metadata where schema_name = '${params.dataset}' and table_name = '${params.table}'
``` 



    <div class="grid grid-cols-6 gap-4">

	<div class="col-span-1 bg-gray-100 p-4">

        <h1 class="text-lg font-bold capitalize">{params.dataset}</h1>

        <!-- <h4 class="font-bold">Tables</h4> -->

		{#each tables as table}
            {#if table.table_name != params.table}
                <a href={table.table_url} class="block p-2 text-blue-800 hover:bg-blue-100">{table.table_name}</a>
            {:else}
               <span class="block p-2">{table.table_name}</span>
            {/if}
        {/each}
	
        
    </div>
	
	<div class="col-span-5 p-4">
	
    <h1 class="text-lg font-bold capitalize">{params.dataset}</h1>

    
    <DataTable data={tables} link = table_url/>
	  
	</div>
	
	</div>