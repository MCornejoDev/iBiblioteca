import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { GlobalService } from '../services/global.service';

// //Class or Models
// import { Libros } from '../class/libros';

// //Services
// import { LibrosService } from '../services/libros.service';
// import { AlertService } from '../services/alert.service';

// //Other Tools
// import { HTTP } from '@ionic-native/http/ngx';
// import { HttpClient } from '@angular/common/http';
// import { Platform, LoadingController } from '@ionic/angular';
// import { from } from 'rxjs';
// import { finalize } from 'rxjs/operators';

@Component({
  selector: 'app-ibiblioteca',
  templateUrl: './ibiblioteca.page.html',
  styleUrls: ['./ibiblioteca.page.scss'],
})
export class IbibliotecaPage implements OnInit {

  arrayBiblio = [];
  public error: Number;
  private url:string;

  constructor(
    private _globalS: GlobalService,
    public _http: HttpClient
  ) {
    this.error = -1;//Si el error no existe
  }

  ngOnInit() {
    this.get("libros", []);

    // $(document).ready(function () {
    //   $("ion-fab-button").click(function () {
    //     $(".gridSearchBar").slideToggle();
    //     document.querySelector('input').value = "";
    //   });
    // });

  }

  get(urlParam: string, params: Array<any>) {
    if (params.length === 0) {
      this.url = urlParam;
    }
    else {
      this.url = urlParam + this._globalS.makeRequest(params);
    }

    this._http.get(this._globalS.api + "/" + this.url)
      .toPromise()
      .then((response) => {
        this.arrayBiblio = response['data'];
      });
  }

  doRefresh(event) {
    setTimeout(() => {
      this.get("libros", []);
      if (this.error === 1) {
        console.log("Error al recargar");
      }
      event.target.complete();
    }, 2000);
  }
}
