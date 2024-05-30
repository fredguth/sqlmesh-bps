```sql tables
    select distinct table_name, '/'|| schema_name || '/' || table_name as table_url, table_description from metadata where schema_name = '${params.dataset}'
``` 
```sql columns
    select distinct * from metadata where schema_name = '${params.dataset}' and table_name = '${params.table}'
``` 





    <div class="grid grid-cols-6 gap-4">

	<div class="col-span-1 bg-gray-100 p-4">

        **[Home](/)**

        <h2 class="pl-2 text-lg font-bold capitalize">
            <a href="/{params.dataset}">{params.dataset}</a>
        </h2>

		{#each tables as table}
            {#if table.table_name != params.table}
                <a href={table.table_url} class="block p-2 pl-6 text-blue-800 hover:bg-blue-100">{table.table_name}</a>
            {:else}
               <span class="block p-2 pl-6">{table.table_name}</span>
            {/if}
        {/each}
	
        
    </div>
	
	<div class="col-span-5 p-4">
	
    <h1 class="text-lg font-bold capitalize">{params.table}</h1>

    <quote>
    <Value data={columns} column="table_description"/>
    </quote>
    
<Tabs>
    <Tab label="Usage">
        Here I want to show links to download the data as parquet or csv (utf8 and latin1).
        maybe show how to connect to the data using python or R.
    </Tab>  
    
    <Tab label = "Documentation">
        <DataTable data={columns} rows=all search=true > 
    <Column id=column_name/>
    <Column id=data_type/> 
    <Column id=column_description title="Description"/> 	 
	
</DataTable>
    </Tab>	
      
    <Tab label="Quality" >
    
    Here I want to show the audits of SQLMesh
    </Tab>
    <Tab label="Lineage" >
    Here I want to show the dag image from SQLMesh
    </Tab>
    <Tab label="Metadata" >
    Here I want to show table metadata
    </Tab>
    </Tabs>
	</div>
	
	</div>

