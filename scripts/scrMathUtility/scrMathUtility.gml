function near_to(val, nearest) { return round(val / nearest) * nearest; }
function near_equals(val1, val2, diff) { return abs(val1 - val2) <= diff; }