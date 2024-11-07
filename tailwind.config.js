/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{erb,html,js,md,liquid}"],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}