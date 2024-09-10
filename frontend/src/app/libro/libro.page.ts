import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { GlobalService } from '../services/global.service';
import { Router } from '@angular/router';
import { lastValueFrom } from 'rxjs';
import { Book } from '../models/book.model';

@Component({
  selector: 'app-libro',
  templateUrl: './libro.page.html',
  styleUrls: ['./libro.page.scss'],
})
export class LibroPage implements OnInit {
  private url: string;
  private imageSrc: string;
  private getValue;
  book: Book = { title: '' }; // Inicialización básica


  constructor(
    private _globalS: GlobalService,
    public _http: HttpClient,
    private _router: Router,
  ) {
    this.getValue = "";
  }

  ngOnInit() {
    this.getValue = this._router.getCurrentNavigation().extras.state.id;

    this.get('book', [this.getValue]).then(() => {
      if (this.book) {
        this.imageSrc = this.getImageSrc(this.book.title);
      }
    });

  }

  async get(urlParam: string, params: Array<any>): Promise<void> {
    if (params.length === 0) {
      this.url = urlParam;
    } else {
      this.url = urlParam + '/' + this._globalS.makeRequest(params);
    }

    try {
      // Uso de lastValueFrom en lugar de toPromise
      const response: { data: Book } = await lastValueFrom(this._http.get<{ data: Book }>(this._globalS.api + "/" + this.url));
      this.book = response.data;
    } catch (error) {
      console.error('Error fetching data', error);
    }
  }

  toCamelCase(str: string | undefined): string {
    return str
      ?.toLowerCase()
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
