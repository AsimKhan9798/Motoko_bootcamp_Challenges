import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'add' : ActorMethod<[number, number], number>,
  'cos' : ActorMethod<[number], number>,
  'div' : ActorMethod<[number, number], [] | [number]>,
  'exp' : ActorMethod<[number], number>,
  'factorial' : ActorMethod<[number], number>,
  'floor' : ActorMethod<[number], bigint>,
  'log' : ActorMethod<[number], number>,
  'mul' : ActorMethod<[number, number], number>,
  'power' : ActorMethod<[number, number], number>,
  'remainder' : ActorMethod<[number, number], number>,
  'sin' : ActorMethod<[number], number>,
  'sqrt' : ActorMethod<[number], number>,
  'sub' : ActorMethod<[number, number], number>,
  'tan' : ActorMethod<[number], number>,
}
