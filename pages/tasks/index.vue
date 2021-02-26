<template>
  <div class="row">
    <div class="col-10 pt-4">
      <h2>タスク一覧</h2>
      <form class="form-inline" v-on:submit.prevent="create">
        <input type="text" v-model="task" class="form-control w-50" maxlength="30" placeholder="タスクを入力してください（必須）" required><br>
        <input type="text" v-model="detail" class="form-control w-75" maxlength="100" placeholder="詳細を入力してください">
        <button type="submit" class="btn btn-primary">追加</button>
      </form>
      <hr>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>#</th>
            <th>タスク</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="task in tasks" :key="task.id">
            <td>{{ task.id }}</td>
            <td><nuxt-link :to="{ path: '/tasks/' + task.id }">{{ task.task }}</nuxt-link></td>
            <td v-if="task.done===1"><button type="button" v-on:click="update(task.id)" class="btn btn-secondary">完了</button></td>
            <td v-else><button type="button" v-on:click="update(task.id)" class="btn btn-success">未完了</button></td>
            <td><button type="button" v-on:click="remove(task.id)" class="btn btn-danger">削除</button></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      task: '',
      detail: ''
    }
  },
  asyncData() {
    return axios
      .get("http://localhost:8080/tasks")
      .then((response) => {
        return {
          tasks: response.data
        }
      });
  },
  methods: {
    create() {
      axios.post('http://localhost:8080/tasks', { task: this.task, detail: this.detail })
        .then((response) => { this.tasks = response.data })
        .catch((error) => { console.log(error) });
      this.task = '';
      this.detail = '';
    },
    update(id) {
      axios.patch('http://localhost:8080/tasks/' + id)
        .then((response) => { this.tasks = response.data })
        .catch((error) => { console.log(error) });
    },
    remove(id) {
      axios.delete('http://localhost:8080/tasks/' + id)
        .then((response) => { this.tasks = response.data })
        .catch((error) => { console.log(error) });
    }
  }
}
</script>