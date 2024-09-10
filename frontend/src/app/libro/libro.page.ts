import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GlobalService } from '../services/global.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-libro',
  templateUrl: './libro.page.html',
  styleUrls: ['./libro.page.scss'],
})
export class LibroPage implements OnInit {
  private url: string;
  private getValue;
  public libro: Array<any>;

  constructor(
    private _globalS: GlobalService,
    public _http: HttpClient,
    private _router: Router,
  ) {
    this.getValue = "";
    this.libro = [];
  }

  ngOnInit() {
    this.getValue = this._router.getCurrentNavigation().extras.state.id;

    this.get('book', [this.getValue]);
    console.log(this);
  }

  get(urlParam: string, params: Array<any>) {

    if (params.length === 0) {
      this.url = urlParam;
    }
    else {
      this.url = urlParam + '/' + this._globalS.makeRequest(params);
    }

    this._http.get(this._globalS.api + "/" + this.url)
      .toPromise()
      .then((response) => {
        this.libro = response['data'];
      });
  }
}
