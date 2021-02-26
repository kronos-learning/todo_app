<template>
  <div class="row">
    <div class="col-10 pt-4">
      <h2>タスク詳細</h2>
      <table class="table">
        <tr>
          <th>ID</th>
          <td>{{ task.id }}</td>
        </tr>
        <tr>
          <th>タスク</th>
          <td>{{ task.task }}</td>
        </tr>
        <tr>
          <th>詳細</th>
          <td>{{ task.detail }}</td>
        </tr>
        <tr>
          <th>状況</th>
          <td>{{ task.done===0 ? '未完了' : '完了' }}</td>
        </tr>
        <tr>
          <th>登録日時</th>
          <td>{{ task.createdAt | dateFormatJp }}</td>
        </tr>
        <tr>
          <th>更新日時</th>
          <td>{{ task.updatedAt | dateFormatJp }}</td>
        </tr>
      </table>
      <nuxt-link to="/tasks">一覧へ</nuxt-link>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  asyncData(context) {
    return axios
      .get("http://localhost:8080/tasks/" + context.params.id)
      .then((response) => {
        return {
          task: response.data
        }
      });
  },
  filters: {
    dateFormatJp(value) {
      var date = new Date(value);
      return date.toLocaleString('ja-JP');
    }
  }
}
</script>