ASMB = as
LINK = ld


helloworld: helloworld.s
	$(ASMB) -o $@.o $< 
	$(LINK) -o $@ $@.o

clean:
	rm *.o helloworld
