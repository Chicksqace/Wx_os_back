<template>
  <div>
    <!-- 面包屑导航区域 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>用户管理</el-breadcrumb-item>
      <el-breadcrumb-item>账号管理</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片视图区域 -->
    <el-card>
      <!-- 搜索与添加区域 -->
      <el-row :gutter="20">
        <el-col :span="8">
          <el-input placeholder="请输入用户名" v-model="searchQuery" clearable @clear="getUserList()">
            <el-button slot="append" icon="el-icon-search"></el-button>
          </el-input>
        </el-col>
      </el-row>

      <!-- 用户列表区域 -->
      <el-table :data="userlist" border stripe>
        <el-table-column align="center" type="index" ></el-table-column>
        <el-table-column align="center" label="用户id" prop="user_id"></el-table-column>
        <el-table-column align="center" label="用户账号" prop="user_phone"></el-table-column>
		<el-table-column align="center" label="用户昵称" prop="user_nickname"></el-table-column>
        <el-table-column align="center" label="操作" width="180px" >
          <template slot-scope="scope">
            <!-- 修改按钮 -->
            <el-button type="primary" plain icon="el-icon-edit" size="mini" @click="showEditDialog(scope.row)"></el-button>
            <!-- 删除按钮 -->
            <el-button type="danger" plain icon="el-icon-delete" size="mini" @click="delete_p(scope.row)"></el-button>
          </template>
        </el-table-column>
      </el-table>
	      <!-- 修改用户对话框 -->
    <el-dialog title="修改用户信息" :visible.sync="editDialogVisible" width="30%">
      <el-form :model="editUser" label-width="80px">
        <el-form-item label="用户id">
          <el-input v-model="editUser.user_id" disabled></el-input>
        </el-form-item>
        <el-form-item label="用户账号">
          <el-input v-model="editUser.user_phone"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="editDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="confirmEdit">确 定</el-button>
      </div>
    </el-dialog>
    </el-card>


  </div>
</template>

<script>
export default {
  data() {
    return {
      searchQuery:"",  // 搜索
      userlist:  [],
      // 控制添加用户对话框的显示与隐藏
      addDialogVisible: false,
      // 添加用户的表单数据
      addForm: {
        user: '',
        paw: '',
      },
      // 控制修改用户对话框的显示与隐藏
      editDialogVisible: false,
      // 查询到的用户信息对象
      editForm: {},
	  editUser: {},
      // 控制分配角色对话框的显示与隐藏
      setRoleDialogVisible: false,
    }
  },
  created() {
    // this.getUserList()
  },
  methods: {
	  delete_p(id){
		  console.log(id.user_id)
		const app = this
		this.$http.post('http://127.0.0.1:8088/delete_p', { user_id: id.user_id }).then(function (res) {
		  if (res.data == '1') alert(id.user_phone + '删除成功')
		  else alert(id.user_phone + '删除失败')
		  app.$router.go(0)
		})
	  },
    async getUserList() {
        const { data: res } = await this.$http.get('getUser');
      this.userlist = res.list
      console.log('ssss'+res.list)
    },
	showEditDialog(row) {
	      // 修改代码开始
	      this.editDialogVisible = true;
	      this.editUser = Object.assign({}, row); // 使用Object.assign()创建一个独立的对象，以避免直接修改原始数据
	      // 修改代码结束
	    },
	    confirmEdit() {
	      const app = this;
	      this.$http
	        .post("http://127.0.0.1:8088/update_p", {
	          user_id: this.editUser.user_id,
	          user_phone: this.editUser.user_phone,
	        })
	        .then(function (res) {
	          if (res.data == "1") alert("修改成功");
	          else alert("修改失败");
	          app.editDialogVisible = false; // 关闭修改对话框
	          app.getUserList(); // 重新获取用户列表
			  app.$router.go(0)
	        });
		}
},
  mounted() {
    const app = this
    this.$http.get('http://127.0.0.1:8088/users').then(function (res) {
      app.userlist = res.data
	  console.log(res.data)
    })
  }
}
</script>

<style lang="less" scoped>
.addUser{
  position: absolute;
  right: 50px;
}
</style>
