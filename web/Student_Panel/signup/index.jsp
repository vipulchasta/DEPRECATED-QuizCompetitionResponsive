<%-- 
    Document   : index
    Created on : Jan 31, 2017, 1:13:18 AM
    Author     : Conseptify
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Signup</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <style>   
        </style>
    </head>   
    <body>
        <%@include file="/HeaderHTML.html" %>
        
        <div class="container" style="min-height: 500px;">
            <div class="row">
		<div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
			<div class="panel-heading">
			    <h3 class="panel-title">Please sign up</h3>
			</div>
			 <div class="panel-body">
			    <form accept-charset="UTF-8" role="form">
                            <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="E-mail" name="email" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" type="password" value="">
			    		</div>
			    		<div class="checkbox">
			    	    	<label>
			    	    		<input name="remember" type="checkbox" value="Remember Me"> Remember Me
			    	    	</label>
			    	    </div>
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
			    	</fieldset>
			      	</form>
			    </div>
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
