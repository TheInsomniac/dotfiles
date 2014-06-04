var gulp = require('gulp'),
    autoprefixer = require('gulp-autoprefixer'),
    less = require('gulp-less'),
    compass = require('gulp-compass'),
    rename = require('gulp-rename'),
    livereload = require('gulp-livereload'),
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
    .pipe(livereload(server));
});

gulp.task('less', function() {
  return gulp.src(paths.less)
    .pipe(less({compress: true}))
    //.pipe(less({compress: false}))
    .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest(paths.css))
    .pipe(livereload(server));
});

gulp.task('sass', function() {
  return gulp.src(paths.sass)
  .pipe(compass({
    config_file: './config.rb',
    css: 'assets/css',
    sass: 'assets/sass'
  }))
  .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
  .pipe(rename({suffix: '.min'}))
  .pipe(gulp.dest(paths.css))
  .pipe(livereload(server));
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

gulp.task('default', ['sass', 'watch', 'serve']);
