// Page motion, built on Motion (animate from motion/mini + inView, ~3.6 KB gzipped).
//
// Markup opts in with data-animate:
//   data-animate="intro"    children rise in on load, one after another
//   data-animate="stagger"  children rise in, one after another, when the group scrolls into view
//
// CSS keeps these children hidden only while this script is expected to run (see main.css),
// and nothing animates when the visitor asks for reduced motion.

import { animate, inView } from "./vendor/motion.js";

const root = document.documentElement;
const reduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

// Tell CSS the script is running, so its no-JS fallback stands down.
root.classList.add("motion-ready");

const ease = [0.22, 1, 0.36, 1];
const rise = { opacity: [0, 1], transform: ["translateY(8px)", "translateY(0)"] };

function reveal(items, step) {
  Array.from(items).forEach((el, i) => {
    animate(el, rise, { duration: 0.5, delay: Math.min(i, 8) * step, ease });
  });
}

if (reduced) {
  root.classList.remove("js");
} else {
  document.querySelectorAll('[data-animate="intro"]').forEach((group) => reveal(group.children, 0.06));

  document.querySelectorAll('[data-animate="stagger"]').forEach((group) => {
    const stop = inView(
      group,
      () => {
        reveal(group.children, 0.05);
        stop();
      },
      { amount: 0.1 }
    );
  });
}
