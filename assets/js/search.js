const searchClient = algoliasearch('UF8CKBPQYZ', '2f15cc520d959080cb0333d11eb89d59');

const search = instantsearch({
  indexName: 'financing.bike',
  searchClient,
});

search.addWidgets([
  instantsearch.widgets.searchBox({
    container: '#search-box',
  }),

  instantsearch.widgets.hits({
    container: '#hits',
  })
]);

search.start();