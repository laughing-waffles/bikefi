$(document).ready(function(){
const search = instantsearch({
    appId: 'R6Y1H83FNX',
    apiKey: 'b0f283176b810e5223f70e3ab3ac7c04',
    indexName: 'albums',
    searchClient: algoliasearch(
        'B7Y6H7ORZK',
        'd891dce922face3261d109172600d2cc'
      ),
    routing: true
  });
  
  search.addWidget(
    instantsearch.widgets.searchBox({
      container: '#search-box',
      placeholder: 'Search for albums'
    })
  );
  
  search.addWidget(
    instantsearch.widgets.hits({
      container: '#hits',
      templates: {
        empty: 'No results',
        item: '<em>Hit {{objectID}}</em>: {{{_highlightResult.content.value}}}'
      }
    })
  );
  
  search.start();
});