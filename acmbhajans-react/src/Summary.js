import React from "react";
import { 
    Col, 
    Container, 
    Row,
    ToggleButton,
    ToggleButtonGroup } from 'react-bootstrap'
import { AutoSizer, Grid } from 'react-virtualized'
import styles from './Grid.css';


export class Summary extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            event: 'practice',
            bhajan_summary: {},
            attendance_summary: {},


            overscanColumnCount: 0,
            overscanRowCount: 10,
            rowHeight: 40,
        };


        this._cellRenderer = this._cellRenderer.bind(this);
        this._getColumnWidth = this._getColumnWidth.bind(this);
        this._getRowClassName = this._getRowClassName.bind(this);
        this._noContentRenderer = this._noContentRenderer.bind(this);

    }
   
    componentDidMount() {
    }

    componentWillUnmount() {
        
    }

    fetchSummaryTable() {
        let loadUrl = `http://localhost:1234/renditions/summarize?event=${this.state.event}`; 
        fetch(loadUrl)
        .then(res => res.json())
        .then(data => {
            this.setState({
                ...data
            })
        });
    }


    handleChange (e) {
        this.setState({ event: e }, () => this.fetchSummaryTable())
    }


    _getRowClassName(row) {
        return row % 2 === 0 ? styles.evenRow : styles.oddRow;
      }
      
      
    _cellRenderer({columnIndex, key, rowIndex, style}) {
        const rowClass = this._getRowClassName(rowIndex);
        
        return <div className="cell" style={style}>{rowIndex}///{columnIndex}</div>;
    }

    _noContentRenderer() {
        return <div className="noCells">No cells</div>;
      }    

    _getColumnWidth({index}) {
        switch (index) {
          case 0:
            return 50;
          case 1:
            return 100;
          case 2:
            return 300;
          default:
            return 80;
        }
      }

    render() {
        return (
        <Container>
            <Row>
                <Col>
                    <ToggleButtonGroup 
                        type="radio" 
                        name="options"
                        defaultValue='practice'
                        value={this.state.event} 
                        onChange={(e) => this.handleChange(e)}>
                        <ToggleButton variant="outline-primary" value='practice'>Practice</ToggleButton>
                        <ToggleButton variant="outline-primary" value='satsang'>Satsang</ToggleButton>
                    </ToggleButtonGroup>
                </Col>
            </Row>

            <Row>
            <AutoSizer disableHeight>
            {({width}) => (
                <Grid
                cellRenderer={this._cellRenderer}
                className={styles.BodyGrid}
                columnWidth={this._getColumnWidth}
                columnCount={Object.keys(this.state.attendance_summary).length}
                height={500}
                noContentRenderer={this._noContentRenderer}
                overscanColumnCount={this.state.overscanColumnCount}
                overscanRowCount={this.state.overscanRowCount}
                rowHeight={this.state.rowHeight}
                rowCount={50}
                width={width}
                />
            )}
            </AutoSizer>

            </Row>
        </Container>);
    }
}