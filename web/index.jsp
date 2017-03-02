<%-- 
    Document   : index
    Created on : Jan 31, 2017, 1:13:18 AM
    Author     : Conseptify
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quiz Portal</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <style>    
            .col-md-3
            {
            }
            
            .col-data
            {
                background-color: rgba(0,0,0,0.7);
                border-radius:10px;
                min-height: 200px;
                width: 90%;
            }
            .col-title
            {
                border-radius:10px;
                color: white; 
                font: sans-serif; 
                font-size: 20px;
                background-color: rgba(183, 23, 237,0.3);
                min-height: 35px;
            }
            .col-md-3 li
            {
                color: whitesmoke; 
               // text-justify: auto; 
                font: sans-serif; 
                font-size: 20px;
                list-style-type: square;
            }
            
        </style>
    </head>   
    <body>
        <%@include file="/HeaderHTML.html" %>
        <div class="container text-center" style="min-height: 750px">
            <br>
            <div class="container-fluid" style="background-color: rgba(100, 100, 100,0.9); border-radius:10px; min-height: 300px;">
            <br>
                <div class="col-md-6">
                    <div style="background-color: rgba(255, 255, 255,0.9); border-radius:10px; min-height: 200px;">
                        Login Box
                    </div>
                </div>
                <div class="col-md-3">
                    <div style="background-color: rgba(255, 255, 255,0.9); border-radius:10px; min-height: 200px;">
                        Signup Box
                    </div>
                </div>
            </div>
            <br>
            <div class="container-fluid" style="background-color: rgba(19, 208, 242,0.9); border-radius:10px;">
                <h1 style="color: #ffffff;">What Assessments We Provide:</h1><br>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">Aptitude</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">Reasoning</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">English</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">Banking</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">General Knowledge</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">Computer Knowledge</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">Professional Knowledge</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="col-data">
                        <div class="col-title">Professional Knowledge</div>
                        <ul>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                            <li><a href="#" >Simplification</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/FooterHTML.html" %>
        
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
    </body>
</html>
