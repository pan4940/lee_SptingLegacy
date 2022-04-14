<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/component/nav.css" />
    <link rel="stylesheet" href="/index.css" />
    <link rel="stylesheet" href="cart.css" />
    <script
      src="https://kit.fontawesome.com/cd631a71a1.js"
      crossorigin="anonymous"
    ></script>
    <title>Login</title>
  </head>
  <body>
    <style>
      ul {
        margin: 0px;
        font-size: 0.8rem;
        font-weight: bold;
      }
    </style>
    <jsp:include page="/WEB-INF/component/nav/nav.jsp" />
    <div id="empty"></div>
    <div id="cart_main">
      <h2>CART PAGE</h2>
    </div>
    <jsp:include page="/WEB-INF/component/footer/footer.jsp" />
    <script src="/component/nav.js"></script>
  </body>
</html>
