const roundNumber = function (rnum) {
    return Math.round(rnum * Math.pow(10, 2)) / Math.pow(10, 2);
}
module.exports = roundNumber;