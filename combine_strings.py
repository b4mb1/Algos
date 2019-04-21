# Given N strings consisting of ‘R’ and ‘B’. Two strings can be only combined 
# if last character of first string and first character of second string are same. 
# Print the maximum length possible by combining strings.
#
# source: https://practice.geeksforgeeks.org/problems/combine-the-strings/0
#

def calcCombinedStr(count, array):
    br = 0
    rb = 0
    bb = 0
    rr = 0
    
    #min from rb and br
    min_diff = 0
    
    #max number of words
    max_word_num = 0
    
    #multiplier
    multpl = len(array[0])
    
    # looping through words to count occurances of words
    # starting or ending with R or B
    for element in array:
        if element.startswith("B") and element.endswith("B"):
            bb += 1
            
        if element.endswith("R") and element.startswith("R"):
            rr += 1
            
        if element.endswith("B") and element.startswith("R"):
            rb += 1
            
        if element.endswith("R") and element.startswith("B"):
            br += 1
            
        if rb == 0 and br == 0 :
            if rr + bb < 2 or (rr == 1 and bb == 1):
                max_word_num = 0
            else: 
                max_word_num = max(bb,rr)
        elif rb == br:
            max_word_num = rb + br + bb + rr
        else: 
            min_diff = 2*min(br,rb)
            if bb + rr >= 1 or min(br,rb) > 0:
                min_diff += 1
            max_word_num = min_diff + bb + rr
            
    print (max_word_num * multpl)  
        

def printMaxStr():
    text = input()
    
    for i in range(0, int(text)):
        first_line = list(map(int, input().split()))
        sec_line = list(map(str, input().split()))
        
        calcCombinedStr(first_line, sec_line)
        
    return (first_line, sec_line)
    
printMaxStr()
