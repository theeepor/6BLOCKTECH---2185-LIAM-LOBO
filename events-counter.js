1	// scripts/events-counter.js
2	const { Web3 } = require("web3");
3	require("dotenv").config();
4	const { COUNTER_ABI } = require("./abi");
5	 
6	const RPC_URL  = process.env.SEPOLIA_RPC_URL;
7	const CONTRACT = '0xYOUR_COUNTER_ADDRESS';
8	 
9	async function main() {
10	  const web3 = new Web3(RPC_URL);
11	  const counter = new web3.eth.Contract(COUNTER_ABI, CONTRACT);
12	 
13	  // Fetch all CountIncremented events from block 0 to latest
14	  const events = await counter.getPastEvents(
15	    'CountIncremented',
16	    { fromBlock: 0, toBlock: 'latest' }
17	  );
18	 
19	  console.log(`Found ${events.length} CountIncremented event(s):`);
20	  events.forEach((e, i) => {
21	    console.log(`  [${i+1}] block ${e.blockNumber}`,
22	      '| by:', e.returnValues.by,
23	      '| newCount:', e.returnValues.newCount.toString());
24	  });
25	}
26	 
27	main().catch(console.error);
