import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GlobalService } from '../services/global.service';
import { lastValueFrom } from 'rxjs';

@Component({
  selector: 'app-ibiblioteca',
  templateUrl: './ibiblioteca.page.html',
  styleUrls: ['./ibiblioteca.page.scss'],
})
export class IbibliotecaPage implements OnInit {
  arrayBiblio = [];
  public error: number;
  private url: string;

  constructor(
    private _globalS: GlobalService,
    public _http: HttpClient
  ) {
    this.error = -1; // Si el error no existe
  }

  ngOnInit() {
    this.get('books', []);
    // $(document).ready(function () {
    //   $("ion-fab-button").click(function () {
    //     $(".gridSearchBar").slideToggle();
    //     document.querySelector('input').value = "";
    //   });
    // });
  }

  async get(urlParam: string, params: Array<any>): Promise<void> {
    if (params.length === 0) {
      this.url = urlParam;
    } else {
      this.url = urlParam + this._globalS.makeRequest(params);
    }

    try {
      // Uso de lastValueFrom en lugar de toPromise
      const response = await lastValueFrom(this._http.get<{ data: any }>(this._globalS.api + '/' + this.url));
      this.arrayBiblio = response.data;
      console.log(this.arrayBiblio);

    } catch (error) {
      console.error('Error fetching data', error);
      this.error = 1; // Marca el error para mostrarlo en la interfaz si es necesario
    }
  }

  doRefresh(event) {
    setTimeout(() => {
      this.get('books', []);
      if (this.error === 1) {
        console.log('Error al recargar');
      }
      event.target.complete();
    }, 2000);
  }

  toCamelCase(str: string): string {
    return str
      .toLowerCase()
      .split(/[\s-_]+/)
      .map((word, index) =>
        index === 0 ? word : word.charAt(0).toUpperCase() + word.slice(1)
      )
      .join('');
  }

  getImageSrc(title: string): string {
    // Calcula la ruta de la imagen usando `toCamelCase`
    return '../../assets/img/' + this.toCamelCase(title) + '.jpg';
  }
}
