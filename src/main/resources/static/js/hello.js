class Greeting extends React.Component {
    render() {
        return (<p>Hello From React!</p>);
    }
}
ReactDOM.render(
    <Greeting />,
    document.getElementById('root')
);