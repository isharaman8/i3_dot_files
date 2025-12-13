const axios = require("axios");

async function webhookApiCall() {
  const API =
    "http://localhost:5678/webhook/7cf00608-58bf-4671-a59a-8f743deb2018";

  return axios.get(API);
}

async function n8nHinduismShortsWebhookTrigger() {
  const TIME_IN_MILLISECONDS = 390000; // 6.5 minutes
  const MAX_VIDEOS_GENERATE = 8;

  let videosGenerated = 0;

  console.log(
    `[INFO] starting trigger: max=${MAX_VIDEOS_GENERATE}, delay=${TIME_IN_MILLISECONDS}ms`,
  );

  // sequential loop ensures we don't start more than one request at a time
  while (videosGenerated < MAX_VIDEOS_GENERATE) {
    videosGenerated += 1; // count this attempt
    console.log(
      `[INFO] attempt ${videosGenerated}/${MAX_VIDEOS_GENERATE} - starting video generation`,
    );

    try {
      const response = await webhookApiCall();
      console.log(
        `[INFO] attempt ${videosGenerated} finished, status: ${response.status}`,
      );
    } catch (error) {
      console.error(
        `[ERROR] attempt ${videosGenerated} failed: ${error.message}`,
      );
      // keep behavior same as original: exit on error
      process.exit(1);
    }

    if (videosGenerated >= MAX_VIDEOS_GENERATE) {
      console.log(
        `[INFO] reached max attempts (${MAX_VIDEOS_GENERATE}). Exiting.`,
      );
      process.exit(0);
    }

    // wait before next attempt
    await new Promise((res) => setTimeout(res, TIME_IN_MILLISECONDS));
  }
}

n8nHinduismShortsWebhookTrigger();
