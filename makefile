# makefile for text.cpp

CXX=clang++
CFLAGS=-Wall -g
OBJS=text.o page.o line.o prompt.o
HEADERS=$(subst .o,.h,$(OBJS)) # text.h page.h ...
LIBS=-lncurses

text: $(OBJS)
	$(CXX) $(CFLAGS) -o text $(OBJS) $(LIBS)

text.o:	text.cpp $(HEADERS)
	$(CXX) $(CFLAGS) -c text.cpp
	
page.o: page.cpp page.h line.h
	$(CXX) $(CFLAGS) -c page.cpp

# '$<' expands to first prerequisite file
# NOTE: this rule is already implicit
%.o: %.cpp %.h
	$(CXX) $(CFLAGS) -c $< -o $@ 

.PHONY: cleanall clean cleantxt
cleanall: clean cleantxt

clean:
	rm -f $(OBJS) text

cleantxt:
	rm -f *.txt
