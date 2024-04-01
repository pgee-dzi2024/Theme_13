const actions=['Подадена', 'Приета', 'Работи се', 'Затворена']
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
        clients: [{id:0, firs_name:'', last_name:''}],
        selected_client: 0,
        action_message:'',
        log: [],
        }
     },

    methods: {
        setSection(SectionName){
            if (SectionName=='начало')
                {this.status=0
                 this.section_title='Контролен панел'
                 this.loadRequests(1)
                 this.loadLog(0)
                 }
            if (SectionName=='детайли на заявка')
                {this.status=2
                 this.section_title='Детайли на заявка'
                 this.loadLog(this.requests[this.selected_request].id)}
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
        loadClients(){
            vm = this
            ax = '/api/user/0/'
            axios.get(ax)
            .then(function(response){
                vm.clients = response.data;
                vm.selected_client=0
                })
        },
        loadRequests(sts){
            vm = this
            ax = '/api/requests/'+this.clients[this.selected_client].id+'/'+sts+'/'
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
        refreshSection(){
            if (this.status==0){this.loadRequests(1)}
            if (this.status==3){this.loadRequests(0)}
            if (this.status==4){this.loadRequests(2)}
            if (this.status==5){this.loadRequests(3)}
        },
        createLog(action){
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
                    request_id: this.requests[this.selected_request].id,
                    client_id: this.requests[this.selected_request].user_id,
                    action: actions[action],
                    message: this.action_message,
                }
            })
            .then(response => {
                console.log('status', response.data)

            })
        },
        updateRequest(action){
            axios({
                method:'POST',
                url:'/api/update_status/',
                headers:{
                    'X-CSRFToken': CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    rid: this.requests[this.selected_request].id,
                    action: actions[action],
                }
            })
            .then(response => {
                this.createLog(action)
            })
        },
        showDetails(i){
           this.selected_request=i
           this.setSection('детайли на заявка')
        },
        loadLog(rid){
            vm = this
            ax = '/api/log/'+this.clients[this.selected_client].id+'/'+rid+'/'
            axios.get(ax)
            .then(function(response){
                vm.log = response.data;
                for(i=0; i<vm.log.length; i++){
                    vm.log[i].date = vm.toDatetimeStr(vm.log[i].date)}
                })
        },
       },

    created: function(){
        this.setSection('начало')
        this.logged_user_id = USER_ID
        this.selected_client=0
        this.loadClients()
    }
}

Vue.createApp(App).mount('#main-wrapper')
