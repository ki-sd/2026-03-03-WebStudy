<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.single-post .post-thumb img {
    width: 100%;
    aspect-ratio: 4 / 3;
    object-fit: cover;
    border-radius: 30px;
    transition: transform 0.3s ease-in-out;
    will-change: transform;
}
.single-post .post-thumb:hover img {
    transform: translateY(8px); 
}
.page-link:hover{
	cursor: pointer
}
</style>
</head>
<body>
    <section class="archive-area section_padding_40" id="findApp">
        <div class="container" style="width:1024px">
        	<div class="row">
        		<div class="col-12">
        			<select class="input-sm" v-model="column">
        				<option value="address">주소</option>
        				<option value="type">종류</option>
        				<option value="name">업체명</option>
        			</select>
        			<input type="text" size="20" class="input-sm" v-model="fd" @keydown.enter="find" ref="findRef">
        			<button type="button" class="btn-sm btn-outline-primary" @click="find">검색</button>
        		</div>
        	</div>
            <div class="row" style="margin-top: 20px">
                <div class="col-12 col-md-6 col-lg-4" v-for="(vo,index) in list" :key="index">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                        	<a :href="'../food/detail_before.do?no='+vo.no ">
                            <img :src="vo.poster " alt="">
                            </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">{{vo.type }}</a>
                                    </div>
                                    <!-- Post Date -->
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> {{vo.likecount }}</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>  {{vo.replycount }}</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a :href="'../food/detail.do?no='+vo.no">
                                <h4 class="post-headline">{{vo.name }}</h4>
                            </a>
                        </div>
                    </div>
                </div>
				
                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
	                                <li class="page-item" v-if="startPage>1">
	                                    <a class="page-link" @click="pageChange(startPage-1)"><i class="fa fa-angle-double-left" aria-hidden="true"></i> Prev</a>
	                                </li>
                                	
                                	<li class="page-item" :class="curpage==i?'active':'' " v-for="i in range(startPage,endPage)" :key="i"><a class="page-link" @click="pageChange(i)">{{i }}</a></li>
                                
	                                <li class="page-item" v-if="endPage<totalpage">
	                                    <a class="page-link" @click="pageChange(endPage+1)">Next <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
	                                </li>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page {{curpage }} of {{totalpage }} results</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
<script>
const findApp=Vue.createApp({
	data(){
		return{
			column:'address',
			fd:'마포',
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			list:[]
		}	
	},
	mounted(){
		this.dataRecv()
	},
	methods:{
		async dataRecv(){
			await axios.get('../food/find_vue.do',{
				params:{
					page:this.curpage,
					column:this.column,
					fd:this.fd
				}
			})
			.then(response=>{
				this.list=response.data.list
				this.curpage=response.data.curpage
				this.totalpage=response.data.totalpage
				this.startPage=response.data.startPage
				this.endPage=response.data.endPage
//				this.fd=response.data.fd
//				this.column=response.data.column
//				console.log(response)
			})
		},
		find(){
			if(!this.fd.trim()){
				this.$refs.findRef.focus()
				return
			}
			this.curpage=1
			this.dataRecv()
		},
		pageChange(page){
			this.curpage=page
			this.dataRecv()
		},
		range(start,end){
			let arr=[]
			let len=end-start
			for(let i=0;i<=len;i++){
				arr[i]=start
				start++
			}
			return arr
		}
	}
}).mount('#findApp')
</script>
</body>
</html>