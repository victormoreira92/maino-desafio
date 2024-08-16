import List from 'list.js';

document.addEventListener('DOMContentLoaded', () => {
    var options = {
        valueNames: ['nome', 'criacao']
    };

    var itemList = new List('listaDocumentos', options);
    document.querySelectorAll('.sort').forEach(button => {
        button.addEventListener('click', () => {
            var sort = button.getAttribute('data-sort');
            console.log(itemList);
            itemList.sort(sort);
        });
    });
});
