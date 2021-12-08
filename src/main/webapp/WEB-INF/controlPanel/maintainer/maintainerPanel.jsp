<%@include file="../controlPanelHeader.jsp"%>

<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="position-sticky pt-3">

		<!-- Anomaly -->
		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Anomalies</span>
		</h6>

		<ul class="nav flex-column">
			<li class="nav-item"><a
				href="<%=request.getContextPath()%>/controlPanel/maintainer/maintainerPanel"
				class="nav-link active"> Général </a></li>
			<li class="nav-item"><a class="nav-link" href="#">Autre (ne
					fais rien pour l'instant) </a></li>
		</ul>

		<!-- Ressource -->
		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Ressources</span>
		</h6>

		<ul class="nav flex-column mb-2">
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/controlPanel/maintainer/maintainerPanelList">Lister
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/controlPanel/maintainer/maintainerPanelAdd">Ajouter
			</a></li>
		</ul>
	</div>
</nav>

<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h2>TODO Board</h2>
	</div>

	<!-- Card list -->

	<div class="album py-5">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<div class="col">
					<div class="card bg-dark shadow-sm">
						<div class="card-body">
							<p class="card-text">
								<strong>Nom de la ressource</strong>: <br> Description de
								la ressource <br> <br> Anomalie
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<button type="button" class="btn btn-sm btn-outline-secondary">Résolu</button>
								<small class="text-muted">il y a 9 mins</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card bg-dark shadow-sm">
						<div class="card-body">
							<p class="card-text">
								<strong>Nom de la ressource</strong>: <br> Description de
								la ressource <br> <br> Anomalie
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<button type="button" class="btn btn-sm btn-outline-secondary">Résolu</button>
								<small class="text-muted">il y a 15 mins</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card bg-dark shadow-sm">
						<div class="card-body">
							<p class="card-text">
								<strong>Nom de la ressource</strong>: <br> Description de
								la ressource <br> <br> Anomalie
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<button type="button" class="btn btn-sm btn-outline-secondary">Résolu</button>
								<small class="text-muted">il y a 2h</small>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card bg-dark shadow-sm">
						<div class="card-body">
							<p class="card-text">
								<strong>Nom de la ressource</strong>: <br> Description de
								la ressource <br> <br> Anomalie
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<button type="button" class="btn btn-sm btn-outline-secondary">Résolu</button>
								<small class="text-muted">il y a 10 jours</small>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</main>

<%@include file="../controlPanelFooter.jsp"%>