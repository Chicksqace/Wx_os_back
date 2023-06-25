<template>
  <div class="list">
    <!-- 面包屑导航区域 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>数据分析</el-breadcrumb-item>
      <el-breadcrumb-item>分析列表</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 卡片视图区域 -->
    <el-card>
        <div class="num">总交易额：{{ this.zongNum }}元</div>
      <!-- 搜索与添加区域 -->
      <div id="myChart" :style="{ width: '520px', height: '400px' }"></div>
    </el-card>
  </div>
</template>

<script>
// import echarts from 'echarts'
import * as echarts from 'echarts';
export default {
  data () {
    return {
      zongNum: 6396, // 总交易额
      chartData: { // 折线图数据
        xAxis: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
        series: [{
          name: '销量',
          type: 'line',
          data: [5, 20, 36, 10, 10, 20, 15]
        }]
      }
    }
  },
  mounted () {
    const myChart = echarts.init(document.getElementById('myChart'))
    myChart.setOption({
      title: {
        text: '交易量趋势'
      },
      tooltip: {},
      legend: {
        data: ['销量']
      },
      xAxis: {
        type: 'category',
        boundaryGap: false,
        data: this.chartData.xAxis
      },
      yAxis: {},
      series: this.chartData.series
    })
  }
}
</script>

<style lang="less" scoped>
.num {
  width: 220px;
  height: 60px;
  background-color: #DC143C;
  opacity: 0.6;
  border-radius: 12px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
  color: white;
  font-weight: bold;
}
</style>
