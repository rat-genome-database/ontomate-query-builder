


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="Rat Genome Database">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE, NO-STORE, MUST-REVALIDATE">
    <meta name="author" content="RGD">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="referrer" content="origin">
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate, max-age=0, private" />
    <meta http-equiv="Expires" content="0" />

    <meta name="description" content="The Rat Genome Database houses genomic, genetic, functional, physiological, pathway and disease data for the laboratory rat as well as comparative data for mouse and human.  The site also hosts data mining and analysis tools for rat genomics and physiology" />



    <title>Rat Genome Database</title>

    <link rel="stylesheet" href="https://rgd.mcw.edu/rgdweb/css/jquery/jquery-ui-1.8.18.custom.css">
    <link rel="SHORTCUT ICON" href="/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/rgdweb/common/modalDialog/subModal.css" />
    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/rgdweb/common/modalDialog/style.css" />
    <link href="https://rgd.mcw.edu/rgdweb/common/rgd_styles-3.css?v=1" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://rgd.mcw.edu/rgdweb/OntoSolr/jquery.autocomplete.css" type="text/css" />
    <link rel="stylesheet" href="https://rgd.mcw.edu/rgdweb/css/webFeedback.css" type="text/css"/>

    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/modalDialog/common.js"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/modalDialog/subModal.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12/dist/vue.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.3/axios.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script src="/rgdweb/js/webFeedback.js" defer></script>

    <!--script src="/rgdweb/js/jquery/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="/rgdweb/js/jquery/jquery_combo_box.js"></script-->

    <script src="https://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript">
        _uacct = "UA-2739107-2";
        urchinTracker();
    </script>
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BTF869XJFG"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-BTF869XJFG');
    </script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/js/rgdHomeFunctions-3.js"></script>



    <script>
        function getLoadedObject() {
            return "";
        }
        function getGeneWatchAttributes() {
            //return ["Nomenclature Changes","New GO Annotation","New Disease Annotation","New Phenotype Annotation","New Pathway Annotation","New PubMed Reference","Altered Strains","New NCBI Transcript/Protein","New Protein Interaction","RefSeq Status Has Changed"];
            return ["Nomenclature Changes","RefSeq Status Has Changed","New GO Annotation","New Disease Annotation","New Phenotype Annotation","New Pathway Annotation","New Strain Annotation","New PubMed Reference","New NCBI Transcript/Protein","New Protein Interaction","New External Database Link"]
        }
        function getTermWatchAttributes() {
            return ["Nomenclature Changes","RefSeq Status Has Changed","New GO Annotation","New Disease Annotation","New Phenotype Annotation","New Pathway Annotation","New Strain Annotation","New PubMed Reference","New NCBI Transcript/Protein","New Protein Interaction","New External Database Link"]
        }
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/https://rgd.mcw.edurgdweb/css/elasticsearch/elasticsearch.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/angular/1.4.8/angular.js"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/common/angular/1.4.8/angular-sanitize.js"></script>
    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/my/my.js?5"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/rgdweb/common/jquery-ui/jquery-ui.css">
    <script src="https://rgd.mcw.edu/rgdweb/common/jquery-ui/jquery-ui.js"></script>

    <script type="text/javascript" src="https://rgd.mcw.edu/rgdweb/js/elasticsearch/elasticsearchcommon.js"></script>
</head>

<style>
    a {
        color:#0C1D2E;
        olor:#073C66;
        text-decoration:underline;
        ont-weight:700;
    }
    .speciesCardOverlay {
        position:absolute;
        background-color:#2865a3;
        minWidth:63px;
        width:63px;
        height:63px;
        z-index:30;
        opacity:0;
    }
    .speciesCardOverlay:hover {
        opacity:.9;
        cursor:pointer;
        color:white;
    }
    .speciesIcon {
        border:1px solid black;
        padding:3px;
    }
</style>

<link href="https://fonts.googleapis.com/css?family=Marcellus+SC|Merienda+One&display=swap" rel="stylesheet">


<body  ng-cloak ng-app="rgdPage"  data-spy="scroll" data-target=".navbar" data-offset="10" style="position: relative;">


