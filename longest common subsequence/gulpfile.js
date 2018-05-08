var gulp = require('gulp')
var {exec} = require('teen_process')

const mainFile = 'lcs.swift'

gulp.task('default', defaultTask)

gulp.task('watch', watch)

async function defaultTask(done) {
  return exec('swift', [mainFile]).then(
    ({stdout}) => { console.log(stdout) },
    ({stderr}) => {
      console.log(stderr)
      return Promise.reject('Swift Compilation Failed')
    }
  )
}

function watch() {
  return gulp.watch('**.swift', defaultTask)
}
