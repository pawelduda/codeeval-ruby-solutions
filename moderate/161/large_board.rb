require_relative '161'

test_input = '*..**..**..*.*.*.**********.....*******...**.*****.*.***.*..*...*.*.**.*...***...**..****....*.*.***
..*..**......*...*........*..*....**.*.*..*.*****..*.**.***....****...*****.****.***.*.**..*........
***..****.*.*.***..*******.*...*......**..*.**.*.**.***..*.*.*.*....*..*****.*..**..*..*.**.**...*..
...**.....*...*.*......*.*.*....***.**.*..........*.*.**.*.*.*.*..*..*.*..*******...*.****..*****.*.
*.**.......**.**..*.*.*..*..*.*..**.**..*********..*.**....****..*.*...**.*.*.****.*....****.*..**.*
*.*.*...****..*....*..*.**.....**..***.....**********....*.****.**..*..****.*.*...*******.***..**.*.
..*...*..*.*.*..*....**.*.....*.**....*****....****.********.*....*...*..*.*.****.*...***..*...*...*
.*..**.*.*..*......*.**..***.*.****.*.*.*.*...*.*****.*..*.......*..*..*.*.****.**......*...*...*..*
.......*...*.**...**..*******..*..**.*..**....*..**.****.**.**...*.**..*.*.........***..**.**..*..**
**.**..*..*****.****..*....****.****..**.*.*.**.........*.***..*.*...***.....*..**..*.**.*...****...
*.*..*..**.*...*.*.*..*...*..****.***...*....*.**........**..*..*....**.*.*....***.....*..*.***....*
.**...**...*.*****.**.*.******..*...*.*.***....**....**..***.*..****.**.******.**..**.**.***.**.*..*
...*.*...**........*.*....*****.....*..***.***.....*.*.***.*...*..*****.....*...........***.**.****.
..*...****...*.**.*..*.***.*...****.*...**.*.*.*.*........**...*.**...***.*.*..**..*.**.**....*****.
.*.*.***.*.*.....*..**..**.**...*.*.*..*.....**.*.*.****...*******.****.....****..*...**...***.*****
.***.**..*....*..**.***..*.*...****..*****..*.*****..*.****.**.****.*...*....******.***.**..*..*....
.**.*.......*.*..*..*..*.**.*.*.*******.**.***********.*..........****.*....*.*...**...**********.**
*..*....***..*.*...**.*****.*.*****.*...*..*.**.*...******.......**.****.*.******.******.*.*.***...*
.***..*.*.*..**.*...***..*..*.**.**.*****.*.**.*..*....*.**...****.*...*.*..*..**.*......***.**.*...
.**...*.*....*..**.........**.......***.*.....*.......***.*****.*.**.....*.****...*..**..*.*.*..****
**.**.**.*..**...***....*..*****..*.*.**.**.*....*...*.****..*..*****.****...**.*..*...*.*...*..*..*
.**...*..*..*******..*.*.*..*....****.**...**..***..*.*....*...**..*.*.***.*...*.***..**.*..**.**...
....***..****..**.**..*****..*.*.*..***.*.**..*..***...*.**..*****.*.**..**....*.*.*..**.*....***...
*...***..**..***.*.********..*...*..**.....***..****.*.*****.**.*.****..**...**.....***.*..**..*.***
.***...**.****.**********.*......*...*......*.*******..***.****.....**.*****.......*....*.***.*..***
.*..******.***.*..*.*****....***.*.***..*.*..*....**.***.*.**.**...**....**....*.*.*..**..**..*...**
**.*..*......*.*..*..**..*....*.***...*.*.**.*...**..*...**.***.**.*...***..*......**.*..****.*.**.*
.*.*.*.**....**....*.******.*.*.***.*.*..**..**..*.***.*.****.**...*.*..*.*..*..*.**.....**..***.*.*
.....*.***..*******......*..**.....**.*...***.**.*..**...*.*......*..**.*...*....*.**......*.**.*.**
.**........*....***.*.*........**.....***.*.**..**..***..***..*..*...*....*...*.***..*.**.*.**..**.*
.*****.****.***..**.....*..*****..*.....*******.*...*.**.***...*..*...*..***.*..*..**.**.**.**..**..
*.*.*.**..*.*..*.....**..******..****..*....***...*.**..**..********..***.**.**...*....**.......*...
****.***..*...***..**.*.*..*.*****.*.****.*.*..*..*....*.*.*..**.*.******.*****..**..*...**.**.*.***
...****.*.*..***.***..*..**.*.*..******.**.****...****.....*.....***..*.***.*****....*.**....*....**
**.*..*.*.****..*....*****...*...*.**.**.**.***.....*.**.*.*.*..**.....*.*.*****.*.*.*......****...*
..**...**.*.*.**.**......*.*.**..*.***..**..*..*..*.*.*.**...**......**.*.****...***.*...*..***.....
*.**.*.***.*.....*****.**..*..*....*.**..***.**.*.......*........*.***.*...*.*.*.***....*********.*.
.*......*.****.**..**.*****.*.****.*.*..****...*****.**..**......**..*.***..***...**.***.*.*...*****
*****...**....*..*............*.....**.*.*..*..*.**..****....****..**.*.*...*..**...***..*..**..**.*
.**...*......**..*...**.***.....***...*..*..******...**.*.*....**.*...***.***....*.*.*.*....*....*..
*.***...*...*.**.....**********.....**.****.*****.....***.***....*.*..***..***...*.******....*.***.*
.*.*....*...***...*********..*..*.**.*.*...***..****..*...*.*.*.**.**...*.*..**.*..*.**.*.**..*.***.
.*****....**.*.***..*.*.**.....*..**..*...***.**.*.*...*.*.*........**..**.*..*.*....****.*.*...**..
*...*.....****.**....*.****.**....*..**.*.**.**..**.**...**.*..*......*.*..**..*...*.*.**.*.***.**..
.****.*.....**.**.*..*.*....*..*..***..*......**.*.*.*.*.******..*.***.**.*......*.*.****...**.***..
***.*****.**..*.****.**.***.*.*.**..**.**...*..*.....*...**.**...*.**.**.*.........*.......**.*.*.**
...*..*...*.**........*.*.....*.***.*.*.*.**.***.***....*..***....*.*.*.*.*..**..**.**.***.*.*.*...*
..****..*...*..*..**.*.**...***...*.****.....*......**.*.**.****.*..****.....*.*...**...*..****...*.
...**.*.**.**.**.....*.*...*.**.******..*..**.*...**.*..*.*....***..**.*.**..*.....*****...***......
..****...*..***..*..***.*.*..*........*..*..*.*.**.**.***..*.***.*..*..****..*.***.....**...**.*****
'

game_of_life = GameOfLife.new(test_input)
1000000.times do
  system 'clear'
  puts game_of_life.board
  game_of_life.iterate!
end