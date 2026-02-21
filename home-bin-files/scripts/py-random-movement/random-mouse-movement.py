#!/usr/bin/env python3
import pyautogui
import random
import time
import math
import sys


# ---- Random helpers ----
def rand(min_v, max_v):
    return random.random() * (max_v - min_v) + min_v


def rand_int(min_v, max_v):
    return random.randint(min_v, max_v)


# ---- easing (optional) ----
def ease_in_out_quad(t):
    if t < 0.5:
        return 2 * t * t
    return -1 + (4 - 2 * t) * t


# ---- cubic Bézier point at t (0..1) ----
def cubic_bezier(t, p0, p1, p2, p3):
    u = 1 - t
    tt = t * t
    uu = u * u
    uuu = uu * u
    ttt = tt * t
    x = uuu * p0[0] + 3 * uu * t * p1[0] + 3 * u * tt * p2[0] + ttt * p3[0]
    y = uuu * p0[1] + 3 * uu * t * p1[1] + 3 * u * tt * p2[1] + ttt * p3[1]
    return (x, y)


# ---- human-like move ----
def move_mouse_human_like():
    screen_w, screen_h = pyautogui.size()
    # pick a random target on screen
    target_x = rand_int(0, screen_w)
    target_y = rand_int(0, screen_h)

    # speed roughly like your JS: random between 10..40 (higher -> slower)
    speed = rand(10, 40)

    # map speed to duration: higher speed -> shorter movement, but add randomness
    duration = rand(0.3, 1.2) * (40.0 / speed)  # seconds

    # steps depend on duration: more steps -> smoother
    steps = max(8, int(duration * 120))  # roughly 120 samples/sec

    # get current position
    start_x, start_y = pyautogui.position()

    # sometimes overshoot: go a bit past the target then correct
    do_overshoot = random.random() < 0.25

    # control points for the Bezier curve (make them a bit random)
    def random_ctrl(x, y):
        # push control points randomly around the midpoint between start and target
        mid_x = (start_x + target_x) / 2
        mid_y = (start_y + target_y) / 2
        # random offset scaled to screen and distance
        dx = target_x - start_x
        dy = target_y - start_y
        dist = math.hypot(dx, dy) + 1
        magnitude = min(max(dist * 0.15, 30), 300)
        return (
            mid_x + rand(-magnitude, magnitude),
            mid_y + rand(-magnitude, magnitude),
        )

    ctrl1 = (start_x + rand(-100, 100), start_y + rand(-100, 100))
    ctrl2 = random_ctrl(start_x, start_y)

    # if overshoot, create an overshoot point beyond target and then a correction curve
    if do_overshoot:
        # point slightly beyond target (10-40 px)
        angle = math.atan2(target_y - start_y, target_x - start_x)
        over_dist = rand(
            10, min(120, int(math.hypot(target_x - start_x, target_y - start_y) * 0.2))
        )
        overshoot_pt = (
            target_x + math.cos(angle) * over_dist,
            target_y + math.sin(angle) * over_dist,
        )

        # first curve: start -> overshoot
        p0 = (start_x, start_y)
        p1 = ctrl1
        p2 = (
            (start_x + overshoot_pt[0]) / 2 + rand(-50, 50),
            (start_y + overshoot_pt[1]) / 2 + rand(-50, 50),
        )
        p3 = overshoot_pt

        # move to overshoot
        for i in range(steps):
            t = ease_in_out_quad(i / (steps - 1))
            x, y = cubic_bezier(t, p0, p1, p2, p3)
            # micro-jitter per step
            jx = rand_int(-3, 3)
            jy = rand_int(-3, 3)
            pyautogui.moveTo(
                max(0, min(screen_w - 1, x + jx)), max(0, min(screen_h - 1, y + jy))
            )
            time.sleep(duration / steps)

        # second curve: overshoot -> final target (short corrective)
        p0 = overshoot_pt
        p1 = (overshoot_pt[0] + rand(-40, 40), overshoot_pt[1] + rand(-40, 40))
        p2 = (target_x + rand(-20, 20), target_y + rand(-20, 20))
        p3 = (target_x, target_y)
        steps2 = max(6, int(steps * 0.4))
        for i in range(steps2):
            t = ease_in_out_quad(i / (steps2 - 1))
            x, y = cubic_bezier(t, p0, p1, p2, p3)
            jx = rand_int(-2, 2)
            jy = rand_int(-2, 2)
            pyautogui.moveTo(
                max(0, min(screen_w - 1, x + jx)), max(0, min(screen_h - 1, y + jy))
            )
            time.sleep((duration * 0.35) / steps2)

    else:
        # direct curved move start -> target
        p0 = (start_x, start_y)
        p1 = ctrl1
        p2 = ctrl2
        p3 = (target_x, target_y)
        for i in range(steps):
            t = ease_in_out_quad(i / (steps - 1))
            x, y = cubic_bezier(t, p0, p1, p2, p3)
            # micro-jitter per step
            jx = rand_int(-3, 3)
            jy = rand_int(-3, 3)
            pyautogui.moveTo(
                max(0, min(screen_w - 1, x + jx)), max(0, min(screen_h - 1, y + jy))
            )
            time.sleep(duration / steps)

    # random interval until next movement (0.7 - 2.5s)
    next_delay = rand(0.7, 2.5)
    return next_delay


def main():
    print("Human-like mover started. Press Ctrl-C to stop.")
    try:
        while True:
            delay = move_mouse_human_like()
            # tiny random idle occasionally
            if random.random() < 0.08:
                long_idle = rand(3, 10)
                time.sleep(long_idle)
            else:
                time.sleep(delay)
    except KeyboardInterrupt:
        print("\nStopped by user.")
        sys.exit(0)


if __name__ == "__main__":
    main()
