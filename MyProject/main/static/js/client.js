const App = {
    data() {
     return {
        status: 0, // условeн номер на текущо визуализираната секция (или група секции)
        section_title:'',
        logged_user_id: 0,
        new_request:{
            theme: '',
            description:''
            },
        requests: [],
        selected_request: 0,
        }
     },

    methods: {
        setSection(SectionName){
            if (SectionName=='начало')
                {this.status=0
                 this.section_title='Контролен панел'
                 this.loadRequests(1)}
            if (SectionName=='нова заявка')
                {this.status=1
                 this.section_title='Нова заявка'}
            if (SectionName=='детайли на заявка')
                {this.status=2
                 this.section_title='Детайли на заявка'}
            if (SectionName=='всички заявки')
                {this.status=3
                 this.section_title='Всички заявки'
                 this.loadRequests(0)}
            if (SectionName=='текущи заявки')
                {this.status=4
                 this.section_title='Текущи заявки'
                 this.loadRequests(2)}
            if (SectionName=='закрити заявки')
                {this.status=5
                 this.section_title='Закрити заявки'
                 this.loadRequests(3)}
        },
        sendRequest(){
            console.log('new user: ', this.new_user)
            axios({
                method:'POST',
                url:'/api/create_request/',
                headers:{
                    'X-CSRFToken': CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    status: 'Подадена',
                    title: this.new_request.theme,
                    message: this.new_request.description,
                }
            })
            .then(response => {
                console.log('new request id: ', response.data)
                this.createLog(response.data)
            })
        },
        loadRequests(sts){
            vm = this
            ax = '/api/requests/'+this.logged_user_id+'/'+sts+'/'
            axios.get(ax)
            .then(function(response){
                vm.requests = response.data;
                for(i=0; i<vm.requests.length; i++){
                    vm.requests[i].date = vm.toDatetimeStr(vm.requests[i].date)}
                vm.selected_request=0
                })
        },
        toDatetimeStr(d){
        let n = d.slice(11, 19) +' - ' + d.slice(8, 10) +'/'+ d.slice(5, 7) +'/'+ d.slice(0, 4)
        return n
        },
        showDetails(i){
           this.selected_request=i
           this.setSection('детайли на заявка')
        },
        createLog(r_id){
            console.log('new user: ', this.new_user)
            axios({
                method:'POST',
                url:'/api/create_log/',
                headers:{
                    'X-CSRFToken': CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    request_id: r_id,
                    client_id: this.logged_user_id,
                    action: 'Подадена',
                    message: '',
                }
            })
            .then(response => {
                console.log('status', response.data)

            })
        },
       },

    created: function(){
        this.setSection('начало')
        this.logged_user_id = USER_ID
    }
}

Vue.createApp(App).mount('#main-wrapper')