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
                <a onClick={this.handleClick}>Changing text for demo</a>
            </div>
        );
    }
}
ReactDOM.render(
    <Greeting />,
    document.getElementById('root')
);