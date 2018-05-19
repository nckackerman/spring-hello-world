class Greeting extends React.Component {

    handleClick() {
        axios.get('api').then(response => {
            alert('/api response: ' + response.data);
        })
    }

    render() {
        return (
            <div>
                <p>Hello From React!</p>
                <a onClick={this.handleClick}>Click me to make a request to /api... if you get an alert, this is working</a>
            </div>
        );
    }
}
ReactDOM.render(
    <Greeting />,
    document.getElementById('root')
);