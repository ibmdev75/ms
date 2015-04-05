/**
 * editor_plugin_src.js
 *
 * Clone selected styles and attributes of the element
 * that the editor replaced.
 *
 * Copyright 2009, 2012 Moxiecode Systems AB
 * Released under LGPL License.
 *
 * Copyright 2012 Roger A. Krupski
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */
(function () {
    var DOM = tinymce.DOM;
    tinymce.create('tinymce.plugins.ClonePlugin', {
        init : function (ed, url) {
            var t = this;
            ed.onPostRender.add (function (ed, cm) {
                var s, c, d, v;
                var ifr = DOM.get(ed.id + '_ifr'); // editor iframe element
                var body = ed.getBody() // editor body element
                var txt = ed.getElement(); // element that tinymce replaced (usually a textarea)
                s = ed.getParam('theme_advanced_clone_styles', false); // get list of styles to clone

                if (s) {
                    s = s.split(',');
                    c = s.length;
                    while (c--) {
                        d = t.camelCase(s[c]); // convert dash-ed to camelCase if necessary
                        v = DOM.getStyle(txt, d, true); // get runtime style
                        if (v) {
                            DOM.setStyle(body, d, String(v)); // set editor body styles
                        }
                    }
                }

                s = ed.getParam('theme_advanced_clone_attributes', false); // get list of attributes to clone

                if (s) {
                    s = s.split(',');
                    c = s.length;
                    while (c--) {
                        d = t.camelCase(s[c]); // convert dash-ed to camelCase if necessary
                        v = DOM.getAttrib(txt, d, false); // get runtime attribute or false if none
                        if (v) {
                            DOM.setAttrib(ifr, d, String(v)); // set editor iframe attributes
                        }
                    }
                }

            });

        },

        // convert dash-ed to camelCase
        camelCase : function (h) {
            return h.replace(/\-(\D)/g, function (a, b) {
                return b.toUpperCase();
            });
        },


        getInfo : function () {
            return {
                longname : 'Clone',
                author : 'Roger A. Krupski',
                authorurl : 'three-dog.homelinux.com',
                infourl : 'mailto:rakrupski@verizon.net',
                version : tinymce.majorVersion + "." + tinymce.minorVersion
            };
        }

    });

    // Register plugin
    tinymce.PluginManager.add('clone', tinymce.plugins.ClonePlugin);

})();