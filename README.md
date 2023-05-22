# Motoko_bootcamp_Challenges

Running the project locally
To test the project locally, use the following commands:

# Starts the replica, running in the background
dfx start --clean --background

# Install packages for front-end
  1. npm i

# First time, canisters will need to be created, built and the back-end deployed and the declarations generated.
  1. npm run create
  2. npm run backend
  3. npm run deploy

# Deploys the canisters to the replica and generates the candid interface
 1. dfx deploy

Once the job completes, the application will be available at http://localhost:4943?canisterId={asset_canister_id}.

Additionally, if you are making frontend changes, you can start a development server with

 1. npm run dev
  
Which will start a server at http://localhost:8080, proxying API requests to the replica at port 4943.
