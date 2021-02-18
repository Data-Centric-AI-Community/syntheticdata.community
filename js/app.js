window.onload = function () {
    const env = 'dev';
    const dom = document;
    const repoStarsEndpoint = 'https://api.github.com/repos/ydataai/ydata-synthetic';
    const starCounter = dom.getElementById('star-counter');
    
    if (env === 'dev') return;

    fetch(repoStarsEndpoint)
        .then((response) => {
            if (!response.ok) throw new Error(response.message);
            return response.json();
        }).then((data) => {    
            starCounter.innerHTML = data.stargazers_count;
        }).catch((error) => {
            starCounter.innerHTML = 'n/a';
        });
}