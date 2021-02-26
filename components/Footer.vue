<template>
  <div class="row">
    <div class="col-md-10 pt-5 text-center">
      <p class="copyright">{{ copyright }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return { copyright: "Copyright © 2021 Kelonos Inc. All Rights Reserved." };
  }
};
</script>

<style>
.copyright {
  color: #797979;
  font-size: 14px;
}
</style>