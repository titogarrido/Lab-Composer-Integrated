<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My First Blockchain App</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

  </head>

  <body>

    <header>
      <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
          <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
              <h4 class="text-white">About</h4>
              <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
            </div>
            <div class="col-sm-4 offset-md-1 py-4">
              <h4 class="text-white">Contact</h4>
              <ul class="list-unstyled">
                <li><a href="#" class="text-white">Follow on Twitter</a></li>
                <li><a href="#" class="text-white">Like on Facebook</a></li>
                <li><a href="#" class="text-white">Email me</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container d-flex justify-content-between">
          <a href="#" class="navbar-brand d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
            <strong>Cargos</strong>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </div>
    </header>

    <main role="main">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="alert alert-warning" role="alert">
                        CREATED
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="alert alert-primary" role="alert">
                          IN TRANSIT
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="alert alert-success" role="alert">
                            ARRIVED
                          </div>
                      </div>
                      <div class="col-md-3">
                          <div class="alert alert-dark" role="alert">
                              ACTIONS
                            </div>
                        </div>
            </div>
          </div>

      <div class="album py-5 bg-light">
        <div class="container">
            % for shipment in shipments:
          <div class="row">
           
            % if shipment['status'] == 'CREATED':
            <div class="col-md-3">
              % end
            % if shipment['status'] == 'IN_TRANSIT':
            <div class="col-md-3 offset-md-3">
              % end
              % if shipment['status'] == 'ARRIVED':
              <div class="col-md-3 offset-md-6">
                % end
              <div class="card mb-4 shadow-sm" ">
                <img class="card-img-top" src="static/images/{{shipment['type']}}.png" alt="{{shipment['type']}}">
                <div class="card-body">
                  <p class="card-text">
                      <i class="fas fa-microchip"></i><i class="fas fa-thermometer-empty"></i>
                      % for temp in shipment['temperatureReadings']:
                      <span class="badge badge-primary badge-pill">{{temp['centigrade']}} C</span>
                     % end
                  </p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">Contract</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">{{shipment['contract'].split('#')[-1]}}</button>
                    </div>
                    <small class="text-muted">{{shipment['unitCount']}}</small>
                  </div>
                </div>
              </div>
            </div>
            % if shipment['status'] == 'CREATED':
            <div class="col-md-3 offset-md-6">
              % end
            % if shipment['status'] == 'IN_TRANSIT':
            <div class="col-md-3 offset-md-3">
              % end
              % if shipment['status'] == 'ARRIVED':
              <div class="col-md-3">
                % end
                % if shipment['status'] != 'ARRIVED':
                <i class="fas fa-microchip"></i> Manage IoT
                <script>
                    $( document ).ready(function() {
                      $( "#range{{shipment['shipmentId']}}" ).change(function() {
                        $("#temp{{shipment['shipmentId']}}").html($("#range{{shipment['shipmentId']}}").val() + ' C');
                      });
                  });
                </script>
                <form id="form_{{shipment['shipmentId']}}" method="POST" action="/newTemp">
                    <div class="form-row align-items-center">
                        <input type="hidden" name="shipmentId" value="{{shipment['shipmentId']}}"/>
                        <input name="centigrades" type="range" class="custom-range" min="0" max="12" value="5" id="range{{shipment['shipmentId']}}">
                        <span id="temp{{shipment['shipmentId']}}">5 C</span>
                      <div class="col-auto my-1">
                        <button type="submit" class="btn btn-primary">Send Temperature</button>
                      </div>
                    </div>
                  </form>
                  <form id="form_{{shipment['shipmentId']}}" method="POST" action="/cargoArrived">
                    <div class="form-row align-items-center">
                        <input type="hidden" name="shipmentId" value="{{shipment['shipmentId']}}"/>
                      <div class="col-auto my-1">
                        <button type="submit" class="btn btn-danger">Cargo Arrived</button>
                      </div>
                    </div>
                  </form>
                  %end
                  % if shipment['status'] == 'ARRIVED':
                  <a class="btn btn-primary" href="/cargoDetails/{{shipment['shipmentId']}}" role="button">Details</a>
                  %end
            </div>
            
          </div>
          %end
        </div>
      </div>

    </main>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
