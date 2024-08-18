import List from 'list.js';
import Swal from "sweetalert2";

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
document.addEventListener('DOMContentLoaded', () => {
    const showAlertButton = document.querySelector('#show-alert');

    if (showAlertButton) {
        showAlertButton.addEventListener('click', () => {
            Swal.fire({
                title: 'Alerta!',
                text: 'Isso é um alerta!',
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        });
    }
});

document.addEventListener('turbo:load', () => {
    const deleteButtons = document.querySelectorAll('.delete-document');

    deleteButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            event.preventDefault(); // Impede o comportamento padrão do botão

            const url = button.getAttribute('data-url');

            Swal.fire({
                title: 'Tem certeza?',
                text: 'Caso haja relatórios associados ao documento, ' +
                    'os mesmos também serão apagados, após essa ação',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sim, delete!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Envia uma solicitação DELETE para a URL
                    fetch(url, {
                        method: 'DELETE',
                        headers: {
                            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                        }
                    })
                        .then(response => {
                            if (response.ok) {
                                Swal.fire(
                                    'Deletado!',
                                    'Seu documento foi deletado.',
                                    'success'
                                ).then(() => {
                                    // Opcional: Redirecionar ou atualizar a página
                                    window.location.reload();
                                });
                            } else {
                                Swal.fire(
                                    'Erro!',
                                    'Houve um problema ao deletar o documento.',
                                    'error'
                                );
                            }
                        })
                        .catch(() => {
                            Swal.fire(
                                'Erro!',
                                'Houve um problema ao deletar o documento.',
                                'error'
                            );
                        });
                }
            });
        });
    });
});

