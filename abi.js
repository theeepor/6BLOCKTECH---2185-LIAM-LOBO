1	// scripts/abi.js
2	// Copy the 'abi' array from Counter.json here:
3	const COUNTER_ABI = [
4	  {"inputs":[{"name":"_startCount","type":"uint256"},
5	    {"name":"_stepSize","type":"uint256"}],
6	   "stateMutability":"nonpayable","type":"constructor"},
7	  {"anonymous":false,"inputs":[
8	    {"indexed":true,"name":"by","type":"address"},
9	    {"indexed":false,"name":"newCount","type":"uint256"}],
10	   "name":"CountIncremented","type":"event"},
11	  {"anonymous":false,"inputs":[
12	    {"indexed":true,"name":"by","type":"address"}],
13	   "name":"CountReset","type":"event"},
14	  {"anonymous":false,"inputs":[
15	    {"indexed":false,"name":"count","type":"uint256"}],
16	   "name":"Milestone","type":"event"},
17	  {"inputs":[],"name":"count",
18	   "outputs":[{"type":"uint256"}],"stateMutability":"view","type":"function"},
19	  {"inputs":[],"name":"owner",
20	   "outputs":[{"type":"address"}],"stateMutability":"view","type":"function"},
21	  {"inputs":[],"name":"stepSize",
22	   "outputs":[{"type":"uint256"}],"stateMutability":"view","type":"function"},
23	  {"inputs":[],"name":"increment",
24	   "outputs":[],"stateMutability":"nonpayable","type":"function"},
25	  {"inputs":[{"name":"_amount","type":"uint256"}],"name":"incrementBy",
26	   "outputs":[],"stateMutability":"nonpayable","type":"function"},
27	  {"inputs":[],"name":"reset",
28	   "outputs":[],"stateMutability":"nonpayable","type":"function"},
29	  {"inputs":[{"name":"_newStep","type":"uint256"}],"name":"setStepSize",
30	   "outputs":[],"stateMutability":"nonpayable","type":"function"},
31	  {"inputs":[{"name":"_target","type":"uint256"}],"name":"hasReachedTarget",
32	   "outputs":[{"type":"bool"}],"stateMutability":"view","type":"function"}
33	];
34	 
35	module.exports = { COUNTER_ABI };
