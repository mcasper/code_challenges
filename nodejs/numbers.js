var sum = 0
for (var n = 2; n < process.argv.length; n++)
  sum += Number(process.argv[n])

console.log(sum);
