1	// scripts/read-counter.js
2	// Run with:  node scripts/read-counter.js
3	 
4	const { Web3 } = require("web3");
5	require("dotenv").config();
6	const { COUNTER_ABI } = require("./abi");
7	 
8	// ── Configuration ─────────────────────────────────────────────
9	const RPC_URL    = process.env.SEPOLIA_RPC_URL;
10	const CONTRACT   = '0xYOUR_COUNTER_ADDRESS'; // paste your address
11	 
12	async function main() {
13	  // Connect Web3.js to Sepolia via the RPC URL
14	  const web3 = new Web3(RPC_URL);
15	 
16	  // Create a contract instance (read-only — no wallet needed)
17	  const counter = new web3.eth.Contract(COUNTER_ABI, CONTRACT);
18	 
19	  // Read state variables — .call() is free, no gas needed
20	  const count    = await counter.methods.count().call();
21	  const owner    = await counter.methods.owner().call();
22	  const stepSize = await counter.methods.stepSize().call();
23	 
24	  console.log('=== Counter Contract State ===');
25	  console.log('Contract address:', CONTRACT);
26	  console.log('count:   ', count.toString());
27	  console.log('owner:   ', owner);
28	  console.log('stepSize:', stepSize.toString());
29	 
30	  // Call a view function with a parameter
31	  const reached = await counter.methods
32	    .hasReachedTarget(10).call();
33	  console.log('Has reached 10?', reached);
34	 
35	  // Read the contract's ETH balance (should be 0 — no payable fns)
36	  const bal = await web3.eth.getBalance(CONTRACT);
37	  console.log('Contract ETH balance:', web3.utils.fromWei(bal,'ether'), 'ETH');
38	}
39	 
40	main().catch(console.error);
