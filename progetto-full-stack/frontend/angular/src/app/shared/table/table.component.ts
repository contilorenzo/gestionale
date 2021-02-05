
import { AfterViewInit, ChangeDetectorRef, Component, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import { MdbTableDirective, MdbTablePaginationComponent, ToastService } from 'ng-uikit-pro-standard';
import { CallService } from 'src/app/core/calls/call.service';

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit {

  @ViewChild(MdbTablePaginationComponent, { static: true })
  mdbTablePagination!: MdbTablePaginationComponent;
  @ViewChild(MdbTableDirective, { static: true })
  mdbTable!: MdbTableDirective;

  @Output()
  categoryEvent: EventEmitter<any> = new EventEmitter();

  @Output()
  updateEvent: EventEmitter<any> = new EventEmitter();

  @Input()
  elements: any = [];

  prodToChange="";

  previous: any = [];

  @Input()
  headElements:any = [];

  @Input()
  searchOption:any;

  @Input()
  tname:string="";

  constructor(private cdRef: ChangeDetectorRef,private call:CallService,private toast: ToastService) { }

  ngOnInit() {
    this.mdbTable.setDataSource(this.elements);
    this.elements = this.mdbTable.getDataSource();
    this.previous = this.mdbTable.getDataSource();

  }

  ngAfterViewInit() {
    this.mdbTablePagination.setMaxVisibleItemsNumberTo(5);
    this.mdbTablePagination.calculateFirstItemIndex();
    this.mdbTablePagination.calculateLastItemIndex();
    this.cdRef.detectChanges();
  }
  delete(el:string){
    console.log(el);
  }
  change(element:any){
    console.log("dentro");
    this.updateEvent.emit();
    
  }
  changeP(el:string){
    this.prodToChange=el;
  }

  sendCategory(id:number){
    this.categoryEvent.emit(id);
    this.toast.success("categoria selezionata")
  }

  search(value:string){
    this.call.search(this.searchOption,value).subscribe(res=>{
      this.elements=res;

    })
  }

}
