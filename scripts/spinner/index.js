const cliSpinners = require('cli-spinners')
const ora = require('ora')
const spinner = ora().start() 

spinner.spinner = cliSpinners.dots
spinner.spinner = cliSpinners.dots2
spinner.spinner = cliSpinners.dots3
spinner.spinner = cliSpinners.star
spinner.spinner = cliSpinners.simpleDotsScrolling
spinner.spinner = cliSpinners.hamburger
spinner.spinner = cliSpinners.bouncingBall
spinner.spinner = cliSpinners.monkey
spinner.spinner = cliSpinners.earth
spinner.spinner = cliSpinners.pong
spinner.spinner = cliSpinners.shark
spinner.spinner = cliSpinners.weather
spinner.spinner = cliSpinners.grenade
spinner.spinner = cliSpinners.betaWave
spinner.spinner = cliSpinners.moon

//spinner.start()

let done = false
let think = setInterval(thinker, 1000)

function thinker() {
    if (done) {
        spinner.stop()
        clearInterval(think)
    } 
}

//setTimeout(()=>done=true, 3000)

console.log('going on with a task')

setTimeout(()=>{ // simulates other process
    console.log('3 seconds later')
    done = true
}, 3000)


export default spinner
