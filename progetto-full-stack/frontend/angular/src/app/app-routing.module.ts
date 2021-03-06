import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '',   redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./features/home/home.module').then(m => m.HomeModule) },
  { path: 'articoli', loadChildren: () => import('./features/articoli/articoli.module').then(m => m.ArticoliModule) },
  { path: 'clienti', loadChildren: () => import('./features/clienti/clienti.module').then(m => m.ClientiModule) }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