<div ng-controller="RGDPageController as rgd" id="RGDPageController">


    <div class="container-fluid">
        <!-- Modal -->
        <div class="modal fade" id="my-modal" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="rgd-modal" >

                    <!-- twitter boot strap model -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <table align="center">
                            <tr>
                                <td style="padding:20px;"><img src="https://rgd.mcw.edu/rgdweb/common/images/rgd_LOGO_blue_rgd.gif" border="0"/></td>
                            </tr>
                        </table>

                    </div>
                    <div class="modal-body">

                        <div style="padding-bottom:20px;">
                            <div style="float:left; margin-right:10px; min-width: 600px;">Welcome <span style="font-weight:700; font-size:16px;">{{ username}}</span></div>
                            <input  value="Update Account" type="button"  style="margin-right:10px;border:0px solid black; background-color:#4584ED; color:white; font-weight:700;padding:8px;" onClick="location.href='https://rgd.mcw.edu/rgdweb/my/account.html'"/>
                            <input  value="Sign Out" type="button"  ng-click="rgd.logout()"  data-dismiss="modal" style="margin-right:10px;border:0px solid black; background-color:#4584ED; color:white; font-weight:700;padding:8px;"/>
                        </div>

                        <div style="text-decoration:underline;font-weight:700; background-color:#e0e2e1;min-width:690px;">Message Center</div>
                        <div style="display:table-row;">
                            <div style="display: table-cell; float:left; margin-right:10px; min-width: 600px;font-size:13px;padding-bottom: 10px;">{{ messageCount }} Messages</div>
                            <div style="display: table-cell; float:left; margin-right:10px;min-width: 90px"><a href="https://rgd.mcw.edu/rgdweb/my/account.html">Go to Message Center</a></div>
                        </div>

                        <div style="text-decoration:underline;font-weight:700; background-color:#e0e2e1;">Watched Genes</div>
                        <div ng-repeat="watchedObject in watchedObjects" style="display:table-row;">

                            <div style="display: table-cell; float:left; margin-right:10px; min-width: 600px;">{{$index + 1}}. <span style="font-weight:700;">{{ watchedObject.symbol }} (RGD ID:{{watchedObject.rgdId}})</span></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 40px;"><a href="javascript:return false;" ng-click="rgd.addWatch(watchedObject.rgdId)">Update Watcher</a></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px;" ><a href="javascript:return false;" ng-click="rgd.removeWatch(watchedObject.rgdId)">Remove Watcher</a></div>
                        </div>
                        <div style="margin-top:20px;text-decoration:underline;font-weight:700;background-color:#e0e2e1;">Watched Ontology Terms</div>
                        <div ng-repeat="watchedTerm in watchedTerms" style="display:table-row;">

                            <div style="display: table-cell; float:left; margin-right:10px; min-width: 600px;">{{$index + 1}}. <span style="font-weight:700;">{{ watchedTerm.term }} ({{watchedTerm.accId}})</span></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 40px;"><a href="javascript:return false;" ng-click="rgd.addWatch(watchedTerm.accId)">Update Watcher</a></div>
                            <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px;" ><a href="javascript:return false;" ng-click="rgd.removeWatch(watchedTerm.accId)">Remove Watcher</a></div>
                        </div>


                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close Window</button>
                    </div>




                    <div ng-repeat="gene in geneList" style="padding-left:10px;">
                        <span style="font-weight:700; ">{{gene.symbol}}:</span> {{ gene.description }}
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- twitter bootstrap modal Save List to RGD-->

    <div class="container-fluid" >

        <!-- Modal -->
        <div class="modal fade" id="name-desc-modal" role="dialog">
            <div class="modal-dialog modal-small">
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Save List to My RGD</h4>
                    </div>
                    <div class="modal-body">
                        <table align="center">
                            <tr>
                                <td>Create Name:&nbsp;&nbsp;</td>
                                <td><input id="myRgdListName" size="40" type="text" value="{{listName}}" ng-model="listName"/></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Description:&nbsp;&nbsp;</td>
                                <td><input id="myRgdListDesc" size="40" type="text" value="{{listDescription}}" ng-model="listDescription"/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" ng-click="rgd.saveList($event)" class="btn btn-default" data-dismiss="modal">Save List</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!--  Login box -------------->
    <div class="ontainer-fluid" >

        <!-- Modal -->
        <div class="modal fade" id="login-modal" role="dialog">
            <div class="modal-dialog modal-small">
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <table align="center">
                            <tr>
                                <td style="padding:20px;"><img src="https://rgd.mcw.edu/rgdweb/common/images/rgd_LOGO_blue_rgd.gif" border="0"/></td>
                            </tr>
                        </table>

                    </div>
                    <div class="modal-body">

                        <table align="center" style="padding-bottom:20px;">
                            <tr>
                                <td align="center" style="font-size:30px;color:#55556D;">Save what matters to you</td>
                            </tr>
                            <tr>
                                <td style="color:red;font-weight:700; font-size:18px;">{{ loginError }}</td>
                            </tr>
                        </table>



                        <table align="center">
                            <tr>
                                <td style="font-size:20px;">Sign in with your RGD account</td>
                            </tr>
                        </table>


                        <form>
                            <table align="center" border=0 style="border:2px outset lightgrey;background-color:#F7F7F7;padding:40px;">
                                <tr>
                                    <td>Email Address:</td>
                                    <td><input type='text' size='30' id="j_username" name='j_username' value="" value=''</td></tr>
                                <tr><td>Password:</td><td><input  size='30' type='password' id="j_password" name='j_password' value=""></td></tr>

                                <tr>
                                    <td align="center" colspan="2">
                                        <table cellpadding="5">
                                            <tr>
                                                <td><input name="submit"  data-dismiss="modal" type="button" value="Cancel" style="font-size:16px; margin-top:20px;"></td>
                                                <td><input name="submit" type="submit" value="Log In" style="font-size:16px; margin-top:20px;" ng-click="rgd.login()"  nClick="doLogin()" ></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </tr>
                            </table>

                        </form>


                        <table align="center" border="0">
                            <tr>
                                <td>
                                    <a href="https://rgd.mcw.edu/rgdweb/my/account.html?submit=Create" style="font-size:16px; margin-right:10px;">Create New Account</a>
                                </td>
                                <td>
                                    <a href="https://rgd.mcw.edu/rgdweb/my/lookup.html" style="font-size:16px;">Recover Password</a>
                                </td>
                            </tr>
                        </table>


                    </div>
                </div>
            </div>
        </div>

        <!-- watch object select window-->

        <div class="container-fluid" >

            <!-- Modal -->
            <div class="modal fade" id="watch-modal" role="dialog">
                <div class="modal-dialog modal-small">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">{{ watchLinkText }}</h4>
                        </div>
                        <div class="modal-body">

                            <div style="padding-bottom:10px;">Select categories you would like to watch.  Updates to this gene will be send to {{ username }}</div>

                            <label ng-repeat="geneWatchAttr in geneWatchAttributes">
                                <input
                                        type="checkbox"
                                        name="geneWatchSelection[]"
                                        value="{{geneWatchAttr}}"
                                        ng-checked="geneWatchSelection.indexOf(geneWatchAttr) > -1"
                                        ng-click="toggleGeneWatchSelection(geneWatchAttr)"
                                > {{geneWatchAttr}}
                                <br>
                            </label>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                            <span ng-if="watchLinkText == 'Update Watcher'">
                        <button type="button" ng-click="rgd.removeWatch(activeObject)" class="btn btn-default" data-dismiss="modal">Stop Watching</button>
                    </span>
                            <button type="button" ng-click="rgd.saveWatch(activeObject)" class="btn btn-default" data-dismiss="modal">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--  tool navigation -->
        <!-- twitter bootstrap modal Save List to RGD-->

        <div class="container-fluid" >

            <!-- Modal -->
            <div class="modal fade" id="tools-modal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <table width="100%">
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                    <td><h4 style="font-size:16px;" class="modal-title">Analyze <span ng-if="oKey==1">Gene</span><span ng-if="oKey==5">Strain</span><span ng-if="oKey==6">QTL</span>  List</h4></td>
                                    <td align="right"><button type="button" class="close" data-dismiss="modal">&times;</button></td>
                                    <td>&nbsp;&nbsp;&nbsp;</td>
                                </tr>
                            </table>



                        </div>
                        <div class="modal-body">

                            <table width="90%" align="center" border="0">
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"><img src="https://rgd.mcw.edu/rgdweb/common/images/functionalAnnotation.png" border="0"  style="cursor:pointer;padding:5px; margin-right:0px;margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('ga')"/></div><div ng-if="oKey!=1">Gene Annotator (Functional Annotation)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"> <img src="https://rgd.mcw.edu/rgdweb/common/images/annotDist.PNG" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('distribution')"/></div><div ng-if="oKey!=1">Gene Annotator (Annotation Distribution)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" ><img src="/rgdweb/common/images/variantVisualizer.png" border="0"  style="cursor:pointer;padding:5px; margin-right:0px;margin-bottom:5px; border:1px solid black;"  ng-click="rgd.toolSubmit('vv')"/></div><div ng-if="speciesTypeKey!=1 && speciesTypeKey!=3 && speciesTypeKey !=6">Variant Visualizer (Genomic Variants)<br> unavailble</div></div><div ng-if="oKey!=1">Variant Visualizer (Genomic Variants)<br>unavailable</div></td>
                                </tr>
                                <tr>
                                    <td align="center"  style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('ga')"><div ng-if="oKey==1">Gene Annotator (Functional Annotation)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('distribution')"><div ng-if="oKey==1">Gene Annotator (Annotation Distribution)</div></td>

                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('vv')"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" ><div ng-if="oKey==1">Variant Visualizer (Genomic Variants)</div></div></td>

                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"><img src="https://rgd.mcw.edu/rgdweb/common/images/interviewer.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('interviewer')"/></div><div ng-if="oKey!=1">InterViewer (Protein-Protein Interactions)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==2 || speciesTypeKey==5 || speciesTypeKey==6 || speciesTypeKey==9" ><div ng-if="oKey==1"> <img src="https://rgd.mcw.edu/rgdweb/common/images/gviewer.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('gviewer')"/></div></div><div ng-if="oKey!=1 || speciesTypeKey == 4 || speciesTypeKey==7 || speciesTypeKey==8">Gviewer (Genome Viewer)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" > <img src="https://rgd.mcw.edu/rgdweb/common/images/damaging.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('damage')"/></div><div ng-if="speciesTypeKey!=1 && speciesTypeKey!=3 && speciesTypeKey!=6">Variant Visualizer (Damaging Variants) unavailble</div></div><div ng-if="oKey!=1">Variant Visualizer (Damaging Variants)<br>unavailable</div></td>
                                </tr>
                                <tr>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('interviewer')"><div ng-if="oKey==1">InterViewer (Protein-Protein Interactions)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('gviewer')"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==2 || speciesTypeKey==5 || speciesTypeKey==6 || speciesTypeKey==9" ><div ng-if="oKey==1">GViewer (Genome Viewer)</div></div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('excel')"><div ng-if="speciesTypeKey==1 || speciesTypeKey==3 || speciesTypeKey==6" ><div ng-if="oKey==1">Variant Visualizer (Damaging Variants)</div></div></td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"> <img src="https://rgd.mcw.edu/rgdweb/common/images/annotCompare.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('annotCompare')"/></div><div ng-if="oKey!=1">Gene Annotator (Annotation Comparison)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"> <img src="https://rgd.mcw.edu/rgdweb/common/images/olga.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('olga')"/></div><div ng-if="oKey!=1">OLGA (Gene List Generator)<br>unavailable</div></td>
                                    <td align="center"> <img src="https://rgd.mcw.edu/rgdweb/common/images/excel.png" border="0" style="cursor:pointer;padding:5px; margin-right:0px; border:1px solid black;" ng-click="rgd.toolSubmit('excel')"/></td>
                                </tr>
                                <tr>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('annotCompare')"><div ng-if="oKey==1">Gene Annotator (Annotation Comparison)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('olga')"><div ng-if="oKey==1">OLGA (Gene List Generator)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('excel')">Excel (Download)</td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <td align="center"><div ng-if="oKey==1"> <img src="https://rgd.mcw.edu/rgdweb/images/MOET.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('enrichment')"/></div><div ng-if="oKey!=1">MOET (Multi-Ontology Enrichement)<br>unavailable</div></td>
                                    <td align="center"><div ng-if="oKey==1"> <img src="https://rgd.mcw.edu/rgdweb/images/GOLF.png" border="0" style="cursor:pointer;padding:5px; margin-bottom:5px; border:1px solid black;" ng-click="rgd.toolSubmit('golf')"/></div><div ng-if="oKey!=1">GOLF (Gene-Ortholog Location Finder)<br>unavailable</div></td>
                                </tr>
                                <tr>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('enrichment')"><div ng-if="oKey==1">MOET (Multi-Ontology Enrichement)</div></td>
                                    <td align="center" style="cursor:pointer;font-size:16px;font-weight:400;" ng-click="rgd.toolSubmit('golf')"><div ng-if="oKey==1">GOLF (Gene-Ortholog Location Finder)</div></td>

                                </tr>
                            </table>

                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>


        <!-- end tool navigation -->









        <!--
                            <div style="font-weight:700;text-decoration: underline;">Saved Lists</div>

                                            <div ng-repeat="list in myLists" style="display:table-row;">

                                             <div style="display: table-cell; float:left; margin-right:10px; min-width: 50px; font-weight:700;">{{ list.name }}:</div> <div style="width:100%;"> {{ list.desc }}</div>
                                             <div style="display: table-cell; float:left; margin-right:10px; min-width: 50px;"><a href="javascript:void(0)" ng-click="rgd.loadGeneList(list.id)">Preview</a></div>
                                             <div style="display: table-cell; float:left;  margin-right:10px; min-width: 40px;"><a href="{{ list.link }}&lid={{list.id}}">Edit</a></div>
                                             <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px;" ><a href="javascript:void(0)" ng-click="rgd.removeList(list.id)">Remove</a></div>
                                             <div style="display: table-cell; float:left;  margin-right:10px; min-width: 50px; padding-bottom:10px;" ><input type="button" value="Import" ng-click="rgd.import(list.id)" data-dismiss="modal"/></div>



                                            </div>
                            </div>
                            -->
        <html>
        <script src="https://rgd.mcw.edu/rgdweb/js/webFeedback.js"></script>

        <body>
        <div id="divButtons" class="btnDiv">
            <button type="button" class="hideMe" id="hideDiv" onclick="hideButtons()">x</button>
            <button class="thumbsDown" v-on:click="dislikedPage"></button>
            <button class="open-button" onclick="openForm()">Send Message</button>
            <button class="thumbsUp" v-on:click="likedPage"></button>
        </div>
        <div id="hiddenBtns" class="hiddenBtns" style="display: none">
            <button type="button" class="openLikeBtn" onclick="hideButtons()"></button>
        </div>

        <div class="chat-popup" id="messageVue">
            <form class="form-container">
                <button type="button" id="close" onclick="closeForm()" class="closeForm">x</button>
                <h2 id="headMsg">Send us a Message</h2>
                <input type="hidden" name="subject" value="Help and Feedback Form">
                <input type="hidden" name="found" value="0">

                <label><b>Your email</b></label>
                <br><input type="email" name="email" v-model="email">
                <br><label><b>Message</b></label>
                <textarea placeholder="Type message.." name="comment" v-model="message"></textarea>

                <button type="button" id="sendEmail" class="btn" v-on:click="sendMail">Send</button>

            </form>
        </div>
        </body>
        </html>
        <script>
            checkCookie();
        </script>



        <table class="wrapperTable" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>

                    <div id="headWrapper">




                        <div class="top-bar">
                            <table width="100%" border="0" class="headerTable" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" style="color:white;" rowspan="3" width="10">

                                        <div ><a class="homeLink" href="https://rgd.mcw.edu/wg/home"><img style="border:3px solid #2865A3;" border="0" src="https://rgd.mcw.edu/rgdweb//common/images/rgd_logo.jpg"></a></div>

                                    </td>

                                    <td align="right" style="color:white;" valign="center" colspan="3">
                                        <a href="https://rgd.mcw.edu/wg/registration-entry/">Submit Data</a>&nbsp;|&nbsp;
                                        <a href="https://rgd.mcw.edu/wg/help3">Help</a>&nbsp;|&nbsp;
                                        <a href="https://rgd.mcw.edu/wg/home/rgd_rat_community_videos/">Video Tutorials</a>&nbsp;|&nbsp;
                                        <a href="https://rgd.mcw.edu/wg/news2/">News</a>&nbsp;|&nbsp;
                                        <a href="https://rgd.mcw.edu/wg/home/rat-genome-database-publications">Publications</a>&nbsp;|&nbsp;

                                        <a href="https://download.rgd.mcw.edu">Download</a>&nbsp;|&nbsp;
                                        <a href="https://rest.rgd.mcw.edu/rgdws/swagger-ui.html">REST API</a>&nbsp;|&nbsp;
                                        <a href="https://rgd.mcw.edu/wg/citing-rgd">Citing RGD</a>&nbsp;|&nbsp;
                                        <a href="https://rgd.mcw.edu/rgdweb/contact/contactus.html">Contact</a>&nbsp;&nbsp;&nbsp;

                                        <input type="button" class="btn btn-info btn-sm"  value="{{username}}" ng-click="rgd.loadMyRgd($event)" style="background-color:#2B84C8;padding:1px 10px;font-size:12px;line-height:1.5;border-radius:3px"/>
                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="2">



                                        <div class="rgd-navbar">
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg'">Home
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/searchByPosition.html">Search RGD</a><!---RGDD-1856 New Search By Position added -->
                                                    <a href="https://rgd.mcw.edu/wg/grants/">Grant Resources</a>
                                                    <a href="https://rgd.mcw.edu/wg/citing-rgd/">Citing RGD</a>
                                                    <a href="https://rgd.mcw.edu/wg/about-us/">About Us</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/contact/contactus.html">Contact Us</a>
                                                </div>
                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/data-menu/'">Data
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/genes.html?100">Genes</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/qtls.html?100">QTLs</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/strains.html?100">Strains</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/markers.html?100">Markers</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/report/genomeInformation/genomeInformation.html">Genome Information</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/ontology/search.html">Ontologies</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/cellLines.html">Cell Lines</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/search/references.html?100">References</a>
                                                    <a href="https://download.rgd.mcw.edu">Download</a>
                                                    <a href="https://rgd.mcw.edu/wg/registration-entry/">Submit Data</a>
                                                </div>
                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/tool-menu/'">Analysis & Visualization
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="https://rgd.mcw.edu/QueryBuilder" >OntoMate (Literature Search)</a>
                                                    <a href="https://rgd.mcw.edu/jbrowse/">JBrowse (Genome Browser)</a>
                                                    <a href="https://rgd.mcw.edu/vcmap">Synteny Browser (VCMap)&nbsp;&nbsp;<span style="color:red;">(beta)</span></a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/front/config.html">Variant Visualizer</a>

                                                    <a href="https://rgd.mcw.edu/rgdweb/enrichment/start.html">Multi-Ontology Enrichment (MOET)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/ortholog/start.html">Gene-Ortholog Location Finder (GOLF)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/cytoscape/query.html">InterViewer (Protein-Protein Interactions)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/phenominer/ontChoices.html">PhenoMiner (Quatitative Phenotypes)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/ga/start.jsp">Gene Annotator</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/generator/list.html">OLGA (Gene List Generator)</a>
                                                    <a href="https://www.alliancegenome.org/bluegenes/alliancemine">AllianceMine</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/gTool/Gviewer.jsp">GViewer (Genome Viewer)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/overgo/find.html">Overgo Probe Designer</a>
                                                </div>
                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='https://rgd.mcw.edu/rgdweb/portal/index.jsp'">Diseases
                                                    <i class="fa fa-caret-down"></i>
                                                </button>
                                                <div class="rgd-dropdown-content">
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=1">Aging & Age-Related Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=2">Cancer & Neoplastic Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=3">Cardiovascular Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=14">COVID-19</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=12">Developmental Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=4">Diabetes</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=5">Hematologic Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=6">Immune & Inflammatory Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=15">Infectious Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=13">Liver Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=7">Neurological Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=8">Obesity & Metabolic Syndrome</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=9">Renal Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=10">Respiratory Disease</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/portal/home.jsp?p=11">Sensory Organ Disease</a>
                                                </div>

                                            </div>
                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/physiology/'">Phenotypes & Models
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="https://rgd.mcw.edu/rgdweb/models/findModels.html">Find Models&nbsp;&nbsp;&nbsp;<span style="font-weight: bold;color:red">new</span></a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/models/allModels.html">Genetic Models</a>
                                                    <a href="https://rgd.mcw.edu/wg/autism-rat-model-resource/">Autism Models</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/phenominer/ontChoices.html">PhenoMiner (Quantitative Phenotypes)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/phenominer/phenominerExpectedRanges/views/home.html">Expected Ranges (Quantitative Phenotype)</a>
                                                    <a href="https://rgd.mcw.edu/rgdweb/phenominer/ontChoices.html">PhenoMiner Term Comparison</a>
                                                    <a href="https://rgd.mcw.edu/wg/hrdp_panel/">Hybrid Rat Diversity Panel</a>
                                                    <a href="https://rgd.mcw.edu/wg/phenotype-data13/">Phenotypes</a>
                                                    <a href="https://rgd.mcw.edu/wg/gerrc/">GERRC (Gene Editing Rat Resource Center)</a>
                                                    <a href="https://rgd.mcw.edu/wg/physiology/additionalmodels/">Phenotypes in Other Animal Models</a>
                                                    <a href="https://rgd.mcw.edu/wg/strain-maintenance/">Animal Husbandry</a>
                                                    <a href="https://rgd.mcw.edu/wg/physiology/strain-medical-records/">Strain Medical Records</a>
                                                    <a href="https://rgd.mcw.edu/wg/phylogenetics/">Phylogenetics</a>
                                                    <a href="https://rgd.mcw.edu/wg/strain-availability/">Strain Availability</a>
                                                    <a href="https://download.rgd.mcw.edu/pub/data_release/Hi-res_Rat_Calendars/">Calendar</a>
                                                    <a href="https://rgd.mcw.edu/wg/physiology/rats101/">Rats 101</a>
                                                    <a href="https://rgd.mcw.edu/wg/photos-and-images/community-submissions/">Submissions</a>
                                                    <a href="https://rgd.mcw.edu/wg/photos-and-images/physgen-photo-archive2/">Photo Archive</a>
                                                </div>
                                            </div>

                                            <a href="https://rgd.mcw.edu/wg/home/pathway2/">Pathways</a>

                                            <div class="rgd-dropdown">
                                                <button class="rgd-dropbtn" style="cursor:pointer" onclick="javascript:location.href='/wg/com-menu/'">Community
                                                    <i class="fa fa-caret-down"></i>
                                                </button>

                                                <div class="rgd-dropdown-content">
                                                    <a href="http://mailman.mcw.edu/mailman/listinfo/rat-forum">Rat Community Forum</a>
                                                    <a href="https://rgd.mcw.edu/wg/com-menu/directory-of-rat-laboratories2/">Directory of Rat Laboratories</a>
                                                    <a href="https://rgd.mcw.edu/wg/home/rgd_rat_community_videos/">Video Tutorials</a>
                                                    <a href="https://rgd.mcw.edu/wg/news2/">News</a>
                                                    <a href="https://rgd.mcw.edu/wg/home/rat-genome-database-publications/">RGD Publications</a>
                                                    <a href="https://rgd.mcw.edu/wg/com-menu/poster_archive/">RGD Poster Archive</a>
                                                    <a href="https://rgd.mcw.edu/nomen/nomen.shtml">Nomenclature Guidelines</a>
                                                    <a href="https://rgd.mcw.edu/wg/resource-links/">Resource Links</a>
                                                    <a href="https://rgd.mcw.edu/wg/resource-links/laboratory-resources/">Laboratory Resources</a>
                                                    <a href="https://rgd.mcw.edu/wg/resource-links/employment-resources/">Employment Resources</a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td >


                                        <div id="app">

                                            <div id="test" style="width:100%;height:10px">

                                            </div>

                                            <div class="container-fluid" id="container" style="height:36px;">

                                                <div class="row" style=";margin-top:2px;margin-left:35%;margin-bottom:2px;">
                                                    <form  name="elasticSearchForm" class="form-inline" action="https://rgd.mcw.edu/rgdweb/elasticResults.html" id="elasticSearchForm" role="search" method="post">
                                                        <input type="hidden" name="log" value="true"/>
                                                        <input type="hidden" name="category" id="category" value="General"/>

                                                        <div class="form-row row">
                                                            <div class="form-group">
                                                                <div class="input-group" >
                                                                    <input   class="searchgroup" id="term" name=term size="50" placeholder="Enter Search Term..." value="" type="search"  />

                                                                    <div class="input-group-append">

                                                                        <button class="btn btn-primary" type="submit">
                                                                            <i class="fa fa-search"></i>
                                                                        </button>&nbsp;&nbsp;
                                                                    </div>
                                                                </div>
                                                                <small class="form-text text-muted"><a href="https://rgd.mcw.edu/rgdweb/generator/list.html" >Advanced Search (OLGA)</a></small>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>


                                            </div>

                                        </div>

                                    </td>
                                    <td>
                                        <a href="https://www.facebook.com/pg/RatGenomeDatabase/posts/"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/facebook-20.png"/></a>
                                        <a href="https://twitter.com/ratgenome"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/twitter-20.png"/></a>
                                        <a href="https://www.linkedin.com/company/rat-genome-database"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/linkedin-20.png"/></a>
                                        <a href="https://www.youtube.com/channel/UCMpex8AfXd_JSTH3DIxMGFw?view_as=subscriber"><img src="https://rgd.mcw.edu/rgdweb/common/images/social/youtube-20.png"/></a>
                                        <a href="https://github.com/rat-genome-database"><img src="https://rgd.mcw.edu/rgdweb/common/images/GitHub_Logo_White-20.png"/></a>

                                    </td>
                                </tr>


                            </table>
                        </div>

                        <input type="hidden" id="speciesType" value="">




                    </div>





    </DIV>
    <!--end headwrapper -->
