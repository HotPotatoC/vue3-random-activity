<template>
  <nav class="w-full fixed z-10 top-0 py-2 bg-white shadow-md">
    <Container>
      <div class="flex justify-center items-center">
        <router-link to="/">
          <h1 class="text-2xl">Random Activity</h1>
        </router-link>
      </div>
    </Container>
  </nav>
</template>

<script>
import Container from "./Container";
export default {
  components: {
    Container
  }
};
</script>
