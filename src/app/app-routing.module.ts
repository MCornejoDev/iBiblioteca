import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomePageModule) },
  { path: 'author', loadChildren: () => import('./author/author.module').then(m => m.AuthorPageModule) },
  { path: 'ibiblioteca', loadChildren: () => import('./ibiblioteca/ibiblioteca.module').then(m => m.IbibliotecaPageModule) },
  { path: 'curriculum', loadChildren: () => import('./curriculum/curriculum.module').then(m => m.CurriculumPageModule) },
  { path: 'libro', loadChildren: () => import('./libro/libro.module').then(m => m.LibroPageModule) },
  { path: '**', loadChildren: () => import('./error/error.module').then(m => m.ErrorPageModule) },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