</div>

<script>
    if (location.href.indexOf("") == -1 &&
        location.href.indexOf("https://www.rgd.mcw.edu") == -1 &&
        location.href.indexOf("osler") == -1 &&
        location.href.indexOf("horan") == -1 &&
        location.href.indexOf("owen") == -1 &&
        location.href.indexOf("hancock") == -1 &&
        location.href.indexOf("preview.rgd.mcw.edu") == -1) {
        document.getElementById("curation-top").style.visibility='visible';
    }
</script>

</td>
</tr>
<tr>
    <link href="https://fonts.googleapis.com/css?family=Source+Code+Pro&display=swap" rel="stylesheet">
    <td colspan=1 align="right" width="100%">

    </td>
</tr>
</table>



<div id="mainBody">
    <div id="contentArea" class="content-area">
        <table cellpadding="5" border=0 align="center" width="100%">
            <tr>
                <td colspan="3" align="left" valign="top">



                    <link rel="stylesheet" href="https://rgd.mcw.edu/QueryBuilder/js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" media="all" />
                    <script type="text/javascript" src="https://rgd.mcw.edu/QueryBuilder/js/jquery-1.12.4.min.js"></script>
                    <link rel="stylesheet" type="text/css" href="https://rgd.mcw.edu/QueryBuilder/js/main.css"/>
                    <link rel="stylesheet" href="https://rgd.mcw.edu/QueryBuilder/css/jquery.autocomplete.css" type="text/css" />
                    <script type="text/javascript" src="https://rgd.mcw.edu/QueryBuilder/js/jquery-ui-1.12.1/jquery-ui.js"></script>
                    <script type="text/javascript" src="https://rgd.mcw.edu/QueryBuilder/js/jquery.autocomplete.js"></script>

                    <style>
                        .jumbotron{
                            /*	background:linear-gradient(to bottom, white 0%, #D6EAF8 100%); */
                            background:linear-gradient(to bottom, white 0%, #D6EAF8 100%);
                            background-color: #D1F2EB;
                        }
                    </style>

                    <script type="text/javascript">

                        var row_count=0;
                        var sort_row_count = 0;

                        $(document).ready(function(){
                            $('#qb-options').hide();
                            $('#qb-advancedSearchForm').hide();
                            $("#dateFrom").datepicker({dateFormat: "yy-mm-dd"});
                            $("#dateTo").datepicker({dateFormat: "yy-mm-dd"});
                            $(".button").button();

                            $("input").addClass("ui-widget-content ui-state-default ui-corner-all");
                            $("form").addClass("ui-widget");
                            $("#queryConditions").addClass("ui-corner-all");
                            $("#queryConditions").hide();
                            $("#sortConditions").addClass("ui-corner-all");
                            $("#sortConditions").hide();
                            $(".butHelp").button({icons: {primary: "ui-icon-help"}, text:false});

                            $.ajaxSetup ({
                                cache: false
                            });

                            var ajax_load = "<img src='img/load.gif' alt='loading...' />";

                            //  load() functions
                            $("#getOntNmae").click(function(){
                                var loadUrl = "/QueryBuilder/get_ontology/"+ontId.value;
                                $("#result").html(ajax_load).load(loadUrl);
                            });

                            var row_id=1;

                            $("#addCond").click(function() {
                                //	$("#queryConditions").show();
                                var loadUrl = "/getConditionRow/"+row_id;
                                console.log("/QueryBuilder"+loadUrl);
                                $.get("/QueryBuilder"+loadUrl,{},
                                    function(data){
                                        $("#lastRow").before(data);
                                        $(".stripeTable tr:odd").addClass("ui-widget-content");
                                        $(".butRemove").button({icons: {primary: "ui-icon-close"}, text:false});
                                        var col_name="#inTerm"+(row_id-1)+" input";
                                        $(col_name).flushCache();

                                        //	   $(col_name).autocomplete('/OntoSolr/select', {
                                        $(col_name).autocomplete('/OntoSolr/select', {
                                                extraParams:{
                                                    'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5  synonym_str^2 synonym^2 def^1',
                                                    'fq': 'NOT cat:(CUSTOM HP MP)',
                                                    'wt': 'velocity',
                                                    'bf': 'term_len_l^.01',
                                                    'v.template': 'termmatch1',
                                                    'cacheLength': 0
                                                },
                                                max:20
                                            }
                                        );
                                        $(col_name).focus(function(){$(col_name).attr("autocomplete","off");});
                                        $(col_name).focusout(function(){$(col_name).attr("autocomplete","on");});
                                    });

                                row_id=row_id +1;
                                row_count = row_count +1;
                            });


                            var sort_row_id=0;

                            $("#addSort").click(function() {
                                $("#sortConditions").show();
                                var loadUrl = "/getSortCondRow/"+sort_row_id;
                                $.get("/QueryBuilder"+loadUrl, {},
                                    function(data){
                                        $("#lastSortRow").before(data);
                                        $(".stripeTable1 tr:odd").addClass("ui-widget-content");
                                        $(".butRemove").button({icons: {primary: "ui-icon-close"}, text:false});
                                    });

                                sort_row_id=sort_row_id +1;
                                sort_row_count = sort_row_count +1;
                            });

                            $("#helpPMID").click(function() {
                                var dialog = $("<div></div>")
                                    .html("Three options: <br>1. One PMID. <br> 2. Multiple comma or space separated PMIDs. <br> 3. Start_PMID to End_PMID.")
                                    .dialog({title: 'Enter PMID', modal:'true', width:400, resizable:false});
                            });

                            $("#helpOntoID").click(function() {
                                var dialog = $("<div></div>")
                                    .html('Two options:<br>1. Enter an ontology term.<br>2. Enter a RGD gene')
                                    .dialog({title: 'Term or ID', modal:'true', width:400, resizable:false});
                            });
                            $('.nav-item').click(function () {

                            });
                            $("#butShowFields").click(function() {
                                $('#fieldTable').toggle();
                            });
//	$('#fieldTable').hide();
//	$("#addSort").click();
                            //	$("#addCond").click();
                            //	window.setTimeout(addAnotherRow,500);
                            $("#aboutLink").click(function () {
                                $("#queryForm").hide();
                                $("#features").hide();
                                $("#about").show();
                            })
                            $("#featuresLink").click(function () {
                                $("#queryForm").hide();
                                $("#about").hide();
                                $("#features").show();
                            })
                            $("#formLink").click(function () {
                                $("#about").hide();
                                $("#features").hide();
                                $("#queryForm").show();

                            })
                            update_autocomplete("#qb-ac-input", "ontology")

                        });

                        function addAnotherRow() {
                            $("#addCond").click();
                        }

                        function removeRow(rowId) {
                            row_count = row_count -1;
                            $('#condRow'+rowId).remove();
                            $(".stripeTable tr").removeClass("ui-widget-content");
                            $(".stripeTable tr:odd").addClass("ui-widget-content");
                            if (row_count ==0) $("#queryConditions").hide();
                        }

                        function removeSortRow(rowId) {
                            sort_row_count = sort_row_count -1;
                            $('#sortRow'+rowId).remove();
                            $(".stripeTable1 tr").removeClass("ui-widget-content");
                            $(".stripeTable1 tr:odd").addClass("ui-widget-content");
                            if (sort_row_count ==0) $("#sortConditions").hide();
                        }

                        function update_autocomplete(obj_name, ont_cat) {
                            $(obj_name).flushCache();
                            $(obj_name).unautocomplete();
                            //  $(obj_name).autocomplete('/OntoSolr/select', {
                            console.log(obj_name + '\t' + ont_cat +"\t"+ $(obj_name).value);
                            if (ont_cat.trim() == "organism_term") {
                                console.log(obj_name + '\t' + ont_cat + "\t INSIDE");
                                /*	var url= '/QueryBuilder/getOrganisms/'+"Homo"
                                   $(obj_name).autocomplete(url, {
                                                extraParams:{
                                                    term:"rat " 				}
                                            }
                                    );
                        */		$(obj_name).autocomplete('/solr/select', {
                                        extraParams: {
                                            'qf': 'organism_term^5',
                                            'wt': 'velocity',
                                            'v.template': 'termmatch3',
                                            'cacheLength': 0
                                        },
                                        max: 20
                                    }
                                );

                            } else {
                                $(obj_name).autocomplete('/OntoSolr/select', {
                                        extraParams: {
                                            'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5 synonym_str^2 synonym^2 def^1',
                                            'fq': 'cat:' + (ont_cat == "ontology" ? "(NOT CUSTOM NOT HP)" : ont_cat.substring(0, ont_cat.length - 5).toUpperCase()),
                                            'bf': 'term_len_l^.003',
                                            'wt': 'velocity',
                                            'v.template': 'termmatch1',
                                            'cacheLength': 0
                                        },
                                        max: 20
                                    }
                                );
                            }
                        }
                        function myToggleFunction() {
                            var x = document.getElementById("qb-options");
                            if (x.style.display === "none") {
                                x.style.display = "block";
                            } else {
                                x.style.display = "none";
                            }
                        }
                        function toggleQBAdvancedSearchForm() {
                            var x = document.getElementById("qb-advancedSearchForm");
                            if (x.style.display === "none") {
                                x.style.display = "block";
                            } else {
                                x.style.display = "none";
                            }
                        }



                    </script>
                    <div class="container-fluid">
                        <div style="text-align: center">
                            <p><span style="color:#24619c;font-size: 40px;text-decoration: none;"><img src="/QueryBuilder/common/logo.png" width="100px; height:100px"/>ntoMate </span> </p>
                            <p class="lead" style="color:#2865A3">An ontology-driven, concept-based literature search engine developed at RGD.</p>
                        </div>
                        <hr>
                        <form id="qForm" action="/QueryBuilder/getResult/" method="get" target="_blank">
                            <div class="jumbotron">
                                <div class="container"  >
                                    <div class="form-row row" style="text-align: center;margin-bottom: 2%;margin-left:40%" >
                                        <div class="form-check form-check-inline">
                                            <input id="pubmed" name="qSource" name="qSource" class="form-check-input" type="radio" value="pubmed" checked="checked"/>
                                            <label class="form-check-label" for="pubmed" style="font-size: medium">Pubmed</label>
                                        </div>
                                        <div  class="form-check form-check-inline">&nbsp;</div>
                                        <div class="form-check form-check-inline">
                                            <input id="preprint" name="qSource" name="qSource" class="form-check-input" type="radio" value="preprint"/>
                                            <label class="form-check-label" for="preprint" style="font-size: medium">COVID-19 Preprint</label>
                                        </div>
                                    </div>
                                    <div class="form-row row">
                                        <div class="form-group col-md-4" id="selOnt0">

                                            <select id="qb-ontology-select" name="qFieldConditions[0].fieldName" class="form-control form-control-lg" onchange="update_autocomplete(&quot;#qb-ac-input&quot;, $(this).val());">
                                                <option value="ontology">Any ontology/Gene</option>
                                                <option value="bp_term">Biological Process</option>
                                                <option value="cl_term">Cell Ontology</option>
                                                <option value="cc_term">Cellular Component</option>
                                                <option value="chebi_term">ChEBI Ontology</option>
                                                <option value="cmo_term">Clinical Measurement</option>
                                                <option value="rdo_term">Disease Ontology (RDO)</option>
                                                <option value="chebi_term">Drug and Chemical</option>
                                                <option value="xco_term">Experimental Condition</option>
                                                <option value="rgd_gene_term">Gene</option>
                                                <option value="mp_term">Mammalian Phenotype</option>
                                                <option value="mmo_term">Measurement Methods</option>
                                                <option value="mf_term">Molecular Function</option>
                                                <option value="ma_term">Mouse Anatomy</option>
                                                <option value="mt_term">Mutation</option>
                                                <option value="nbo_term">Neuro Behavioral</option>
                                                <option value="organism_term">Organism Scientific Name</option>
                                                <option value="pw_term">Pathway Ontology</option>
                                                <option value="rs_term">Rat Strain Ontology</option>
                                                <option value="zfa_term">Zebrafish Anatomy</option>
                                                <option value="so_term">Sequence Ontology</option>

                                            </select>

                                        </div>
                                        <div class="form-group col-md-8">
                                            <div class="input-group" >
                                                <input id="qb-ac-input" name="qFieldConditions[0].fieldValue" name="qbInput" placeholder="Enter Search Term ...." type="search" class="ont-auto-complete form-control form-control-lg border-secondary" value=""/>

                                                <div class="input-group-append">

                                                    <button class="btn btn-outline-secondary" type="submit">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <small class="form-text text-muted">Examples: <a href="/QueryBuilder/getResult/?qFieldConditions%5B0%5D.fieldName=ontology&qFieldConditions%5B0%5D.fieldValue=hypertension" target="_blank">Hypertension</a>, <a href="/QueryBuilder/getResult/?qFieldConditions%5B0%5D.fieldName=ontology&qFieldConditions%5B0%5D.fieldValue=cancer" target="_blank">Cancer</a>, <a href="/QueryBuilder/getResult/?qFieldConditions%5B0%5D.fieldName=ontology&qFieldConditions%5B0%5D.fieldValue=a2m" target="_blank">A2m</a></small>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <table class="table" >
                                        <tr id="lastRow">

                                        </tr>
                                    </table>
                                </div>

                                <div class="container" id="qb-options" style="width:70%; align:center">
                                    <table class="table" id="fieldTable">
                                        <tbody>
                                        <tr>
                                            <td style="vertical-align:bottom">Date(yyyy-mm-dd):</td>
                                            <td>
                                                <div class="form-row">
                                                    <div class="col-auto">
                                                        From
                                                        <input id="dateFrom" name="qDateFrom" class="form-control" type="text" value=""/>
                                                    </div>
                                                    <div class="col-auto">
                                                        To <input id="dateTo" name="qDateTo" class="form-control" type="text" value=""/>
                                                    </div>
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="vertical-align: bottom">PMIDs:</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col">
                                                        <input id="pmid" name="qPMID" class="form-control" type="text" value=""/></div>
                                                    <div class="col">
                                                        <span class="badge badge-secondary butHelp" id="helpPMID" style="cursor:hand">?</span>
                                                    </div>
                                                </div>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="vertical-align: bottom">All fields:</td>
                                            <td><input id="qString" name="qString" class="form-control" type="text" value=""/></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: bottom">Title:</td>
                                            <td><input id="qTitleStr" name="qTitleStr" class="form-control" type="text" value=""/></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: bottom">Author:</td>
                                            <td><input id="qAuthorStr" name="qAuthorStr" class="form-control" type="text" value=""/></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: bottom">Keyword:</td>
                                            <td><input id="qAbstractStr" name="qAbstractStr" class="form-control" type="text" value=""/></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-group col-md-12" style="text-align: center" >
                                    <div class="form-group" style="display: inline-block">
                                        <table style="alignment: center">
                                            <tr>
                                                <td><button type="button" id="addCond" class="btn btn-outline-secondary" style="">Add term
                                                    condition</button></td>

                                                <td><!--button class="btn btn-outline-secondary" type="button" onclick="toggleQBAdvancedSearchForm()">Advanced Search</button-->
                                                    <button class="btn btn-outline-secondary" type="button" onclick="myToggleFunction()">More Search Options</button>

                                                </td>
                                                <td><!--button class="btn btn-outline-secondary" type="button" onclick="toggleQBAdvancedSearchForm()">Advanced Search</button-->
                                                    <a href="/QueryBuilder"  class="btn btn-outline-secondary" id="aClear" style="padding:6px" >Clear Form</a>
                                                </td>
                                                <td><button class="btn btn-primary" type="submit">
                                                    Search OntoMate
                                                </button></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card" style="width: 25rem;border:0">

                                        <div class="card-body">
                                            <h5 class="card-title" style="font-weight: bold;font-size: 20px;color:#24619c;">About</h5>
                                            <p class="card-text" style="color:grey;text-align: justify">OntoMate is an ontology-driven, concept-based literature search engine that was originally developed by RGD as an alternative for the basic PubMed search engine (http://www.ncbi.nlm.nih.gov/pubmed) in the gene curation workflow. OntoMate tags abstracts with gene names, gene mutations, organism names and terms from the ontologies/vocabularies used at RGD.</p>
                                            <!--a href="#" class="btn btn-primary">Go somewhere</a-->
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card" style="width: 25rem;border:0">

                                        <div class="card-body">
                                            <h5 class="card-title" style="font-weight: bold;font-size: 20px;color:#24619c;">Features</h5>
                                            <p class="card-text" style="color:grey"></p>
                                            <ul style="margin-left: 0">
                                                <li style="color:grey;margin-left: 0">Easy to build concept-based queries</li>
                                                <li style="color:grey">User-activated filters</li>
                                                <!--li style="color:grey">Date and other filters relevant to the literature search</li-->
                                                <li style="color:grey">Information Annotated to Articles
                                                    <ul>

                                                        <li style="color:grey">Genes</li>
                                                        <li style="color:grey">Rat strains </li>
                                                        <li style="color:grey">Organism</li>
                                                        <li style="color:grey">Disease</li>
                                                        <li style="color:grey">Phenotypes</li>
                                                        <li style="color:grey">Traits </li>
                                                        <li style="color:grey">Clinical Measurements</li>

                                                    </ul>
                                                </li>
                                            </ul>
                                            <!--a href="#" class="btn btn-primary">Go somewhere</a-->
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card" style="width: 25rem;border:0">

                                        <div class="card-body" >
                                            <h5 class="card-title" style="font-weight: bold;font-size: 20px;color:#24619c">Publication</h5>
                                            <p class="card-text" style="color:grey">Click the below link to get the reference</p>
                                            <a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4305386/" class="btn btn-primary" target="_blank">Go to PubMed</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <script>
                        $(function () {
                            var qbinput=$('#qb-ac-input');
                            $(qbinput).autocomplete();
                            /*$(qbinput).autocomplete('https://rgd.mcw.edu/OntoSolr/select', {
                                extraParams:{
                                    'qf': 'term_en^5 term_str^3 term^3 term_ws^2 synonym_en^4.5  synonym_str^2 synonym^2 def^1',
                                    'fq': 'NOT cat:(CUSTOM HP MP)',
                                    'wt': 'velocity',
                                    'bf': 'term_len_l^.01',
                                    'v.template': 'termmatch1',
                                    'cacheLength': 0
                                },
                                max:20
                            });*/
                            $(qbinput).focus(function(){$(qbinput).attr("autocomplete","off");});
                            $(qbinput).focusout(function(){$(qbinput).attr("autocomplete","on");});
                        });


                    </script>

                </td>
            </tr>
        </table>

    </div>
    <br>
    <div class="bottom-bar" >
        <table align=center class="headerTable"> <tr><td align="left" style="color:white;">
            <a href="https://rgd.mcw.edu/rgdweb/contact/contactus.html">Contact Us</a>&nbsp;|&nbsp;
            <a href="https://rgd.mcw.edu/wg/about-us">About Us</a>&nbsp;|&nbsp;
            <a href="https://creativecommons.org/licenses/by/4.0/">License CC BY 4.0</a>&nbsp;|&nbsp;
            <a href="https://rgd.mcw.edu/wg/home/disclaimer">Legal Disclaimer</a>&nbsp;|&nbsp;
            <a href="http://www.mcw.edu/">&copy; Medical College of Wisconsin</a>
        </td></tr></table>
    </div>
</div>


<table align="center">
    <tr>
        <td width=100 align="center"><a href="https://www.nhlbi.nih.gov/"><img src="https://rgd.mcw.edu/rgdweb/common/images/nhlbilogo.gif" alt="NHLBI Logo" title="National Heart Lung and Blood Institute"></a><br><br></td>
        <td width=100 align="center"><a href="https://www.nih.gov/"><img src="https://rgd.mcw.edu/rgdweb/common/images/nih.png" alt="NHLBI Logo" title="National Institue of Health"></a><br><br></td>
        <td width=100 align="center"><a href="http://alliancegenome.org"><img src="https://rgd.mcw.edu/rgdweb/common/images/alliance_logo.png" height="80" width="133" border=0/></a></td>
        <td width=100 align="center"><a href="https://globalbiodata.org/scientific-activities/global-core-biodata-resources"><img src="https://rgd.mcw.edu/rgdweb/common/images/gbc-main.svg" height="80" width="133" border=0/></a></td>
    </tr>
</table>

<p align="center"><a href="https://rgd.mcw.edu/wg/wp-admin/post.php?post=15&action=edit">RGD</a> is funded by grant HL64541 from the National Heart, Lung, and Blood Institute on behalf of the NIH.<br>


<div id="copyright">

</div>

<script language="javascript" src="https://rgd.mcw.edu/common/js/killerZebraStripes.js" type="text/javascript"></script>
<script>
    var arr = document.getElementsByTagName("table");
    for (i=0; i< arr.length; i++) {
        if (arr[i].className == "striped-table") {
            if (!arr[i].id) {
                arr[i].id = "striped-table-" + i;
            }
            stripeTables(arr[i].id);
        }
    }

</script>




</body>
</html>