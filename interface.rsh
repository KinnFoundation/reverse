"reach 0.1";
"use strict";
// -----------------------------------------------
// Name: KINN Active Reverse Auction (A1)
// Version: 0.1.0 - initial, add params
// Requires Reach v0.1.11-rc7 (27cb9643) or later
// ----------------------------------------------

// TYPES

export const Params = (distLength) => Object({
  tokenAmount: UInt, // NFT token amount
  startPrice: UInt, // 100
  floorPrice: UInt, // 1
  endSecs: UInt, // 1
  addrs: Array(Address, distLength), // [addr, addr, addr, addr, addr, addr, addr, addr, addr, addr]
  distr: Array(UInt, distLength), // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  royaltyCap: UInt, // 10
});

// CONTRACT

export const Event = () => [];
export const Participants = () => [];
export const Views = () => [];
export const Api = () => [];
export const App = (_) => {
  Anybody.publish();
  commit();
  exit();
};
// ----------------------------------------------
