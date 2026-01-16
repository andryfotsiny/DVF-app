Vue.component('boite', {
    props: ['couleur', 'valeur', 'icone', 'texte'],

    template: `<div class="media d-flex" style="padding: 8px 0;">
        <div class="align-self-center ml-1 mr-1">
            <i :class="'fa-2x fa-fw ' + icone"></i>
        </div>
        <div class="media-body text-left ml-1">
            <b>{{valeur}}</b><br>
            <span>{{texte}}</span>
        </div>
    </div>`
});