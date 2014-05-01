Our strange version :D :

Algo(A,l,r,p)      A_l,A_1+1,...   <   A_p      >  ... A_r-1,A_r
	if r $\leq$ l and l != p
		if A[l] <= p
			Lowlist.add(A[l])                  <----------- problem if not thread secure linked list
		else
			GreatList.add(A[l])
	else
		mid = ceil((l + r) / 2)
		spawn Algo(A,l,mid-1,p)
		Algo(A,mid,r,p)
		sync
		
		
WrapperPartition(A,p)
	Algo(A,0,n,p)
	Lowlist.add(A[p])
	Lowlist.addrange(GreatList)  // is a linked list, so can be done in constant time.
	
	
T(n) = 2*T(n/2) + O(1)  = O(n)
S(n) = T(n/2) + O(1)    = O(lg(n))

para = n / lg(n)
---------------------------------------------------------------------------------------------

wrapperpartition
	pivot <- A[p]


Algo(B,A,l,r)
	if l <= r
		if A[l] < pivot
			return l+1
		else
			return l
	else
		mid = ceil((l + r) / 2)
		res1 <- spawn Algo(A,l,mid-1)
		res2 <- Algo(A,mid,r)
		sync
		parallel copy A[res1...mid-1] to B[mid...res2]
			     and  A[mid...res2 to B[res1...mid-1]
		then 
		parallel copy B[res1...res2] to A[res1...res2]
		return mid
		
recurrence

work: W(n) = 2*W(n/2) + O(n) = O(n*lg(n))
span: S(n) = S(n/2) + O(lg(n)) = O(lg^2(n))

P(n) = W(n)/S(n) = O(n/lg(n))