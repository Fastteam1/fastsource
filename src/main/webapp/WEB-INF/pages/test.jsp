<%-- 
    Document   : test
    Created on : Oct 28, 2016, 3:34:12 PM
    Author     : vnpt2
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AngularJS POST Spring MVC</title>

    </head>
    <body> 

        <div>
            <h4>{{variable}}</h4>
            <b>You had sent below data through post:</b>
            <p>Response:  {{responseData}}</p>		
        </div>
        <script language="javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
        <script type="text/javascript">


$.ajax({
    type: 'POST',
    contentType: 'application/json; charset=utf-8',
    dataType: 'jsfdfdon',
    url: 'PostService',
    data: JSON.stringify({
        "name": "Javafdfd Honk",
        "location": "NY",
        "phone": "123456789"
    })
});

        </script>

    </body>


</html>