import counterUp from 'counterup2'

const countStations = () => {
    const counterElement1 = document.getElementById('counter1');
    const counterElement2 = document.getElementById('counter2');
    const counterElement3 = document.getElementById('counter3');

    const callback = entries => {
        entries.forEach( entry => {
            const el = entry.target
            if ( entry.isIntersecting && ! el.classList.contains( 'is-visible' ) ) {
                counterUp( el, {
                    duration: 500,
                    delay: 16,
                })
                el.classList.add( 'is-visible' )
            }
        } )
    }
    const IO = new IntersectionObserver( callback, { threshold: 1 } )
    const el1 = document.querySelector( '#counter1' )
    const el2 = document.querySelector( '#counter2' )
    const el3 = document.querySelector( '#counter3' )

    IO.observe(el1)
    IO.observe(el2)
    IO.observe(el3)
};

export { countStations };

// let options = {
//     root: document.querySelector('#scrollArea'),
//     rootMargin: '0px',
//     threshold: 1.0
// }
  
// let observer = new IntersectionObserver(callback, options);

// let target = document.querySelector('#counter1');

// observer.observe(target);

// let callback = (entries, observer) => {
//     entries.forEach((entry) => {
//         if (entry.isIntersecting && ! target.classList.contains( 'is-visible' )) {
//             counterUp( el, {
//                 duration: 2000,
//                 delay: 16,
//             } )
//             el.classList.add( 'is-visible' )
//         }
//     });
// };
