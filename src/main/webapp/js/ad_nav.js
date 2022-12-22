const {createApp,ref} = Vue//vue.js
const app =createApp({
    data(){
        return{
            currentIndex:0,
            centerDialogVisible:false,//编辑信息弹窗口
            add_Visible:false,//添加房源弹窗
            delete_Visible:false,//删除用户窗口
            Approval_Visible:false,//订单管理审核

            input:'',
            sites:[
                { text: '主页', path:'#' },
                { text: '房源管理', path:'#' },
                { text: '订单管理', path:'#' },
                { text: '用户管理', path:'#' },
            ]
        }
    },
    methods:{
        change(index){//切换导航
            console.log(index)
            this.currentIndex = index;
        },
        show_input(){
            console.log(this.input)
        },
        edit(){//编辑房源
            this.centerDialogVisible = true
        },
        edithouse(){//房源编辑确认按钮
            this.centerDialogVisible = false
            var hname = document.getElementsByName("house_name")[0].value;
            var hintro = document.getElementsByName("house_intro")[0].value;
            var hstate = document.getElementsByName("house_state")[0].value;
            var hid = document.getElementsByName("house_id")[0].value;
            console.log(hid)
            console.log(hname)
            console.log(hintro)
            console.log(hstate)//获取表格中的数据
        },
        addhouse(){//添加房源确认按钮
            this.add_Visible = false
            var hname = document.getElementsByName("add_house_name")[0].value;
            var hintro = document.getElementsByName("add_house_intro")[0].value;
            console.log(hname)
            console.log(hintro)//获取表格中的数据
        }
    },
}).use(ElementPlus).mount('#app')
//vue.js

//js
var house=[{//存储房源信息
    id:1,
    name:'房源111',
    intro:'房源2222',
    state:'被使用',
}]
function edit(){
    var hname = document.getElementsByName("house_name")[0];
    var hintro = document.getElementsByName("house_intro")[0];
    var hstate = document.getElementsByName("house_state")[0];
    var hid = document.getElementsByName("house_id")[0];
    hid.setAttribute("placeholder",house[0].id);
    hname.setAttribute("placeholder",house[0].name);
    hintro.setAttribute("placeholder",house[0].intro);
    hstate.setAttribute("placeholder",house[0].state);
}
function delete_user(link){
    console.log(link);
    console.log(typeof link);
    var input_value = document.getElementById("uname");
    input_value.value = link;

}
function delete_reservation(link){
    console.log(link);
    console.log(typeof link);
    var input_value = document.getElementById("ureservation");
    input_value.value = link;

}
function delete_room(link){
    console.log(link);
    console.log(typeof link);
    var input_value = document.getElementById("uroom");
    input_value.value = link;

}
