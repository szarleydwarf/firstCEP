# firstCEP
MVVM Design architecture
a.	Create an app which displays Hello World on the screen.
b.	Take the previous app and add a feature which displays list of accounts in a table view. Data is in the JSON file (Accounts.json).
c.	Take the previous app and change static JSON data to load data from a REST API. You can use jsonplaceholder.typicode.com to create a temporary static API without any coding and any server.
d.	Take the previous app and add a feature when user taps on any account, show the details (opening date, transactions etc) of the account on a new screen. You can use JSON Placeholder APIs to create a new API for list of transactions.

[
	{
		"kind": "current",
		"title": "Current Account",
		"number": "NL25 TRIO 0253 8443 20",
		"balance": 1000,
		"currency": "GBP"
	},
	{
		"kind": "current",
		"title": "Joint Account",
		"number": "NL25 TRIO 0269 8445 60",
		"balance": 1500.20,
		"currency": "USD"
	},
	{
		"kind": "savings",
		"title": "Savings Account",
		"number": "NL81 TRIO 0212  4710 66",
		"balance": 0,
		"currency": "GBP"
	},
	{
		"kind": "term",
		"title": "Term Deposit",
		"number": "NL81 TRIO 0212 4710 66",
		"balance": 13210.47,
		"currency": "GBP"
	},
	{
		"kind": "loan",
		"title": "Our home loan",
		"number": "NL25 TRIO 0253 8443 20",
		"balance": 150000,
		"currency": "GBP"
	}
]