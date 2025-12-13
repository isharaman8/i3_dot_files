const robot = require("robotjs");

// Random helpers
const rand = (min, max) => Math.random() * (max - min) + min;
const randInt = (min, max) => Math.floor(rand(min, max));

function moveMouseHumanLike() {
  const screen = robot.getScreenSize();

  // Random target on screen
  const targetX = randInt(0, screen.width);
  const targetY = randInt(0, screen.height);

  // Random interval for next movement (0.7 – 2.5 seconds)
  const nextMoveDelay = randInt(700, 2500);

  // Random speed (higher = slower movement in robotjs)
  const speed = rand(10, 40);

  // Add small jitter to feel more human
  const jitterX = randInt(-20, 20);
  const jitterY = randInt(-20, 20);

  const finalX = Math.min(Math.max(targetX + jitterX, 0), screen.width);
  const finalY = Math.min(Math.max(targetY + jitterY, 0), screen.height);

  console.log(
    `Moving to ${finalX}, ${finalY} with speed ${speed.toFixed(2)} (delay ${nextMoveDelay}ms)`,
  );

  robot.moveMouseSmooth(finalX, finalY, speed);

  // Schedule next movement with random interval
  setTimeout(moveMouseHumanLike, nextMoveDelay);
}

// Start
moveMouseHumanLike();
