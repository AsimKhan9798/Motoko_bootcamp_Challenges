export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'add' : IDL.Func([IDL.Float64, IDL.Float64], [IDL.Float64], []),
    'cos' : IDL.Func([IDL.Float64], [IDL.Float64], []),
    'div' : IDL.Func([IDL.Float64, IDL.Float64], [IDL.Opt(IDL.Float64)], []),
    'exp' : IDL.Func([IDL.Float64], [IDL.Float64], []),
    'factorial' : IDL.Func([IDL.Float64], [IDL.Float64], []),
    'floor' : IDL.Func([IDL.Float64], [IDL.Int], []),
    'log' : IDL.Func([IDL.Float64], [IDL.Float64], []),
    'mul' : IDL.Func([IDL.Float64, IDL.Float64], [IDL.Float64], []),
    'power' : IDL.Func([IDL.Float64, IDL.Float64], [IDL.Float64], []),
    'remainder' : IDL.Func([IDL.Float64, IDL.Float64], [IDL.Float64], []),
    'sin' : IDL.Func([IDL.Float64], [IDL.Float64], []),
    'sqrt' : IDL.Func([IDL.Float64], [IDL.Float64], []),
    'sub' : IDL.Func([IDL.Float64, IDL.Float64], [IDL.Float64], []),
    'tan' : IDL.Func([IDL.Float64], [IDL.Float64], []),
  });
};
export const init = ({ IDL }) => { return []; };
