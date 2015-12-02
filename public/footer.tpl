<footer class="footer">
	<div class="navbar navbar-default">
		<div class="container{if isset($is_admin)}-fluid{/if}">
			<div class="navbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="#">Help</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#">Feedback</a></li>
				</ul>
				<p class="navbar-text pull-right">Copyright &copy; 2015 Olexandr Revizor aka (SV) and Volodymyr Komarov aka (VovanMS)</p>
			</div>
		</div>
	</div>
</footer>

<!-- MSV Scripts section -->
<script src="{$template}/js/jquery.min.js"></script>
<script src="{$template}/bootstrap/js/bootstrap.min.js"></script>

<!-- Material Design for Bootstrap -->
<script src="{$template}/bootstrap-material-design/js/material.min.js"></script>
<script src="{$template}/bootstrap-material-design/js/ripples.min.js"></script>
<script src="{$template}/js/system.js"></script>
<script src="{$template}/js/app.js"></script>
<script src="{$template}/js/auth.js"></script>
{if isset($is_admin)}
	<script src="{$template}/js/admin.js"></script>
{/if}
</body>
</html>