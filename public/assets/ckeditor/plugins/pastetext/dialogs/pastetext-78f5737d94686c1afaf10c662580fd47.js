/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){CKEDITOR.dialog.add("pastetext",function(e){return{title:e.lang.pasteText.title,minWidth:CKEDITOR.env.ie&&CKEDITOR.env.quirks?368:350,minHeight:240,onShow:function(){this.setupContent()},onOk:function(){this.commitContent()},contents:[{label:e.lang.common.generalTab,id:"general",elements:[{type:"html",id:"pasteMsg",html:'<div style="white-space:normal;width:340px;">'+e.lang.clipboard.pasteMsg+"</div>"},{type:"textarea",id:"content",className:"cke_pastetext",onLoad:function(){var t=this.getDialog().getContentElement("general","pasteMsg").getElement(),n=this.getElement().getElementsByTag("textarea").getItem(0);n.setAttribute("aria-labelledby",t.$.id),n.setStyle("direction",e.config.contentsLangDirection)},focus:function(){this.getElement().focus()},setup:function(){this.setValue("")},commit:function(){var t=this.getValue();setTimeout(function(){e.fire("paste",{text:t})},0)}}]}]}})})();