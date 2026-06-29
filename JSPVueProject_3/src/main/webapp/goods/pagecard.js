const pagecard={
	props:{
		curPage:0,
		endPage:0,
		startPage:0,
		totalPage:0
	},
	// 이벤트 발생
	emits:['page-change'], // 함수 호출 => 데이터 제어 (list.jsp:Parent)
	methods:{
		range(start,end){
			let arr=[]
			let len=end-start
			for(let i=0;i<=len;i++){
				arr[i]=start
				start++
			}
			return arr
		}
	},
	template:
		`
		<ul class="pagination">
			<li v-if="startPage>1"><a class="a-link" @click="$emit('page-change',startPage-1)">&laquo;</a></li>
			<li v-for="i in range(startPage,endPage)" :class="i===curPage?'active':''"><a class="a-link" @click="$emit('page-change',i)">{{i}}</a></li>
			<li v-if="endPage<totalPage"><a class="a-link" @click="$emit('page-change',endPage+1)">&raquo;</a></li>
		</ul>
		`
}
/*
	Parent = list
	   |
	 Child = pagecard
	    Parent => Child
		       값을 전송
			   
			   데이터가 많은 경우
			   props:{
				
			   }
			   데이터가 1개인 경우
			   props:['변수']
			   
			   함수 호출
			   ------
			   emits:['함수명']
			   
			   <pagecard :start="startPage"
			   			 @함수명="pageChange">
						 
			데이터 전송 : props
			이벤트 전달 : emit
			================> $parent 사용 지양
			
			pagecard
			   |
			   | $emit('page-change',5)
			 parent <pagecard @page-change="pageChange">
			  (pageChange(5))
			   |
			   curpage=5
			   |
			   axios : 처리
			   
			$emit 사용 이유
			  1. Child Component에서는 Parent의 데이터를 직접 변경하면 안된다
			     --------------------------
				 Parent에서 변경
		      2. $emit('page-change',5)
			     => 페이지를 5페이지로 변경
				 => pageChange(5)
*/