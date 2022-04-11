import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class GlobalService {
  public api: string = "http://libraryv6.test/backend/index.php";
  private headerColor = "antiquewhite";

  constructor(public _http: HttpClient) { }

  makeRequest(_params: Array<any>) {
    let urlRequest: string;
    // _params.forEach((param, pos) => {
    //   if (_params.length - 1 === pos) {
    //     urlRequest += param;
    //   }
    //   else {
    //     urlRequest += param + '/';
    //   }
    // });
    urlRequest = _params.join("/");
    
    return urlRequest;
  }
}
