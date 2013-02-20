## Licensed to Cloudera, Inc. under one
## or more contributor license agreements.  See the NOTICE file
## distributed with this work for additional information
## regarding copyright ownership.  Cloudera, Inc. licenses this file
## to you under the Apache License, Version 2.0 (the
## "License"); you may not use this file except in compliance
## with the License.  You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

<%!
  from desktop.views import commonheader, commonfooter
  from django.utils.translation import ugettext as _
%>

<%namespace name="layout" file="layout.mako" />
<%namespace name="macros" file="macros.mako" />

${ commonheader(_('Search'), "search", user) | n,unicode }

<%layout:skeleton>
  <%def name="title()">
    <h1>${_('Search Admin - ')}${hue_core.name}</h1>
  </%def>
  <%def name="navigation()">
    ${ layout.sidebar(hue_core.name, 'schema') }
  </%def>
  <%def name="content()">
    <textarea id="schema">
    ${ solr_schema.decode('utf-8') }
    </textarea>
  </%def>
</%layout:skeleton>


<script src="/static/ext/js/codemirror-3.0.js"></script>
<link rel="stylesheet" href="/static/ext/css/codemirror.css">
<script src="/static/ext/js/codemirror-xml.js"></script>


<script type="text/javascript">
  $(document).ready(function () {
    var schemaViewer = $("#schema")[0];

    var codeMirror = CodeMirror(function (elt) {
      schemaViewer.parentNode.replaceChild(elt, schemaViewer);
    }, {
      value: schemaViewer.value,
      readOnly: true,
      lineNumbers: true
    });

    codeMirror.setSize("100%", $(document).height() - 150);

  });
</script>

${ commonfooter(messages) | n,unicode }