def nb_year(pn, percent, aug, p, n = 0)
  return n if pn >= p

  pn = (pn * (1 + (percent/100.0))) + aug

  n += 1

  nb_year(pn.to_i, percent, aug, p, n)
end