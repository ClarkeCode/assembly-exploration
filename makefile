ASMB = as
LINK = ld


greeting: greeting.s
	$(ASMB) -o $@.o $< 
	$(LINK) -o $@ $@.o

helloworld: helloworld.s
	$(ASMB) -o $@.o $< 
	$(LINK) -o $@ $@.o

clean:
	rm -f *.o helloworld greeting
