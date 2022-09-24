"reach 0.1";
"use strict";
// -----------------------------------------------
// Name: KINN Active Reverse Auction (A1)
// Version: 0.1.3 - fix scope export
// Requires Reach v0.1.11-rc7 (27cb9643) or later
// ----------------------------------------------

// TYPES

export const State = (distLength) => Struct([
  ["manager", Address],
  ["token", Token],
  ["tokenAmount", UInt],
  ["currentPrice", UInt],
  ["startPrice", UInt],
  ["floorPrice", UInt],
  ["closed", Bool],
  ["endSecs", UInt],
  ["priceChangePerSec", UInt],
  ["addrs", Array(Address, distLength)],
  ["distr", Array(UInt, distLength)],
  ["royaltyCap", UInt],
  ["who", Address],
  ["timestamp", UInt],
]);

export const Params = (distLength) => Object({
  tokenAmount: UInt, // NFT token amount
  startPrice: UInt, // 100
  floorPrice: UInt, // 1
  endSecs: UInt, // 1
  addrs: Array(Address, distLength), // [addr, addr, addr, addr, addr, addr, addr, addr, addr, addr]
  distr: Array(UInt, distLength), // [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  royaltyCap: UInt, // 10
});

export const MContract = Maybe(Contract);

// FUN

const touch = Fun([], Null);
const acceptOffer = Fun([Address], Null);
const cancel = Fun([], Null);
const bid = Fun([Contract], Null);
const bidCancel = Fun([], Null);

// REMOTE FUN

export const rState = (ctc) => {
  const r = remote(ctc, { state });
  return r.state();
};

export const rTouch = (ctc) => {
  const r = remote(ctc, { touch });
  r.touch();
};

export const rAcceptOffer = (ctc, addr) => {
  const r = remote(ctc, { acceptOffer });
  r.acceptOffer(addr);
};

export const rCancel = (ctc) => {
  const r = remote(ctc, { cancel });
  r.cancel();
};

export const rBid = (ctc, rCtc) => {
  const r = remote(ctc, { bid });
  r.bid(rCtc);
};

export const rBidCancel = (ctc) => {
  const r = remote(ctc, { bidCancel });
  r.bidCancel();
};

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
