// var url = 'http://proyecto-laravel.com.devel:81';
var url = 'http://127.0.0.1:8000';

window.addEventListener("load", function () {
    $('.btn-like').css('cursor', 'pointer');
    $('.btn-dislike').css('cursor', 'pointer');

    function like() {
        $('.btn-like')
            .unbind('click') // deregistrar el anterior evento click (para no registrarlo multiples veces)
            .click(function () {
                console.log('like');
                $(this).addClass('btn-dislike').removeClass('btn-like'); // 'this' cambia solo al boton que se toco
                $(this).attr('src', url + '/img/heart-red.png');

                var image_id = $(this).data('id');
                $.ajax({
                    url: url + '/like/' + image_id, // cada boton tiene un diferente id
                    type: 'GET',
                    success: function (response) {
                        if (response.like) {
                            console.log('Has dado like a la publicacion (imagen): ' + image_id);
                        } else {
                            console.log('Error al dar like');
                        }
                    }
                });

                dislike(); // registrar evento dislike
            });
    }

    function dislike() {
        $('.btn-dislike')
            .unbind('click') // deregistrar el anterior evento click (para no registrarlo multiples veces)
            .click(function () {
                console.log('dislike');
                $(this).addClass('btn-like').removeClass('btn-dislike'); // 'this' cambia solo al boton que se toco
                $(this).attr('src', url + '/img/heart-black.png');

                var image_id = $(this).data('id');
                $.ajax({
                    url: url + '/dislike/' + image_id, // cada boton tiene un diferente id
                    type: 'GET',
                    success: function (response) {
                        if (response.like) {
                            console.log('Has dado dislike a la publicacion (imagen): ' + image_id);
                        } else {
                            console.log('Error al dar dislike');
                        }
                    }
                });

                like(); // registrar evento like
            });
    }

    // registrar eventos (al cargar la pagina)
    like();
    dislike();

    // BUSCADOR
    $('#buscador').submit(function (e) {
        $(this).attr('action', url + '/gente/' + $('#buscador #search').val());
    });
});
