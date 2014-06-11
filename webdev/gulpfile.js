var gulp = require('gulp'),
  _ = require('gulp-load-plugins')(),
  lr = require('tiny-lr'),
  server = lr(),
  http = require('http'),
  ecstatic = require('ecstatic');

var paths = {
  html: ['./*.html', './partials/*.html'],
  less: './assets/less/*.less',
  sass: './assets/sass/*.scss',
  css: './assets/css',
  js: './assets/js/*.js'
};

gulp.task('html', function() {
  return gulp.src(paths.html)
    .pipe(_.livereload(server));
});

gulp.task('less', function() {
  return gulp.src(paths.less)
    //.pipe(less({compress: true}))
    .pipe(_.less({compress: false}))
    .pipe(_.autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
    .pipe(_.minifyCss({keepSpecialComments: 0}))
    .pipe(_.rename({suffix: '.min'}))
    .pipe(gulp.dest(paths.css))
    .pipe(_.livereload(server));
});

gulp.task('sass', function() {
  return gulp.src(paths.sass)
    /* // if Using SASS Compass
     * .pipe(_.compass({
     *   config_file: './config.rb',
     *   css: 'assets/css',
     *   sass: 'assets/sass'
     * }))
     */
    .pipe(_.sass())
    .pipe(_.autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
    .pipe(_.minifyCss({keepSpecialComments: 0}))
    .pipe(_.rename({suffix: '.min'}))
    .pipe(gulp.dest(paths.css))
    .pipe(_.livereload(server));
});

// Rerun the task when a file changes
gulp.task('watch', function () {
  server.listen(35729, function (err) {
    if (err) {
      return console.log(err);
    }
    gulp.watch(paths.html, ['html']);
    gulp.watch(paths.less, ['less']);
    gulp.watch(paths.sass, ['sass']);
  });
});

gulp.task('serve', function(){
  http.createServer(
    ecstatic({ root: __dirname })
  ).listen(8888);
  console.log('Listening on http://localhost:8888')
});

gulp.task('default', ['less', 'watch', 'serve']);
