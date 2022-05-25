const search = instantsearch({
  appId: 'RDZP0XC8YF',
  apiKey: '874de4e324db8e0cdba420daa4dfa281',
  indexName: 'inventory',
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