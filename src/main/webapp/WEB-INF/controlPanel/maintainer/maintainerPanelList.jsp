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
				class="nav-link"> Général </a></li>
			<li class="nav-item"><a class="nav-link" href="#">Autre (ne
					fais rien pour l'instant) </a></li>
		</ul>

		<!-- Ressource -->
		<h6
			class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
			<span>Ressources</span>
		</h6>

		<ul class="nav flex-column mb-2">
			<li class="nav-item"><a class="nav-link active"
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
		<h2>Liste des Ressources</h2>
	</div>

	<table
		class="table table-hover table-striped table-dark table-bordered">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Nom</th>
				<th scope="col">Localisation</th>
				<th style="white-space: nowrap; width: 10%;" scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>crayon</td>
				<td>U2.1.5</td>
				<td>
					<div class="d-flex justify-content-center">
						<a class="btn btn-info btn-sm mr-3"> <svg version="1.1"
								id="Capa_1" xmlns="http://www.w3.org/2000/svg"
								style="width: 16px; height: 16px;"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 217.855 217.855"
								style="enable-background: new 0 0 217.855 217.855;"
								xml:space="preserve">
							<path fill="white"
									d="M215.658,53.55L164.305,2.196C162.899,0.79,160.991,0,159.002,0c-1.989,0-3.897,0.79-5.303,2.196L3.809,152.086  
									c-1.35,1.352-2.135,3.166-2.193,5.075l-1.611,52.966c-0.063,2.067,0.731,4.069,2.193,5.532c1.409,1.408,3.317,2.196,5.303,2.196  
									c0.076,0,0.152-0.001,0.229-0.004l52.964-1.613c1.909-0.058,3.724-0.842,5.075-2.192l149.89-149.889  
									C218.587,61.228,218.587,56.479,215.658,53.55z 
									M57.264,201.336l-42.024,1.28l1.279-42.026l91.124-91.125l40.75,40.743  
									L57.264,201.336z M159,99.602l-40.751-40.742l40.752-40.753l40.746,40.747L159,99.602z" />

							</svg>
						</a> <a class="btn btn-sm btn-danger oneliner-btn"><span
							aria-hidden="true">&times;</span></a>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>papier</td>
				<td>Salle anglais</td>
				<td>
					<div class="d-flex justify-content-center">
						<a class="btn btn-info btn-sm mr-3"> <svg version="1.1"
								id="Capa_1" xmlns="http://www.w3.org/2000/svg"
								style="width: 16px; height: 16px;"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 217.855 217.855"
								style="enable-background: new 0 0 217.855 217.855;"
								xml:space="preserve">
							<path fill="white"
									d="M215.658,53.55L164.305,2.196C162.899,0.79,160.991,0,159.002,0c-1.989,0-3.897,0.79-5.303,2.196L3.809,152.086  
									c-1.35,1.352-2.135,3.166-2.193,5.075l-1.611,52.966c-0.063,2.067,0.731,4.069,2.193,5.532c1.409,1.408,3.317,2.196,5.303,2.196  
									c0.076,0,0.152-0.001,0.229-0.004l52.964-1.613c1.909-0.058,3.724-0.842,5.075-2.192l149.89-149.889  
									C218.587,61.228,218.587,56.479,215.658,53.55z 
									M57.264,201.336l-42.024,1.28l1.279-42.026l91.124-91.125l40.75,40.743  
									L57.264,201.336z M159,99.602l-40.751-40.742l40.752-40.753l40.746,40.747L159,99.602z" />

							</svg>
						</a> <a class="btn btn-sm btn-danger oneliner-btn"><span
							aria-hidden="true">&times;</span></a>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Video projecteur</td>
				<td>U2.2.39</td>
				<td>
					<div class="d-flex justify-content-center">
						<a class="btn btn-info btn-sm mr-3"> <svg version="1.1"
								id="Capa_1" xmlns="http://www.w3.org/2000/svg"
								style="width: 16px; height: 16px;"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 217.855 217.855"
								style="enable-background: new 0 0 217.855 217.855;"
								xml:space="preserve">
							<path fill="white"
									d="M215.658,53.55L164.305,2.196C162.899,0.79,160.991,0,159.002,0c-1.989,0-3.897,0.79-5.303,2.196L3.809,152.086  
									c-1.35,1.352-2.135,3.166-2.193,5.075l-1.611,52.966c-0.063,2.067,0.731,4.069,2.193,5.532c1.409,1.408,3.317,2.196,5.303,2.196  
									c0.076,0,0.152-0.001,0.229-0.004l52.964-1.613c1.909-0.058,3.724-0.842,5.075-2.192l149.89-149.889  
									C218.587,61.228,218.587,56.479,215.658,53.55z 
									M57.264,201.336l-42.024,1.28l1.279-42.026l91.124-91.125l40.75,40.743  
									L57.264,201.336z M159,99.602l-40.751-40.742l40.752-40.753l40.746,40.747L159,99.602z" />

							</svg>
						</a> <a class="btn btn-sm btn-danger oneliner-btn"><span
							aria-hidden="true">&times;</span></a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="row">
		<div class="col-12 d-flex justify-content-end">
			<nav aria-label="Standard pagination example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span>
					</a></li>
					<li class="active"><a class="page-link" href="#">1</a></li>
					<li><a class="page-link" href="#">2</a></li>
					<li><a class="page-link" href="#">3</a></li>
					<li><a
						style="border-top-right-radius: .25rem; border-bottom-right-radius: .25rem;"
						class="page-link" href="#" aria-label="Next"> <span
							aria-hidden="true">»</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>

</main>

<%@include file="../controlPanelFooter.jsp"%>