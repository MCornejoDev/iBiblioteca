import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GlobalService {
  public api: string = "http://localhost:8080";
  private headerColor = "antiquewhite";

  constructor(public _http: HttpClient) { }

  makeRequest(_params: Array<any>) {
    let urlRequest: string;
    urlRequest = _params.join("/");

    return urlRequest;
  }
}
