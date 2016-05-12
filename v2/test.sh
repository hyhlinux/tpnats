
go run sub.go test < devid1.txt >> test.out &
go run sub.go test < devid2.txt >> test.out &
go run sub.go test < devid3.txt >> test.out &
echo "will start devid4.in 10s..the same as devid1"
sleep 10
echo "will start devid4...the same as devid1" >> test.out 
go run sub.go test < devid4.txt >> test.out &
