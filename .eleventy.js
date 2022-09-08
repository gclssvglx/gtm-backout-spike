module.exports = function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("./src/scripts");

  return {
    dir: {
      input: "src",
      output: "_site",
    },
  };
};
