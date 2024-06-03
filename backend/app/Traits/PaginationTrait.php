<?php
   namespace App\Traits;
   use DB;
   trait PaginationTrait {
     public function paginate($data,$table,$searchCols) {
        $page = $data['page'] ?? 1;
        $perpage = 10; 
        $offset = ($page - 1) * $perpage;
        $search = $data['search'];
        if($search != ''){
         $search  = '%'.$data['search'].'%';
         $query = '';
         $searchConditions = [];
         $bindings = [];
         foreach ($searchCols as $index => $col) {
            $placeholder = ":search{$index}";
            $searchConditions[] = "$col LIKE $placeholder";
            $bindings["search{$index}"] = $search;
         }
         $query .= " AND (" . implode(' OR ', $searchConditions) . ")";   
         $q = "SELECT * FROM $table where deleted_at is null $query ";
         $total = collect(DB::select($q,$bindings))->count();
         $bindings['perpage'] = (int)$perpage;
         $bindings['offset'] = (int)$offset;
         $qry = "SELECT * FROM $table where deleted_at is null $query order by id desc LIMIT :perpage OFFSET :offset";
         $data = DB::select($qry, $bindings);
        }else{
           $data = DB::select("SELECT * FROM $table where deleted_at is null order by id desc LIMIT ? OFFSET ?", [$perpage, $offset]);
           $total = DB::table($table)->where('deleted_at', null)->count();
        }
        return [
            'data'=>$data,
            'perpage' => $perpage,
            'total' => $total,
            "previouspage" => $page-1 < 0 ? 0 :$page-1 ,
            "currentpage" => (int)$page
        ];
      
     }
}