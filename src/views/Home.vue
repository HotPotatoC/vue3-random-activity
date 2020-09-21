<template>
  <Navbar />
  <Container class="mt-32">
    <div class="flex flex-wrap">
      <div class="w-full">
        <h1 class="font-bold leading-tight text-4xl md:text-6xl mb-12">
          Are You Bored?
        </h1>
        <h1 class="font-bold leading-tight text-2xl md:text-4xl">
          👇 Just click this button
        </h1>
        <button
          @click="fetchRandomActivity"
          class="mt-4 px-6 py-3 md:px-8 md:py-5 bg-primary shadow-md text-white text-base md:text-lg font-bold rounded-full border-none focus:outline-none hover:underline"
        >
          New Random Activity
        </button>
      </div>
      <div v-if="activity" class="w-full mt-12">
        <div class="flex justify-between items-center">
          <button
            class="p-4 font-bold text-xl border-none focus:outline-none hover:underline"
          >
            Filters
          </button>
          <button
            @click="clearFilters"
            class="p-4 font-bold text-xl text-primary border-none focus:outline-none hover:underline"
          >
            Clear
          </button>
        </div>
        <div
          class="mb-6 px-6 py-4 bg-gray-200 text-black shadow-inner rounded-lg"
        >
          <div class="flex flex-wrap justify-between items-baseline">
            <div class="flex space-x-4">
              <p>Activity Type:</p>
              <select
                v-model="filter.type"
                class="px-1 md:px-4 rounded-md border focus:outline-none"
              >
                <option>Education</option>
                <option>Recreational</option>
                <option>Social</option>
                <option>DIY</option>
                <option>Charity</option>
                <option>Cooking</option>
                <option>Relaxation</option>
                <option>Music</option>
                <option>Busywork</option>
              </select>
            </div>
            <div class="flex space-x-4">
              <p>Participants:</p>
              <input
                v-model="filter.participants"
                type="number"
                name="participants"
                class="px-1 md:px-4 rounded-md border focus:outline-none"
              />
            </div>
          </div>
        </div>
        <div class="p-4 md:p-8 bg-primary text-white shadow-lg rounded-lg">
          <h1 class="leading-none font-bold text-4xl md:text-6xl">
            {{ activity.activity }}
          </h1>
          <h2 class="text-2xl md:text-4xl text-gray-800">
            {{ activity.type }}
          </h2>
          <a
            v-if="activity.link"
            :href="activity.link"
            target="_blank"
            class="mt-6 text-xl hover:underline"
            >{{ activity.link }}</a
          >
        </div>
      </div>
    </div>
  </Container>
</template>

<script>
import { onMounted, ref } from "vue";
import axios from "../services/api";
import Navbar from "@/components/Navbar";
import Container from "@/components/Container";

export default {
  name: "Home",
  components: {
    Navbar,
    Container
  },
  setup() {
    let activity = ref({});
    const filter = ref({
      type: null,
      participants: 1
    });

    const fetchRandomActivity = async () => {
      const { data } = await axios.get("/activity", {
        params: {
          type: filter.value.type ? filter.value.type.toLowerCase() : null,
          participants: filter.value.participants
        }
      });

      activity.value = data;
    };

    const clearFilters = () => {
      filter.value.type = null;
      filter.value.participants = 1;
    };

    onMounted(fetchRandomActivity);

    return {
      activity,
      filter,
      fetchRandomActivity,
      clearFilters
    };
  }
};
</script>
