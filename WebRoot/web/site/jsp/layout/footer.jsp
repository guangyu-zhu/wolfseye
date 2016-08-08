<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
%>
	
  <!--========================================================
                            FOOTER
  =========================================================-->
  <footer class="well5">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12 wow fadeInLeft">
        <span class="colorText1">Cashyx </span> &copy; <span id="copyright-year"></span> |
          <a href="index-5.html">Privacy Policy</a>
          <!-- {%FOOTER_LINK} -->
          <ul class="follow_icon">
            <li>
              <a class="fa fa-instagram" href="#"></a>
            </li>
            <li>
              <a class="fa fa-twitter" href="#"></a>
            </li>
            <li>
              <a class="fa fa-facebook" href="#"></a>
            </li>
          </ul>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12">
         <h3>Get in touch<br>with us</h3>
         <p>
           Mes cuml dia sed in lacus ut eniascet ipsu ingerto aliiqt es site amet eismod ictor uten ligulate ameti dapibu ticdute numtsen lusto dolor ltissim comes cuml dia sed inertio 
         </p>
         <address>
          <dl>
          <dt>Telephone:</dt>
            <dd>
              <a href="callto:#">+1 800 603 6035</a>
            </dd>
            <dt>E-mail:</dt>
            <dd class="mail1">
              <a href="mailto:#">mail@demolink.org</a>
            </dd>
          </dl>
        </address>
      </div>
      <div class="col-md-4 col-sm-12 col-xs-12 wow fadeInRight">
       <address class="offsNo">
       <p>
         Cashyx<br>
         28 Jackson Blvd Ste 1020<br>
         Chicago, IL 60604-2340
       </p>
      </address>
    </div>
  </div>
</div>
</footer>
</div>
<script src="${contextPath}/web/site/js/script.js"></script>
<script type="text/javascript">
jQuery(function(){
	jQuery('.lightbox').lightbox();
})
</script>
</body>
</html>