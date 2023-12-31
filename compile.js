// compile code will go here
const fs = require('fs')
const path = require('path')
const solc = require('solc')

const lotteryPath = path.resolve(__dirname, 'contracts', 'Lottery.sol');

const source = fs.readFileSync(lotteryPath, { encoding:"utf8"});

const input = {
    language: 'Solidity',
    source: {
        'Lottery.sol': {
            content: source
        },
    },
    settings: {
        outputSelection : {
            '*': {
                '*': ['*'],
            },
        },
    },
};

module.exports = JSON.parse(solc.compile(JSON.stringify(input))).contracts['Lottery.sol'].Lottery;




