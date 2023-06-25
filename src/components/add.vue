<template>
  <div>
    <el-form ref="data" :model="obj" label-width="80px">
      <el-form-item label="商品名称">
        <el-input v-model="obj.title"></el-input>
      </el-form-item>
      <el-form-item label="商品介绍">
        <el-input v-model="obj.description"></el-input>
      </el-form-item>
      <el-form-item label="商品金额">
        <el-input v-model="obj.price"></el-input>
      </el-form-item>

      </el-form-item>
      <el-form-item label="商品图片">
        <!-- <el-input v-model="obj.img"></el-input> -->
        <el-upload
    class="avatar-uploader"
    action="http://127.0.0.1:5000/upload"
    :show-file-list="false"
    :on-success="uploadSuccess"
    :before-upload="uploadBefore"
    accept="image/*"
   >
   	 <img v-if="imgUrl" :src="imgUrl" class="avatar" />
   	 <i v-else class="el-icon-plus avatar-uploader-icon"></i>
   </el-upload>
      </el-form-item>
      <el-form-item label="发布时间" required>
        <el-input v-model="obj.created_at"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="danger" @click="btn(obj)">确认添加</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      obj: {
		title: "",
        description: "", 
        image: "", 
        price: "", 
        created_at: "",
      },
       imgUrl:"",
    };
  },
  methods: {
	btn(q){
		console.log(q)
	  const app = this;
	  this.$http.post('http://127.0.0.1:8088/add_list',q).then(function (res) {
	    if (res.data == '1') {
	      alert('商品信息添加成功');
	      app.editDialogVisible = false; // 关闭修改商品信息对话框
	      app.$router.go(0); // 刷新页面
	    } else {
	      alert('商品信息添加失败');
	    }
	  })
  },

    changeRadio(value){
      console.log(value);
      this.obj.radio=value
    }
  },
  mounted(){
    const app = this
    this.$http.get('http://127.0.0.1:8088/list').then(function (res) {
      app.userlist = res.data
  	  console.log(res.data)
    })
  }
};
</script>

<style>
.avatar-uploader {
  width: 200px;
  height: 178px;
  border: 1px dashed gray;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 200px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 200px;
  height: 178px;
  display: block;
}

</style>