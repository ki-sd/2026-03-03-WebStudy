let food=Vue.createApp({
		data(){
			return {
				curpage:1,
				totalpage:0,
				endPage:0,
				startPage:0,
				food_list:[],
				isShow:false,
				food_detail:{}
			}
		},
		mounted(){
			this.dataRecv()
		},
		methods:{
			dataRecv(){
				axios.get('../food/list_vue.do',{
					params:{
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.endPage=response.data.endPage
					this.curpage=response.data.curpage
					this.startPage=response.data.startPage
					this.totalpage=response.data.totalpage
					this.food_list=response.data.food_list
				})
			},
			// 숫자 증가 = 배열에 저장
			range(start,end){
				let arr=[]
				let len=end-start
				for(let i=0;i<=len;i++){
					arr[i]=start
					start++
				}
				return arr
			},
			move(page){
				this.curpage=page
				this.dataRecv()
			},
			detail(no){
				this.isShow=true
				axios.get('../food/detail_vue.do',{
					params:{
						no:no
					}
				}).then(response=>{
					console.log(response.data)
					this.food_detail=response.data
				})
			}
		},
		components:{
			pagecard:page_card,
			food_detail:food_detail
		}
	}).mount('.container-fluid')