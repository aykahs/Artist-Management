<?php
   namespace App\Traits;
   use DB;
   trait PaginationTrait {
     public function paginate($data,$table,$searchCols,$cond) {
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
         $condqry = '';
         if(count($cond) > 0){
            $bindings[$cond[0]] = (int)$cond[1];
           $condqry = " and $cond[0] = :{$cond[0]}";
         }
         $q = "SELECT * FROM $table where deleted_at is null $query $condqry";
         $total = collect(DB::select($q,$bindings))->count();
         $bindings['perpage'] = (int)$perpage;
         $bindings['offset'] = (int)$offset;
         $qry = "SELECT * FROM $table where deleted_at is null $query $condqry  order by id desc LIMIT :perpage OFFSET :offset";
         $data = DB::select($qry, $bindings);
        }else{
         $bindings =  [$perpage, $offset];
         $q = '';
         if(count($cond) > 0){
            $bindings = [];
            $q = " and $cond[0] = :{$cond[0]}";
            $bindings[$cond[0]] = (int)$cond[1];
            $bindings['perpage'] = (int)$perpage;
            $bindings['offset'] = (int)$offset;
            $totalqry = "SELECT * FROM $table where deleted_at is null $q";
            $total = collect(DB::select($totalqry,[(int)$cond[1]]))->count();
         }else{
            $total = DB::table($table)->where('deleted_at', null)->count();

         }
         // \Log::info(json_encode($bindings));
           $data = DB::select("SELECT * FROM $table where deleted_at is null $q order by id desc LIMIT :perpage OFFSET :offset",$bindings);
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