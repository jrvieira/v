type bl = enum
   v, f

proc id[t](a: t): t =
   a

proc nt(p: bl): bl =
   case p
   of v:
      f
   else:
      v

proc nd(p,q: bl): bl =
   case p
   of v:
      q
   else:
      p

proc ou(p,q: bl): bl =
   case p
   of v:
      p
   else:
      q

echo nt(f)
echo nt(v)

echo nd(f,f)
echo nd(v,f)
echo nd(f,v)
echo nd(v,v)

echo ou(f,f)
echo ou(v,f)
echo ou(f,v)
echo ou(v,v)
